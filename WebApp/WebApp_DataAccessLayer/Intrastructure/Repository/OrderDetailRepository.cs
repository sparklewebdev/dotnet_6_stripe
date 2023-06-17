using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp_DataAccessLayer.Intrastructure.IRepository;
using WebApp_Models;

namespace WebApp_DataAccessLayer.Intrastructure.Repository
{
    public class OrderDetailRepository : Repository<OrderDetails>, IOrderDetailRepository
    {
        private ApplicationDbContext _context;
        public OrderDetailRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public void Update(OrderDetails orderDetails)
        {
            _context.OrderDetails.Update(orderDetails);
            //var categorydb = _context.Category.FirstOrDefault(x => x.Id == category.Id);
            //if (categorydb != null)
            //{
            //    categorydb.Name = category.Name;
            //    categorydb.DisplayOrder = category.DisplayOrder;
            //}
        }
    }
}
