using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace app.Controllers
{
    [Authorize(Roles = "view")]
    public class HomeController : Controller
    {
        
        public ActionResult Index()
        {
            return View();
        }

        [Authorize (Roles ="delete")]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        [Authorize (Roles ="edit")]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}