using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp_DataAccessLayer.Intrastructure.IRepository;
using WebApp_Models;

namespace WebApp_DataAccessLayer.Intrastructure.Repository
{
    public class CategoryRepository : Repository<Category>, ICategoryRepository
    {
        private ApplicationDbContext _context;
        public CategoryRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public void Update(Category category)
        {
            var categorydb = _context.Category.FirstOrDefault(x => x.Id == category.Id);
            if (categorydb != null)
            {
                categorydb.Name = category.Name;
                categorydb.DisplayOrder = category.DisplayOrder;
            }
        }
    }
}
