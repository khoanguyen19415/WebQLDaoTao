using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLSinhvien : Secure
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }
        protected void gvSinhVien_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string masv = gvSinhVien.DataKeys[e.RowIndex].Value.ToString();


            GridViewRow row = gvSinhVien.Rows[e.RowIndex];

            string hosv = ((TextBox)row.Cells[1].Controls[0]).Text;
            string tensv = ((TextBox)row.Cells[2].Controls[0]).Text;
            CheckBox chkGioiTinh = (CheckBox)row.FindControl("cbGioiTinh");
            bool gioitinh = chkGioiTinh.Checked;

            DateTime ngaysinh = Convert.ToDateTime(((TextBox)row.Cells[4].Controls[0]).Text);
            string noisinh = ((TextBox)row.Cells[5].Controls[0]).Text;
            string diachi = ((TextBox)row.Cells[6].Controls[0]).Text;
            string makh = ((TextBox)row.Cells[7].Controls[0]).Text;


            SinhVienDAO dao = new SinhVienDAO();
            dao.Update(masv, hosv, tensv, gioitinh, ngaysinh, noisinh, diachi, makh);


            gvSinhVien.EditIndex = -1;
            odsSinhVien.DataBind();
            gvSinhVien.DataBind();
        }
    }
}