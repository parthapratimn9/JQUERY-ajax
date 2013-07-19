using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]   //this line will be commented out at first u have to remove the comment out tag.

[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {
   
    public WebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
         
    }

    [WebMethod]
    

    
    public string getAvailability(string Username)
    {
         
        string result = "";
        //string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["conn"].ConnectionString; ;
        SqlConnection con = new SqlConnection("Data Source=USER-PC\\SQL2008;Initial Catalog=PUBS;Integrated Security=True");
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandText = "select * from Customer where CompanyName = '" + Username + "'";
        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
                result = "Not Available";
            else
                result = "Available";
            con.Close();
            return result;
        }
        catch
        {
            return null;
        }
    }
    
}

