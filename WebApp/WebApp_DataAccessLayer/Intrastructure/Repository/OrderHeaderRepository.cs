using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp_DataAccessLayer.Intrastructure.IRepository;
using WebApp_Models;

namespace WebApp_DataAccessLayer.Intrastructure.Repository
{
    public class OrderHeaderRepository : Repository<OrderHeader>, IOrderHeaderRepository
    {
        private ApplicationDbContext _context;
        public OrderHeaderRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public void PaymentStatus(int id, string sessionId, string paymentIntentId)
        {
            var orderHeader = _context.OrderHeaders.FirstOrDefault(x => x.Id == id);
            orderHeader.DateOfPayment = DateTime.Now;
            orderHeader.PaymentIntenId = paymentIntentId;
            orderHeader.SessionId = sessionId;
        }

        public void Update(OrderHeader orderHeader)
        {
            _context.OrderHeaders.Update(orderHeader);
            //var categorydb = _context.Category.FirstOrDefault(x => x.Id == category.Id);
            //if (categorydb != null)
            //{
            //    categorydb.Name = category.Name;
            //    categorydb.DisplayOrder = category.DisplayOrder;
            //}
        }

        public void UpdateStatus(int id, string orderStatus, string? paymentStatus = null)
        {
            var order = _context.OrderHeaders.FirstOrDefault(x => x.Id == id);
            if (order != null)
            {
                order.OrderStatus = orderStatus;
            }
            if (paymentStatus != null)
            {
                order.PaymentStatus = paymentStatus;
            }
        }
    }
}
