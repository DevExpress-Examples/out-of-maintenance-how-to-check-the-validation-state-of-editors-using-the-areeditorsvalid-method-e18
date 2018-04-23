using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   

    void SetFormPanelVisible(bool visible)
    {
        FormPanel.Visible = visible;
        SuccessPanel.Visible = !visible;
    }
    #region #ClearEditorsInContainer
    protected void btnAgain_Click(object sender, EventArgs e)
    {
        FormPanel.Visible = true;
        SuccessPanel.Visible = false;
        ASPxEdit.ClearEditorsInContainer(FormPanel);
    }
    #endregion #ClearEditorsInContainer
    #region #ControilContainer
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (ASPxEdit.AreEditorsValid(FormPanel))
        {
            // TODO: Write data to database
            FormPanel.Visible = false;
            SuccessPanel.Visible = true;
            btnAgain.Focus();

            // Intentionally pauses server-side processing, to demonstrate the Loading Panel functionality.
            Thread.Sleep(2000);
        }
    }
    #endregion #ControilContainer
}