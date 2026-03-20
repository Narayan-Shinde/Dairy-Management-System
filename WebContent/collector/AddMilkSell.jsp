<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
// Check if the "Add Milk" button is clicked
if (request.getParameter("btnadd") != null) {
    // Retrieve form data
    String sID = request.getParameter("supplierId");
    String userName = request.getParameter("userName");
    String liter = request.getParameter("liter");
    String fat = request.getParameter("fat");
    String date = request.getParameter("date");
    String Session = request.getParameter("session");
    String mType = request.getParameter("milkType");

    // Check if the data already exists in the database
    ResultSet existingData = db.getRows("SELECT * FROM milkcollection WHERE SupplierID = ? AND UserName = ? AND Date = ? AND Session = ? AND MilkType = ?",
            sID, userName, date, Session, mType);

    if (!existingData.next()) {
        // Data does not exist, proceed with insertion
        db.executeSql("INSERT INTO milkcollection(SupplierID, MilkType, Session, Liter, Fat, UserName, Date) VALUES (?, ?, ?, ?, ?, ?, ?)",
                sID, mType, Session, liter, fat, userName, date);
        successMsg = sID + " Supplier's Milk Added Successfully";
    } else {
        // Data already exists, display error message
        errorMsg = "Milk data for the selected user, date, and session already exists.";
    }
}
%>

<div class="container">
    <h1 class="mt-5 mb-4 text-center">Milk Collection Form</h1>
    <form method="post">
        <div class="col-6 offset-3">
            <div class="form-group">
                <label for="supplierId">Supplier ID:</label>
                <input type="text" class="form-control" id="supplierId" name="supplierId" value="Supplier-" required>
            </div>

            <div class="form-group">
                <label for="userName">User Name:</label>
                <select class="form-control" id="userName" name="userName" required>
                    <option value="">Select User Name</option>
                    <% ResultSet rs = db.getRows("SELECT * FROM supplierlogin");
                    while (rs.next()) { %>
                        <option value="<%= rs.getString(5) %>"><%= rs.getString(5) %></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label for="liter">Liter:</label>
                <input type="text" class="form-control" id="liter" name="liter" required>
            </div>

            <div class="form-group">
                <label for="fat">Fat:</label>
                <input type="text" class="form-control" id="fat" name="fat" required>
            </div>

            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" class="form-control" id="date" name="date" required>
            </div>

            <div class="form-group">
                <label for="session">Session:</label>
                <select class="form-control" id="session" name="session">
                    <option value="Morning">Morning</option>
                    <option value="Night">Night</option>
                </select>
            </div>

            <div class="form-group">
                <label for="milkType">Milk Type:</label>
                <select class="form-control" id="milkType" name="milkType">
                    <option value="Cow">Cow</option>
                    <option value="Buffalo">Buffalo</option>
                </select>
            </div>
            <br>
            <div class="text-center d-grid gap-2">
                <input type="submit" name="btnadd" value="Add Milk" class="btn btn-lg btn-primary"/>
            </div>
        </div>
    </form>
</div>

<%@ include file="../footer.jsp"%>
