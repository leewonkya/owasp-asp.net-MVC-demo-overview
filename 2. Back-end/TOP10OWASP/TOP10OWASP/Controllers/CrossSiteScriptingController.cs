using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Models;

namespace TOP10OWASP.Controllers
{
    public class CrossSiteScriptingController : Controller
    {
        // GET: CrossSiteScripting
        TOP10OWASPEntities1 _db = new TOP10OWASPEntities1();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateInput(false)]
        public ActionResult xss(string message)
        {
            var data = new MESSAGE();
            data.MESSAGE1 = message;
            _db.MESSAGEs.Add(data);
            _db.SaveChanges();
            var messageId = data.ID;
            var model = _db.MESSAGEs.Find(messageId);
            return View(model);
        }

        [HttpPost]
        [ValidateInput(true)]
        public ActionResult xssOwasp(string message)
        {
            var data = new MESSAGE();
            data.MESSAGE1 = message;
            _db.MESSAGEs.Add(data);
            _db.SaveChanges();
            if (data.ID > 0)
            {
                var messageId = data.ID;
                var model = _db.MESSAGEs.Find(messageId);
                return View(model);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
    }
}