using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLMonhoc : System.Web.UI.Page
    {
        MonHocDAO mhDAO = new MonHocDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LienKetDuLieu();
            }
        }

        private void LienKetDuLieu()
        {
            gvMonHoc.DataSource = mhDAO.getAll();
            gvMonHoc.DataBind();
        }

        protected void gvMonHoc_RowEditing(object sender, GridViewEditEventArgs e)
        {

            gvMonHoc.EditIndex = e.NewEditIndex;
            LienKetDuLieu();
        }

        protected void gvMonHoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            gvMonHoc.EditIndex = -1;
            LienKetDuLieu();
        }

        protected void gvMonHoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string mamh = gvMonHoc.DataKeys[e.RowIndex].Value.ToString();
            string tenmh = ((TextBox)gvMonHoc.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            int sotiet = int.Parse(((TextBox)gvMonHoc.Rows[e.RowIndex].Cells[2].Controls[0]).Text);

            MonHoc mh = new MonHoc()
            {
                MaMH = mamh,
                TenMH = tenmh,
                SoTiet = sotiet
            };

            mhDAO.Update(mh);

            gvMonHoc.EditIndex = -1;
            LienKetDuLieu();
        }

        protected void gvMonHoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string mamh = gvMonHoc.DataKeys[e.RowIndex].Value.ToString();

            mhDAO.Delete(mamh);

            LienKetDuLieu();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            string mamh = txtMaMH.Text;
            string tenmh = txtTenMon.Text;
            int sotiet = int.Parse(txtSoTiet.Text);

            MonHoc mh = new MonHoc()
            {
                MaMH = mamh,
                TenMH = tenmh,
                SoTiet = sotiet
            };

            mhDAO.Insert(mh);

            LienKetDuLieu();
        }

        protected void gvMonHoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMonHoc.PageIndex = e.NewPageIndex;
            LienKetDuLieu();
        }
    }
}