using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TOP10OWASP.Controllers
{
    public class MissingFunctionLevelAccessControlController : Controller
    {
        // GET: MissingFunctionLevelAccessControl
        public ActionResult Index()
        {
            return View();
        }
    }
}