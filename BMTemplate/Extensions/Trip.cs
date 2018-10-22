using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate
{
    public partial class Trip
    {
        
        public Vehicle Vehicle { get; set; }

        public GarageCard GarageCard { get; set; }        

        public string DriverName { get; set; }

        public string WorkflowName { get; set; }
    }
    public class TripPoco: Trip
    {
        
    }
}