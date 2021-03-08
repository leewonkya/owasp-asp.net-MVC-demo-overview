using System.Web.Mvc;

namespace TOP10OWASP.Areas.adminowasp
{
    public class adminowaspAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "adminowasp";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "adminowasp_default",
                "adminowasp/{controller}/{action}/{id}",
                new {controller="HomeAdmin", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}