using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Common;
using TOP10OWASP.Models;

namespace TOP10OWASP.Controllers
{
    public class InjectionController : Controller
    {
        // GET: Injection
        private TOP10OWASPEntities1 _db = new TOP10OWASPEntities1();
        cEncode code = new cEncode();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]        
        public ActionResult LoginByInjection(string username, string password)
        {
            var model = _db.USERACCOUNTs.SqlQuery("SELECT * FROM USERACCOUNT WHERE USERNAME = '" + username + "' AND PASSWORD = '" + password + "'").ToList();
            return View(model);
        }

        [HttpGet]
        public ActionResult LoginByOwasp(USERACCOUNT obj)
        {
            var checkUser = _db.USERACCOUNTOWASPs.Where(x => x.USERNAME.Equals(obj.USERNAME)).SingleOrDefault();
            if (checkUser == null)
            {
                return Json("Tài khoản hoặc mật khẩu không chính xác", JsonRequestBehavior.AllowGet);
            }
            else
            {
                string passwordEncodeUser = code.EncodeFromUser(obj.PASSWORD);
                string passwordEncodeFromDb = code.EncodeFromDb(checkUser.PASSWORD);

                if (passwordEncodeUser.Equals(passwordEncodeFromDb))
                {
                    return Json("Xin chào " + checkUser.NAME, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json("Tài khoản hoặc mật khẩu không chính xác", JsonRequestBehavior.AllowGet);
                }
            }
        }         
    }
}