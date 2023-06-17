using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Stripe;
using Stripe.Checkout;
using System.Security.Claims;
using WebApp_CommonHelper;
using WebApp_DataAccessLayer.Intrastructure.IRepository;
using WebApp_Models;
using WebApp_Models.ViewModels;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize]
    public class OrderController : Controller
    {
        private IUnitOfWork _unitOfWork;
        public OrderController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        #region ApiCall
        public IActionResult AllOrders(string status)
        {
            IEnumerable<OrderHeader> orderHeader;
            if (User.IsInRole("Admin") || User.IsInRole("Employee"))
            {
                orderHeader = _unitOfWork.OrderHeader.GetAll(includeProperties: "ApplicationUser");
            }
            else
            {
                var claimsIdentity = (ClaimsIdentity)User.Identity;
                var claims = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
                orderHeader = _unitOfWork.OrderHeader.GetAll(x => x.ApplicationUserId == claims.Value);
            }
            switch (status)
            {
                case "pending":
                    orderHeader = orderHeader.Where(x => x.PaymentStatus == PaymentStatus.StatusPanding);
                    break;

                case "approved":
                    orderHeader = orderHeader.Where(x => x.PaymentStatus == PaymentStatus.StatusApproved);
                    break;

                case "underprocess":
                    orderHeader = orderHeader.Where(x => x.OrderStatus == OrderStatus.StatusInProcess);
                    break;

                case "shipped":
                    orderHeader = orderHeader.Where(x => x.OrderStatus == OrderStatus.StatusShipped);
                    break;


                default:
                    break;
            }




            return Json(new { data = orderHeader });
        }

        #endregion
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult OrderDetails(int id)
        {
            OrderViewModel order = new OrderViewModel()
            {
                OrderHeader = _unitOfWork.OrderHeader.GetT(x => x.Id == id, includeProperties: "ApplicationUser"),
                OrderDetails = _unitOfWork.OrderDetail.GetAll(x => x.OrderHeaderId == id, includeProperties: "Product")
            };
            return View(order);
        }
        [Authorize(Roles = WebsiteRole.Role_Admin + "," + WebsiteRole.Role_Employee)]
        [HttpPost]
        public IActionResult OrderDetails(OrderViewModel vm)
        {
            var orderHeader = _unitOfWork.OrderHeader.GetT(x => x.Id == vm.OrderHeader.Id);
            orderHeader.Name = vm.OrderHeader.Name;
            orderHeader.Phone = vm.OrderHeader.Phone;
            orderHeader.Address = vm.OrderHeader.Address;
            orderHeader.City = vm.OrderHeader.City;
            orderHeader.State = vm.OrderHeader.State;
            orderHeader.PostalCode = vm.OrderHeader.PostalCode;
            if (vm.OrderHeader.Carrier != null)
            {
                orderHeader.Carrier = vm.OrderHeader.Carrier;
            }
            if (vm.OrderHeader.TrackingNumber != null)
            {
                orderHeader.TrackingNumber = vm.OrderHeader.TrackingNumber;
            }
            _unitOfWork.OrderHeader.Update(orderHeader);
            _unitOfWork.Save();
            TempData["success"] = "Info Updated";
            //OrderViewModel order = new OrderViewModel()
            //{
            //    OrderHeader = _unitOfWork.OrderHeader.GetT(x => x.Id == id, includeProperties: "ApplicationUser"),
            //    OrderDetails = _unitOfWork.OrderDetail.GetAll(x => x.Id == id, includeProperties: "Product")
            //};
            return RedirectToAction("OrderDetails", "Order", new { id = vm.OrderHeader.Id });
        }
        [Authorize(Roles = WebsiteRole.Role_Admin + "," + WebsiteRole.Role_Employee)]
        public IActionResult InProccess(OrderViewModel vm)
        {
            _unitOfWork.OrderHeader.UpdateStatus(vm.OrderHeader.Id, OrderStatus.StatusInProcess);
            _unitOfWork.Save();
            TempData["success"] = "Order Status Updated-Inprocess";
            return RedirectToAction("OrderDetails", "Order", new { id = vm.OrderHeader.Id });

        }
        [Authorize(Roles = WebsiteRole.Role_Admin + "," + WebsiteRole.Role_Employee)]
        public IActionResult Shipped(OrderViewModel vm)
        {
            var orderHeader = _unitOfWork.OrderHeader.GetT(x => x.Id == vm.OrderHeader.Id);
            orderHeader.Carrier = vm.OrderHeader.Carrier;
            orderHeader.TrackingNumber = vm.OrderHeader.TrackingNumber;
            orderHeader.OrderStatus = OrderStatus.StatusShipped;
            orderHeader.DateOfShipping = DateTime.Now;
            _unitOfWork.OrderHeader.Update(orderHeader);
            _unitOfWork.Save();
            TempData["success"] = "Order Status Updated-Shipped";
            return RedirectToAction("OrderDetails", "Order", new { id = vm.OrderHeader.Id });
        }
        [Authorize(Roles = WebsiteRole.Role_Admin + "," + WebsiteRole.Role_Employee)]
        public IActionResult CancelOrder(OrderViewModel vm)
        {
            var orderHeader = _unitOfWork.OrderHeader.GetT(x => x.Id == vm.OrderHeader.Id);
            if (orderHeader.PaymentStatus == PaymentStatus.StatusApproved)
            {
                var refund = new RefundCreateOptions
                {
                    Reason = RefundReasons.RequestedByCustomer,
                    PaymentIntent = orderHeader.PaymentIntenId
                };
                var service = new RefundService();
                Refund refunds = service.Create(refund);
                _unitOfWork.OrderHeader.UpdateStatus(orderHeader.Id, OrderStatus.StatusCancelled, OrderStatus.StatusRefund);
            }
            else
            {
                _unitOfWork.OrderHeader.UpdateStatus(orderHeader.Id, OrderStatus.StatusCancelled, OrderStatus.StatusCancelled);
            }
            _unitOfWork.Save();
            TempData["success"] = "Order Cancelled";
            return RedirectToAction("OrderDetails", "Order", new { id = vm.OrderHeader.Id });
            return View();
        }
        public IActionResult PayNow(OrderViewModel vm)
        {
            var OrderHeader = _unitOfWork.OrderHeader.GetT(x => x.Id == vm.OrderHeader.Id, includeProperties: "ApplicationUser");
            var OrderDetails = _unitOfWork.OrderDetail.GetAll(x => x.OrderHeaderId == vm.OrderHeader.Id, includeProperties: "Product");
            var domain = "https://localhost:7175/";
            var options = new SessionCreateOptions
            {
                LineItems = new List<SessionLineItemOptions>(),
                Mode = "payment",
                SuccessUrl = domain + $"customer/cart/ordersuccess?id={vm.OrderHeader.Id}",
                CancelUrl = domain + $"customer/cart/Index"
            };
            foreach (var item in OrderDetails)
            {

                var lineItemsOptions = new SessionLineItemOptions
                {
                    PriceData = new SessionLineItemPriceDataOptions
                    {
                        UnitAmount = (long)(item.Product.Price * 100),
                        Currency = "INR",
                        ProductData = new SessionLineItemPriceDataProductDataOptions
                        {
                            Name = item.Product.Name,
                        },

                    },
                    Quantity = item.Count,
                };
                options.LineItems.Add(lineItemsOptions);
            }
            var service = new SessionService();
            Session session = service.Create(options);
            _unitOfWork.OrderHeader.PaymentStatus(vm.OrderHeader.Id, session.Id, session.PaymentIntentId);
            _unitOfWork.Save();



            Response.Headers.Add("Location", session.Url);
            return new StatusCodeResult(303);

            return RedirectToAction("Index");
        }
    }
}
