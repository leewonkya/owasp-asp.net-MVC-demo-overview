using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TOP10OWASP.Controllers
{
    public class InsecureDirectObjectReferencesController : Controller
    {
        // GET: InsecureDirectObjectReferences
        public ActionResult Index()
        {
            return View();
        }
    }
}