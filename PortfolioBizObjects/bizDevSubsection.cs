using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevSubsection : bizObject<bizDevSubsection>
    {
        public int DevSubsectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public int DevSectionId { get; set; }
        public string DevSectionCode { get; set; } = "";
        public string DevSubsectionCode { get; set; } = "";
        public string DevSubsectionName { get; set; } = "";
        public string DevSubsectionDesc { get; set; } = "";
        public string GitHubRepoName { get; set; } = "";
        public int DevSubsectionSequenceNum { get; set; }
    }
}
