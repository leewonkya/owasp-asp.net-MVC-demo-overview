using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TOP10OWASP.Controllers
{
    public class SecurityMissconfigurationController : Controller
    {
        // GET: SecurityMissconfiguration
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowException()
        {
            throw new Exception("Khi bạn nhìn thấy lỗi này, Hacker có thể tìm ra lỗ hỏng và tấn công vào hệ thống của bạn!!");
        }
    }
}