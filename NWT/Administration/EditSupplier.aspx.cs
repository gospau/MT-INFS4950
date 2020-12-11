using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NWT
{
    public partial class EditSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string DatabaseErrorMessage(string msg)
        {
            return $"A database error has occurred. Message: {msg}";
        }


        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated this product.  Please try again or contact Tech Support at ext. 2544.";
        }

        protected void grdSupplier_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            }
        }

        protected void grdSupplier_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            }
        }

        protected void grdSupplier_PreRender(object sender, EventArgs e)
        {
            grdSupplier.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlEditsupplier.InsertParameters["CompanyName"].DefaultValue =
                    txtCompanyName.Text;
                SqlEditsupplier.InsertParameters["ContactName"].DefaultValue =
                    txtContactName.Text;
                SqlEditsupplier.InsertParameters["City"].DefaultValue =
                    txtCity.Text;
                SqlEditsupplier.InsertParameters["Country"].DefaultValue =
                    txtCountry.Text;
                SqlEditsupplier.InsertParameters["Phone"].DefaultValue =
                    txtPhone.Text;
                SqlEditsupplier.InsertParameters["Fax"].DefaultValue =
                    txtFax.Text;

                try
                {
                    txtCompanyName.Text = "";
                    txtContactName.Text = "";
                    txtCity.Text = "";
                    txtCountry.Text = "";
                    txtPhone.Text = "";
                    txtFax.Text = "";
                    lblErrorMessage.Text = "Supplier was added successfully";
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }
    }
}