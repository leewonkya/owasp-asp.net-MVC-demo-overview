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
        TOP10OWASPEntities _db = new TOP10OWASPEntities();
        cEncode code = new cEncode();
        public ActionResult Index()
        {
            var model = _db.CATEGORies.ToList();
            
            SelectList items = new SelectList(model, "ID", "NAME");
            

            ViewBag.list = items;
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
    }
}