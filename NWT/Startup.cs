using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NWT.Startup))]
namespace NWT
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
