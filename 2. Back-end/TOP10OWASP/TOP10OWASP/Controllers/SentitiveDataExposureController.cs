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
            var modelOwasp = _db.CATEGORies.ToList();
            
            SelectList items = new SelectList(model, "ID", "NAME");
            SelectList itemsOwasp = null;
            foreach (var obj in modelOwasp)
            {
                itemsOwasp = new SelectList(modelOwasp, "ID" == code.EncodeFromUser(obj.ID.ToString()), "NAME");
            }

            ViewBag.list = items;
            ViewBag.listOwasp = itemsOwasp;
            return View();
        }
    }
}