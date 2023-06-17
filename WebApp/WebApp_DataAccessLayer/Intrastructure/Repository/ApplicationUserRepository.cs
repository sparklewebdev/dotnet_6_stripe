using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp_DataAccessLayer.Intrastructure.IRepository;
using WebApp_Models;

namespace WebApp_DataAccessLayer.Intrastructure.Repository
{
    public class ApplicationRepository : Repository<ApplicationUser>, IApplicationUser
    {
        private ApplicationDbContext _context;
        public ApplicationRepository(ApplicationDbContext context) : base(context)
        {
            _context = context;
        }
    }
}
