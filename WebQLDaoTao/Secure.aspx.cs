using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class Secure : System.Web.UI.Page
    {

        TaiKhoanDAO tkDAO = new TaiKhoanDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
           if (Session["username"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
           else
            {
                string username = (string)Session["username"];
                // kiem tra vai tro phu hop
                if (tkDAO.findByUserName(username).VaiTro != "CBDT")
                {
                    Response.Write("<script> alert('vai trò không hợp lệ')</script>");
                    Response.Redirect("DangNhap.aspx");
                }
            }
        }
    }
}