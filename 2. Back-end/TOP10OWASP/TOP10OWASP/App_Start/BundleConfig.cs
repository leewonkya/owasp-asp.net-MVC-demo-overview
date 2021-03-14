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
            bundles.Add(new ScriptBundle("~/bundles/template/script").Include(
                        "~/Scripts/template/jquery.min.js",
                        "~/Scripts/template/bootstrap.bundle.min.js",
                        "~/Scripts/template/Chart.min.js",
                        "~/Scripts/template/sb-admin-2.min.js",
                        "~/Scripts/template/chart-pie-demo.js",
                        "~/Scripts/template/chart-area-demo.js"
                        ));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.


            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/style.css",
                      "~/Content/bootstrap.min.css",
                      "~/Content/darcula.css",
                      "~/Content/smart_wizard_all.min.css"));
            bundles.Add(new StyleBundle("~/Content/template/css").Include(
                      "~/Content/template/sb-admin-2.min.css",
                      "~/Content/template/all.min.css"));
        }
    }
}
