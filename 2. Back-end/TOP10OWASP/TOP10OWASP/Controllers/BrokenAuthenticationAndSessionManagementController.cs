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
    public class BrokenAuthenticationAndSessionManagementController : Controller
    {
        // GET: BrokenAuthenticationAndSessionManagement
        TOP10OWASPEntities _db = new TOP10OWASPEntities();
        cEncode code = new cEncode();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(string username, string password)
        {
            var model = _db.USERACCOUNTs.Where(x => x.USERNAME.Equals(username) && x.PASSWORD.Equals(password)).SingleOrDefault();

            var userSession = new UserLogin();
            userSession.role = model.ROLE;            
            Session.Add("SESSION_ROLE", userSession);

            string roles = model.ROLE;
            HttpCookie myCookie = new HttpCookie("dataType", roles);
            myCookie.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(myCookie);
            return View(model);
        }

        public ActionResult LoginWithOwasp(string username, string password)
        {
            var model = _db.USERACCOUNTOWASPs.Where(x => x.USERNAME.Equals(username)).SingleOrDefault();

            if(model != null)
            {
                string passwordEncodeUser = code.EncodeFromUser(password);
                string passwordEncodeFromDb = code.EncodeFromDb(model.PASSWORD);

                if (passwordEncodeUser.Equals(passwordEncodeFromDb))
                {
                    var userSession = new UserLogin();
                    userSession.role = model.ROLE;
                    Session.Add("SESSION_ROLE", userSession);

                    
                    HttpCookie myCookie = new HttpCookie("USER_SESSION", code.EncodeFromUser(model.ID.ToString()));
                    myCookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(myCookie);
                    return View(model);
                }
            }
            return View();
        }
    }
}