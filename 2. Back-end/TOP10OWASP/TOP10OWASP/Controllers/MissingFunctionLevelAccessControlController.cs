using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Models;
using TOP10OWASP.Common;

namespace TOP10OWASP.Controllers
{
    public class MissingFunctionLevelAccessControlController : Controller
    {
        // GET: MissingFunctionLevelAccessControl
        TOP10OWASPEntities _db = new TOP10OWASPEntities();
        cEncode code = new cEncode();
        public ActionResult Index()
        {
            return View();
        }

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
                    Session.Add("session_role", userSession);


                    HttpCookie myCookie = new HttpCookie("user_session", code.EncodeFromUser(model.ID.ToString()));
                    myCookie.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(myCookie);
                    return View(model);
                }
            }
            return View();
        }
    }
}