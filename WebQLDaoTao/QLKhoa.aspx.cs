using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLKhoa : Secure
    {
        KhoaDAO khDAO = new KhoaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }


        protected void btXuLy_Click(object sender, EventArgs e)
        {
            string makh = txtMaKH.Text;
            string tenkh = txttenMH.Text;
            Khoa kh = new Khoa { MaKH = makh, TenKh = tenkh };
            khDAO.Insert(kh);
            gvKhoa.DataBind();
        }
    }




}