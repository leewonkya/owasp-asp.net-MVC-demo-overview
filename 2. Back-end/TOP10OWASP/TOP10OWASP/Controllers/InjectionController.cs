using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TOP10OWASP.Models;

namespace TOP10OWASP.Controllers
{
    public class InjectionController : Controller
    {
        // GET: Injection
        private TOP10OWASPEntities _db = new TOP10OWASPEntities();
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

        [HttpPost]
        public ActionResult LoginByOwasp(string username, string password)
        {            
            if(username == null || password == null)
            {
                return RedirectToAction("Index"); 
            }
            var checkUser = _db.USERACCOUNTOWASPs.Where(x => x.USERNAME.Equals(username)).SingleOrDefault();
            if(checkUser == null)
            {                ViewBag.message = "Tài khoản không tồn tại";
                return RedirectToAction("Index");

            }
            else
            {
                string passwordEncodeUser = EncodeFromUser(password);
                string passwordEncodeFromDb = EncodeFromDb(checkUser.PASSWORD);

                if (passwordEncodeUser.Equals(passwordEncodeFromDb))
                {
                    return View(checkUser);
                }
            }

            return RedirectToAction("Error");
        }

        public ActionResult Error()
        {
            return View();
        }

        private string EncodeFromDb(byte[] input)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] hashBytes = input;
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("x2"));
            }
            return sb.ToString();
        }
        
        private string EncodeFromUser(string input)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] inputBytes = Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            // Convert the byte array to hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("x2"));
            }
            return sb.ToString();
        }

    }
}