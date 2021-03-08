using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Common;

namespace TOP10OWASP.Areas.admin.Controllers
{
    public class homeAdminController : Controller
    {
        // GET: admin/homeAdmin
        public ActionResult Index()
        {
            var role = HttpContext.Request.Cookies.Get("dataType").Value.ToString();
            var userSession = (UserLogin)Session["SESSION_ROLE"];
            if(role.Equals("admin"))
            {
                return View();
            }
            else    
            {
                return RedirectToAction("Error");
            }
        }

        public ActionResult Index2()
        {
            return View();
        }

        public ActionResult Error()
        {
            return View();
        }
    }
}