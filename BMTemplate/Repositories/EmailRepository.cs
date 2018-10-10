using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace BMTemplate.Repositories
{
    public class EmailRepository : BaseRepository
    {
        private string senderAddress;
        private string senderName;
        private string senderPassword;
        public EmailRepository()
        {
            this.senderAddress = "vehiclemansystems@gmail.com";
            this.senderName = "Vehicle Management System";
            this.senderPassword = "MOKmok12";
        }
        public bool SendEmail(string toAddresss, string toName, string subject, string body)
        {
            var fromAddress = new MailAddress(this.senderAddress, this.senderName);
            var toAddress = new MailAddress(toAddresss, toName);

            try
            {

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    Credentials = new NetworkCredential(fromAddress.Address, senderPassword),
                    Timeout = 20000
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body
                })
                {
                    smtp.Send(message);
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}