using Microsoft.AspNetCore.Mvc;
using PortfolioBizObjects;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace PortfolioWeb.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProfileController : ControllerBase
    {
        // GET: api/<ProfileController>
        [HttpGet]
        public bizProfile Get()
        {
            bizProfile profile = new();
            var lst = bizProfile.GetAll();
            if (lst.Count() > 0)
            {
                profile = lst[0];
            }
            return profile;
        }

        [HttpGet("devsections")]
        public List<bizDevSection> DevSectionGet()
        {
            var lst = bizDevSection.GetAll();
            return lst;
        }

        [HttpGet("devsubsections")]
        public List<bizDevSubsection> DevSubsectionGet()
        {
            var lst = bizDevSubsection.GetAll();
            return lst;
        }

        [HttpGet("devsubsectionelements")]
        public List<bizDevSubsectionElement> DevSubsectionElementGet()
        {
            var lst = bizDevSubsectionElement.GetAll();
            return lst;
        }

        [HttpGet("devtools")]
        public List<bizDevTool> DevToolGet()
        {
            var lst = bizDevTool.GetAll();
            return lst;
        }
        [HttpGet("devtoolsforsubsection")]
        public List<bizDevTool> DevToolGetForSubsection(string DevSubsectionCode)
        {
            var lst = bizDevTool.GetList("DevSubsectionCode", DevSubsectionCode);
            return lst;
        }

        [HttpGet("devtooltypes")]
        public List<bizDevToolType> DevToolTypeGet()
        {
            var lst = bizDevToolType.GetAll();
            return lst;
        }
    }
}
