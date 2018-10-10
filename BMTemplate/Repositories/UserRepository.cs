using BMTemplate.Enums;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BMTemplate.Extensions;

namespace BMTemplate.Repositories
{
    public class UserRepository: BaseRepository
    {

        private IQueryable<User> getAllUsers()
        {
            var user = this.GetUser(CurrentUser.GetUserName());

            if (user == null)
            {
                return null;
            }

            var userId = user.UserId;
            var OfficeTypeId = user.Office.OfficeTypeId;
            var offices = new OfficeRepository().GetOfficesByProv(user.Office.ProvinceId).ToIds();

            if (OfficeTypeId == (int)OfficeTypes.HEADOFFICE)
            {
                return (from u in this.m_Context.Users
                        where u.UserId != userId
                        orderby u.UserName
                        select u);
            }
            else
            {
                return (from u in this.m_Context.Users
                        where u.UserId != userId
                        && offices.Any(new Func<int, bool>(i => i == u.OfficeId))
                        orderby u.UserName
                        select u);
            }
        }

        public IList GetAllUsers()
        {
            return this.getAllUsers().ToList();
        }

        public IList GetUsersByUserName(string userName)
        {
            return this.getAllUsers().Where(q => q.UserName.Contains(userName)).ToList();
        }

        public IList GetUsersByPersal(string persal)
        {
            return this.getAllUsers().Where(q => q.EmployeeNumber.Contains(persal)).ToList();
        }

        public User GetUser(string userName)
        {
            return (from u in this.m_Context.Users
                    where u.UserName.Contains(userName)
                    orderby u.UserName
                    select u).SingleOrDefault();
        }

        public User GetUserById(long userId)
        {
            return (from u in this.m_Context.Users
                    where u.UserId.Equals(userId)
                    orderby u.UserName
                    select u).SingleOrDefault();
        }

        public bool AddUser(User user)
        {
            this.m_Context.Users.Add(user);

            return this.m_Context.SaveChanges() > 0;
        }

        public bool UpdateUser(User user)
        {
            /*this.m_Context.Database.Log = s =>
            { 
                System.Diagnostics.Debug.Print(s);
            };*/

            return this.m_Context.SaveChanges() > 0;
        }
    }
}