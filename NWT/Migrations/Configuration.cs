namespace NWT.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using NWT.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<NWT.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "NWT.Models.ApplicationDbContext";
        }

        protected override void Seed(NWT.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.

            // add the admin role
            context.Roles.AddOrUpdate(r => r.Name, new IdentityRole { Name = "admin" });

            // add an initial admin to the system (add new user and assign them the admin role
            if (!context.Users.Any(u => u.UserName == "jojo@gamil.com"))
            {
                var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context));
                var user = new ApplicationUser { UserName = "jojo@gmail.com", Email = "jojo@gmail.com" };

                manager.Create(user, "Password4$");
                manager.AddToRole(user.Id, "admin");
            }


        }
    }
}
