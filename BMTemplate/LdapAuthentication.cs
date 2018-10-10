using System;
using System.Text;
using System.Collections;
using System.DirectoryServices;
using System.DirectoryServices.ActiveDirectory;

namespace FormsAuth
{
    public class LdapAuthentication
    {
        private string _path;
        private string _filterAttribute;

        public LdapAuthentication(string path)
        {
            _path = path;
        }

        public bool IsAuthenticated(string domain, string username, string pwd)
        {
            string domainAndUsername = domain + @"\" + username;
            DirectoryEntry entry = new DirectoryEntry(_path, domainAndUsername, pwd,AuthenticationTypes.None);

            try
            {
                //Bind to the native AdsObject to force authentication.
                object obj = entry.NativeObject;
              
                
                DirectorySearcher search = new DirectorySearcher(entry);

                search.ReferralChasing = ReferralChasingOption.All;
                search.Filter = "(SAMAccountName=" + username + ")";
                search.PropertiesToLoad.Add("cn");
              
                SearchResult result = search.FindOne();

                if (result ==null)
                {
                    return false;
                }

                //Update the new path to the user in the directory.
                _path = result.Path;
                _filterAttribute = (string)result.Properties["cn"][0];
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Error authenticating user. " + ex.Message);
            }

            //return true;
        }


        public bool UserExists(string username)
        {
           
            DirectoryEntry de = new DirectoryEntry(_path);
            DirectorySearcher ds = new DirectorySearcher(de);
            ds.SearchScope = SearchScope.Subtree;
            ds.Filter = "(&(objectClass=User)(sAMAccountName=" + username + "))";


            if (ds.FindOne() == null)
            {
                //... not found
                return false;
            }
            else
            {
                return true;
            }

        }     

    }  
}