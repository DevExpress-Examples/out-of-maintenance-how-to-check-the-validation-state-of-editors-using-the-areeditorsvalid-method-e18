<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx](./VB/Default.aspx))
<!-- default file list end -->
# How to check the validation state of editors using the AreEditorsValid method


<p>This example demonstrates how the AreEditosValid static method can be used to check the error state of several DevExpress editors without validating them again.<br />
In this sample, a click on the button automatically performs client and server validations of editors contained within the same container as the button. </p><p>Since client validation is raised automatically via a button click, it's allowed to use the client ASPxClientEditor.AreEditorsValid method when handling the button's client Click event.</p><p>If client validation is passed successfully, then server validation of editors is automatically performed during processing of a postback.<br />
In this case, the server ASPxEdit.AreEditorsValid(container) static method can be used to check the error state of editors (the 'container' here is a container object that holds the button and editors).</p><p>This example also shows how to prevent the button from being manipulated by an end-user again, until postback procession is completed. <br />
While the ASPxLoadingPanel prevents the button from being clicked using the mouse (because the panel is displayed over the button and covers it during postback processing), an end-user can try to use the ENTER key to press the button (because the button still holds focus after sending a postback).</p><p>To prevent undesired button presses, input focus should be moved from the button to another element on the form after the button is first clicked.<br />
Moving focus to editors is not sensible, because this might provide the possibility of data corruption within the editors before a submit.</p><p>So, in this sample, the problem is solved by placing onto the form an invisible INPUT element of the Text type. <br />
When it's required to move focus from the button, this INPUT element becomes visible, receives focus and then becomes hidden again, programmatically.</p><p><strong>See also:</strong><br />
<a href="https://www.devexpress.com/Support/Center/p/E124">How to raise validation on the client side</a><br />
<a href="https://www.devexpress.com/Support/Center/p/E3633">How to validate editors in the container on the server side</a></p>

<br/>


