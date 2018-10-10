using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class BankRepository: BaseRepository
    {
        public System.Collections.IList GetBanks()
        {
            return (from p in this.m_Context.Banks
                    orderby p.BankDescription
                    select new { BankDescription = p.BankDescription, BankId = p.BankId}).ToList();
        }
    }
}