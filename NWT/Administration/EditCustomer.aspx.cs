using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NWT
{
    public partial class EditCustomer : System.Web.UI.Page
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

        protected void grdCustomer_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

        protected void grdCustomer_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

        protected void grdCustomer_PreRender(object sender, EventArgs e)
        {
            grdCustomer.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SqlEditcustomer.InsertParameters["FirstName"].DefaultValue =
                txtFName.Text;
            SqlEditcustomer.InsertParameters["LastName"].DefaultValue =
                txtLName.Text;
            SqlEditcustomer.InsertParameters["City"].DefaultValue =
                txtCity.Text;
            SqlEditcustomer.InsertParameters["Country"].DefaultValue =
                txtCountry.Text;
            SqlEditcustomer.InsertParameters["Phone"].DefaultValue =
                txtPhone.Text;
            try
            {
                txtFName.Text = "";
                txtLName.Text = "";
                txtCity.Text = "";
                txtCountry.Text = "";
                txtPhone.Text = "";
                lblErrorMessage.Text = "Customer was added successfully";
            }
            catch (Exception exxx)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(exxx.Message);
            }
        }
    }
}