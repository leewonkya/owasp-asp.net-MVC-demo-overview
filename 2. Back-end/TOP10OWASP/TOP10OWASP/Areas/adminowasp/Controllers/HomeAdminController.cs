using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Common;

namespace TOP10OWASP.Areas.adminowasp.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: adminowasp/HomeAdmin

        cEncode code = new cEncode();
        public ActionResult Index()
        {
            var SessionID = HttpContext.Request.Cookies.Get("USER_SESSION").Value.ToString();
            string roleId = code.EncodeFromUser("1");

            var SessionRole = (UserLogin)Session["SESSION_ROLE"];

            if (SessionID.Equals(roleId) && SessionRole.Equals("admin"))
            {
                return View();
            }
            else{
                return RedirectToAction("Error");
            }
        }

        public ActionResult Error()
        {
            return View();
        }
    }
}