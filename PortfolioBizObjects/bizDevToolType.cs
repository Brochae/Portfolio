using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevToolType: bizObject<bizDevToolType>
    {
        public int DevToolTypeId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevToolTypeName { get; set; } = "";
        public string DevToolTypeCode { get; set; } = "";
        public int DevToolTypeSequenceNum { get; set; }
        public bool ShowOnHomePage { get; set; }
    }
}
