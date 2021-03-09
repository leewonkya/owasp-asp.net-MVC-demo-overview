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

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var model = _db.USERACCOUNTs.Where(x => x.USERNAME.Equals(username) && x.PASSWORD.Equals(password)).SingleOrDefault();
            return View(model);
        }

        [HttpPost]
        public ActionResult LoginWithOwasp(string username, string password)
        {
            var model = _db.USERACCOUNTOWASPs.Where(x => x.USERNAME.Equals(username)).SingleOrDefault();

            if (model != null)
            {
                string passwordEncodeUser = code.EncodeFromUser(password);
                string passwordEncodeFromDb = code.EncodeFromDb(model.PASSWORD);

                if (passwordEncodeUser.Equals(passwordEncodeFromDb))
                {
                    var userSession = new UserLogin();
                    userSession.role = model.ROLE;
                    Session.Add("IDOF", userSession);


                    HttpCookie myCookie = new HttpCookie("IDOF", code.EncodeFromUser(model.ID.ToString()));
                    myCookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(myCookie);
                    return View(model);
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult GetUser(int id)
        {
            var model = _db.USERACCOUNTs.Find(id);
            return View(model);
        }

        [HttpGet]
        public ActionResult GetUserOwasp(int? id)
        {
            if(id != null)
            {
                var model = _db.USERACCOUNTOWASPs.Find(id);

                ViewBag.password = code.EncodeFromDb(model.PASSWORD);

                var SessionID = HttpContext.Request.Cookies.Get("IDOF").Value.ToString();
                string roleId = code.EncodeFromUser("1");

                var SessionRole = (UserLogin)Session["IDOF"];

                if (SessionID.Equals(roleId) && SessionRole.Equals("admin"))
                {
                    return View(model);
                }
                else
                {
                    return RedirectToAction("Error");
                }
            }
            else
            {
                return RedirectToAction("Index");                
            }
        }

        public ActionResult Error()
        {
            return View();
        }
    }
}