<%@page import="com.util.db.SendMail"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>

<%
if(request.getParameter("btnrecover") != null) {
    String email = request.getParameter("txtuser");
    ResultSet rs = db.getRows("select * from adminlogin where UserName=?", email);
    if(rs.next()) {
        String pass = rs.getString(2);
        String message = "Hi " + email + ", Welcome to Online Shopping Recovery System<br>Your Password is " + pass;
        try {
            SendMail.send(email, "Online Shop - Password Recovery", message);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception appropriately (e.g., log it, display an error message)
            errorMsg = "Failed to send email. Please try again later.";
        }

    } else {
        errorMsg = "Invalid EmailID or EmailID does not exist in the database. Please try again.";
    }
}
%>

<!-- Forgot Password Page Specific Contents -->
<div class="container">
    <div class="col-5 offset-3 mt-5">
        <h2>Password Recovery</h2>
        <% if(errorMsg != null && !errorMsg.isEmpty()) { %>
            <div class="alert alert-danger" role="alert">
                <%= errorMsg %>
            </div>
        <% } %>
        <form method="post" id="forgotPasswordForm">
            <div class="form-group">
                <label for="txtuser">Email Address</label>
                <input type="text" name="txtuser" id="txtuser" class="form-control" placeholder="Enter Username" required>
            </div>
            <button type="submit" name="btnrecover" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>

<%@ include file="footer.jsp"%>

<script>
    $(function() {
        $("#forgotPasswordForm").validate({
            rules: {
                txtuser: {
                    required: true,
                    email: true
                }
            },
            messages: {
                txtuser: {
                    required: "Email is required",
                    email: "Please enter a valid email address"
                }
            }
        });
    });
</script>
