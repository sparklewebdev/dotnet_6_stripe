using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApp_CommonHelper;
using WebApp_DataAccessLayer;
using WebApp_DataAccessLayer.Intrastructure.IRepository;
using WebApp_Models;
using WebApp_Models.ViewModels;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles =WebsiteRole.Role_Admin)]
    public class CategoryController : Controller
    {
        private IUnitOfWork _unitOfWork;
        public CategoryController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IActionResult Index()
        {
            CategoryViewModel category = new CategoryViewModel();
            category.categories = _unitOfWork.Category.GetAll();
            return View(category);
        }
        //[HttpGet]
        //public IActionResult Create()
        //{
        //    return View();
        //}
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public IActionResult Create(Category category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _unitOfWork.Category.Add(category);
        //        _unitOfWork.Save();
        //        TempData["Success"] = "Category Created Successfully.";
        //        return RedirectToAction("Index");
        //    }
        //    return View(category);
        //}
        [HttpGet]
        public IActionResult CreateUpdate(int? id)
        {
            CategoryViewModel category = new CategoryViewModel();
            if (id == null || id == 0)
            {
                return View(category);
            }
            else
            {
                category.Category = _unitOfWork.Category.GetT(x => x.Id == id);
                if (category.Category == null)
                {
                    return NotFound();
                }
                else
                {
                    return View(category);  
                }
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateUpdate(CategoryViewModel vm)
        {
            if (ModelState.IsValid)
            {
                if (vm.Category.Id==0)
                {
                    _unitOfWork.Category.Add(vm.Category);
                    TempData["Success"] = "Category Created Successfully.";
                }
                else
                {
                    _unitOfWork.Category.Update(vm.Category);
                    TempData["Success"] = "Category Updated Successfully.";
                }
                _unitOfWork.Save();
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
            {
                return NotFound();
            }
            var category = _unitOfWork.Category.GetT(x => x.Id == id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteData(int? id)
        {
            var category = _unitOfWork.Category.GetT(x => x.Id == id);
            if (category == null)
            {
                return NotFound();
            }
            _unitOfWork.Category.Delete(category);
            _unitOfWork.Save();
            TempData["Success"] = "Category Deleted Successfully.";
            return RedirectToAction("Index");
        }
    }
}
