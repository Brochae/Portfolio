using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace PortfolioBizObjects
{
    public class bizDevTool: bizObject<bizDevTool>
    {
        public int DevToolId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string DevToolTypeName { get; set; } = "";
        public string DevToolTypeCode { get; set; } = "";
        public string DevToolCode { get; set; } = "";
        public string DevToolName { get; set; } = "";
        public bool HasIcon { get; set; }
        public int DevToolSequenceNum { get; set; }
    }
}
