using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApp_CommonHelper
{
    public static class OrderStatus
    {
        public const string StatusPanding = "Pending";
        public const string StatusInProcess = "UnderProccessing";
        public const string StatusRefund = "Refunded";
        public const string StatusApproved = "Approved";
        public const string StatusCancelled = "Cancelled";
        public const string StatusShipped = "Shipped";
    }
}
