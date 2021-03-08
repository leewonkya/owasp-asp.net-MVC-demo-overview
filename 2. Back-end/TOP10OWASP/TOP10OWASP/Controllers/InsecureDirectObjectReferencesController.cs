using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Models;
using TOP10OWASP.Common;

namespace TOP10OWASP.Controllers
{
    public class InsecureDirectObjectReferencesController : Controller
    {
        // GET: InsecureDirectObjectReferences
        TOP10OWASPEntities _db = new TOP10OWASPEntities();
        cEncode code = new cEncode();
        public ActionResult Index()
        {
            return View();
        }

        
    }
}