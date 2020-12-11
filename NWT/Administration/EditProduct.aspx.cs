using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NWT
{
    public partial class EditProduct : System.Web.UI.Page
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

        protected void grdProduct_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

        protected void grdProduct_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

        protected void grdProduct_PreRender(object sender, EventArgs e)
        {
            grdProduct.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                SqlProduct.InsertParameters["ProductName"].DefaultValue =
                    txtProductName.Text;
                SqlProduct.InsertParameters["UnitPrice"].DefaultValue =
                    txtUnitPrice.Text;
                SqlProduct.InsertParameters["Package"].DefaultValue =
                    txtPackage.Text;
                SqlProduct.InsertParameters["SupplierID"].DefaultValue =
                    txtSupplierID.Text;
                SqlProduct.InsertParameters["IsDiscontinued"].DefaultValue = 
                    Convert.ToString(cbIsdis.Checked);

                try
                {
                    SqlProduct.Insert();
                    txtProductName.Text = "";
                    txtUnitPrice.Text = "";
                    txtPackage.Text = "";
                    txtSupplierID.Text = "";
                    cbIsdis.Checked = false;
                    lblErrorMessage.Text = "Product was added successfully";
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }
    }
}