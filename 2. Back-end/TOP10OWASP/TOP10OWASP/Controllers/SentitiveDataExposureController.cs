using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Models;
using TOP10OWASP.Common;


namespace TOP10OWASP.Controllers
{
    public class SentitiveDataExposureController : Controller
    {
        // GET: SentitiveDataExposure
        TOP10OWASPEntities1 _db = new TOP10OWASPEntities1();
        cEncode code = new cEncode();
        public ActionResult Index()
        {
            var model = _db.CATEGORies.ToList();
            var model1 = _db.CATEGORYOWASPs.ToList();
            
            SelectList items = new SelectList(model, "ID", "NAME");
            SelectList items1 = new SelectList(model1, "URL", "NAME");
            

            ViewBag.list = items;
            ViewBag.list1 = items1;
            return View(model);
        }

        
        public ActionResult LoadProduct(int CategoryId)
        {
            if(CategoryId != 0)
            {
                var model = _db.PRODUCTs.Where(x => x.CATEGORY_ID == CategoryId).ToList();
                return View(model);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
        public ActionResult LoadProductByUrl(string URL)
        {
            if(URL != null)
            {
                var model = _db.CATEGORYOWASPs.Where(x => x.URL.Equals(URL)).SingleOrDefault();
                int categoryId = model.ID;
                var product = _db.PRODUCTOWASPs.Where(x => x.CATEGORY_ID == categoryId).ToList();
                return View(product);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
    }
}