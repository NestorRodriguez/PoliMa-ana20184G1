using app.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace app
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ApplicationDbContext db = new ApplicationDbContext();

            CrearRoles(db);
            CrearSuperUsuario(db);
            CrearUsuario(db);
            CrearVendedor(db);
            AsignarPermiso(db);
            db.Dispose();
        }

        private void CrearRoles(ApplicationDbContext db)
        {
            var rolemanager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(db));
            if (!rolemanager.RoleExists("view"))
            {
                rolemanager.Create(new IdentityRole("view"));
            }

            if (!rolemanager.RoleExists("edit"))
            {
                rolemanager.Create(new IdentityRole("edit"));
            }

            if (!rolemanager.RoleExists("delete"))
            {
                rolemanager.Create(new IdentityRole("delete"));
            }
        }

        private void CrearSuperUsuario(ApplicationDbContext db)
        {
            var usermanager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
            var user = usermanager.FindByName("admin@hotmail.com");
            if (user == null)
            {
                user = new ApplicationUser
                {
                    UserName = "admin@hotmail.com",
                    Email = "admin@hotmail.com"
                };

                usermanager.Create(user, "Abc123-");
            }

        }
        private void CrearUsuario(ApplicationDbContext db)
        {
            var usermanager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
            var user = usermanager.FindByName("usuario@hotmail.com");
            if (user == null)
            {
                user = new ApplicationUser
                {
                    UserName = "usuario@hotmail.com",
                    Email = "usuario@hotmail.com"
                };

                usermanager.Create(user, "Abc123-");
            }

        }

        private void CrearVendedor(ApplicationDbContext db)
        {
            var usermanager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
            var user = usermanager.FindByName("vendedor@hotmail.com");
            if (user == null)
            {
                user = new ApplicationUser
                {
                    UserName = "vendedor@hotmail.com",
                    Email = "vendedor@hotmail.com"
                };

                usermanager.Create(user, "Abc123-");
            }

        }

        private void AsignarPermiso(ApplicationDbContext db)
        {
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(db));
            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(db));

            var user = userManager.FindByName("admin@hotmail.com");

            if (!userManager.IsInRole(user.Id, "view"))
            {
                userManager.AddToRole(user.Id, "view");
            }

            if (!userManager.IsInRole(user.Id, "edit"))
            {
                userManager.AddToRole(user.Id, "edit");
            }

            if (!userManager.IsInRole(user.Id, "delete"))
            {
                userManager.AddToRole(user.Id, "delete");
            }

            var user2 = userManager.FindByName("usuario@hotmail.com");

            if (!userManager.IsInRole(user2.Id, "view"))
            {
                userManager.AddToRole(user2.Id, "view");
            }

            var user3 = userManager.FindByName("vendedor@hotmail.com");

            if (!userManager.IsInRole(user3.Id, "view"))
            {
                userManager.AddToRole(user3.Id, "view");
            }

            if (!userManager.IsInRole(user3.Id, "edit"))
            {
                userManager.AddToRole(user3.Id, "edit");
            }

        }
    }
}
