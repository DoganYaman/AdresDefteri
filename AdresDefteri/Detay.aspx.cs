using AdresDefteri.DataLayer;
using AdresDefteri.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdresDefteri
{
    public partial class Detay : System.Web.UI.Page
    {
        AddressDataHelper _helper = new AddressDataHelper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int id;
                if (int.TryParse(Request.QueryString["id"], out id))
                {
                    FormDataBind(id);
                }
            }
        }

        private void FormDataBind(int id)
        {
            var address = _helper.GetAddress(id);

            txtName.Text = address.Name;
            txtSurame.Text = address.SurName;
            txtNick.Text = address.Nick;
            calBirth.SelectedDate = address.BirthDate;
            ddGender.SelectedValue = address.Gender == true ? "Bay" : "Bayan";
            txtMobile.Text = address.MobileNumber;
            txtHome.Text = address.HomeNumber;
            txtEmail.Text = address.Email;
            txtFax.Text = address.Fax;
            txtAddress.Text = address.UserAddress;
            txtNote.Text = address.Note;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id;
            if (!int.TryParse(Request.QueryString["id"], out id)) { return; }
            var address = new Address();
            address.Id = id;
            address.Name = txtName.Text;
            address.SurName = txtSurame.Text;
            address.Nick = txtNick.Text;
            address.BirthDate = calBirth.SelectedDate;
            if (ddGender.SelectedValue != "Seçiniz")
            {
                address.Gender = ddGender.SelectedValue == "Bay";
            }
            address.MobileNumber = txtMobile.Text;
            address.HomeNumber = txtHome.Text;
            address.Fax = txtFax.Text;
            address.Email = txtEmail.Text;
            address.UserAddress = txtAddress.Text;
            address.Note = txtNote.Text;

            var rowCount = _helper.UpdateAddress(address);

            if (rowCount > 0)
            {
                lblInfo.Visible = true;
                //ClearAddressForm();
            }
        }
        private void ClearAddressForm()
        {
            txtName.Text = string.Empty;
            txtSurame.Text = string.Empty;
            txtNick.Text = string.Empty;
            calBirth.SelectedDate = DateTime.Now;
            ddGender.SelectedIndex = 0;
            txtMobile.Text = string.Empty;
            txtHome.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtFax.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtNote.Text = string.Empty;
        }

        protected void btnDeleteAddress_OnClick(object sender, EventArgs e)
        {
            int id=0;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                if (_helper.DeleteAddress(id) > 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "Load", "<script type='text/javascript'>window.parent.location.href='/Anasayfa.aspx'</script>");
                }
            }
        }


    }
}