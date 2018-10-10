using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate.Repositories
{
    public class ReportRepository:BaseRepository
    {

        public List<Report> GetReports()
        {
            return this.m_Context.Reports.OrderBy(r => r.CategoryId).ThenBy(r => r.SequenceNumber).ThenBy(r => r.ReportDescription).ToList();
        }
    }
}