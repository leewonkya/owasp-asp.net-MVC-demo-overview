using System.Web;
using System.Web.Optimization;

namespace TOP10OWASP
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/bundles/script").Include(
                        "~/Scripts/jquery-3.5.1.min.js",
                        "~/Scripts/bootstrap.min.js",
                        "~/Scripts/ace.js",
                        "~/Scripts/highlight.min.js",
                        "~/Scripts/jquery.smartWizard.min.js",
                        "~/Scripts/script.js"
                        ));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.


            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/style.css",
                      "~/Content/bootstrap.min.css",
                      "~/Content/darcula.css",
                      "~/Content/smart_wizard_all.min.css"));
        }
    }
}
