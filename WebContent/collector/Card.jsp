<%@ page import="java.sql.ResultSet" %>
<%@ include file="../header.jsp" %>
<%
ResultSet as=db.getRows("SELECT * FROM milkcollection WHERE SupplierID =? AND UserName = ? AND Date BETWEEN ? AND ? AND MilkType = ?", sId,sUserName,fDate,tDate,mType);
%>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
    .container {
        margin-top: 50px;
    }
</style>

<div class="container">
    <h1 class="text-center">Milk Collection Details</h1>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Supplier ID</th>
                    <th>User Name</th>
                    <th>Date</th>
                    <th>Milk Type</th>
                    <!-- Add more table headers for additional columns if needed -->
                </tr>
            </thead>
            <tbody>
                <% 
                    while(as.next()) {
                %>
                <tr>
                    <td><%= as.getString("SupplierID") %></td>
                    <td><%= as.getString("UserName") %></td>
                    <td><%= as.getString("Date") %></td>
                    <td><%= as.getString("MilkType") %></td>
                    <!-- Add more table cells for additional columns if needed -->
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</div>



<%@ include file="../footer.jsp"%>