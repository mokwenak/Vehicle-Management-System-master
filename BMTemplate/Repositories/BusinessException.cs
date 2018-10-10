using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class BusinessException: Exception
    {
        public BusinessException(string message): base(message)
        {

        }
    }
}