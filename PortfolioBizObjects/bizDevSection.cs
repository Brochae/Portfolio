using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevSection : bizObject<bizDevSection>
    {
        public int DevSectionId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevSectionCode { get; set; } = "";
        public string DevSectionName { get; set; } = "";
        public string DevSectionOverview { get; set; } = "";
        public string DevSectionBlurb { get; set; } = "";
        public int DevSectionSequenceNum { get; set; }
    }
}
