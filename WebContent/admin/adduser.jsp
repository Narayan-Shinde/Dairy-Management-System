<%@ page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("btnadd")!=null) 
{
	String UserType=request.getParameter("txtusertype");
	String UserID=request.getParameter("txtid");
	String username=request.getParameter("txtusername");
	String MilkType=request.getParameter("txtmilktype");
	String email=request.getParameter("txtemail");
	String address=request.getParameter("txtaddress");
	String mobile=request.getParameter("txtmobile");
	String pass=request.getParameter("txtpass");
	
	if(UserType.contains("Supplier")){//if UserType string contains Supplier word then it is admin
		//validates it against AdminLogin table
		ResultSet rs=db.getRows("select * from supplierlogin where SupplierID=?",UserID);
		if(rs.next()){
			errorMsg="Supplier ID is Already Taken... Use Another One!";
		
		}else{
			db.executeSql("Insert into supplierlogin(UserType,SupplierID,UserName,MilkType,EmailId,Address,MobileNo,Password) values(?,?,?,?,?,?,?,?)",UserType,UserID,username,MilkType,email,address,mobile,pass);
		    successMsg=username+" Supplier is Successfully registered with Site";
		} 
	}else if(UserType.contains("Customer")){//if UserType string contains Supplier word then it is admin
		//validates it against AdminLogin table
		ResultSet rs=db.getRows("select * from customerlogin where CustomerID=?",UserID);
		if(rs.next()){
			errorMsg="Customer ID is Already Taken... Use Another One!";
			}else{
			db.executeSql("Insert into customerlogin(UserType,CustomerID,UserName,MilkType,EmailId,Address,MobileNo,Password) values(?,?,?,?,?,?,?,?)",UserType,UserID,username,MilkType,email,address,mobile,pass);
		    successMsg=username+" Customer is Successfully registered with Site";
		    
		}
		}
}

%>
<!-- Login page specific contents -->
<div class="container">
<form method="post" id="form1" class="form custom-border mt-8 rounded">
<div class="col-5 offset-3">
<br>
<br>
<h2 class="text-center">Add Supplier</h2>
 <div class="form-group">
                User Type
                <input type="text" name="txtusertype" id="txtusertype" class="form-control" value="Supplier" readonly />
            </div>

<div class="form-group">
    User ID
    <input type="text" name="txtid" id="txtid" class="form-control" placeholder="Enter User ID" autofocus>
</div>


<div class="form-group">
User Name
<input type="text" name="txtusername" id="txtuser" class="form-control" placeholder="Enter User name"/>
</div>
<div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">Milk Type</label>
      <select class="form-select" name="txtmilktype" id="exampleSelect1" fdprocessedid="gd8djk">
        <option>Cow</option>
        <option>Buffalo</option>
      </select>
    </div>
<div class="form-group">
Email Address
<input type="text" name="txtemail" id="txtemail" class="form-control" placeholder="Enter Email address"/>
</div>
<div class="form-group">
Address
<input type="text" name="txtaddress" id="txtaddress" class="form-control" placeholder="Enter address"/>
</div>
<div class="form-group">
Mobile no.
<input type="text" name="txtmobile" id="txtmobile" class="form-control" placeholder="Enter Mobile Number"/>
</div>
<div class="form-group">
Password
<input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password"/>
</div>
<div class="form-group">
Confirm Password
<input type="password" name="txtcpass" id="txtcpass" class="form-control" placeholder="Confirm Password"/>
</div>
<br>
<div class="text-center d-grid gap-2">
<input type="submit" name="btnadd" value="Add Supplier" class="btn btn-lg btn-primary"/>
</div>
</div>
</form>
</div>
<%@ include file="../footer.jsp"%> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script>
    window.onload = function() {
        // Get the input field element
        var inputField = document.getElementById("txtid");

        // Set the initial input field value to start with "Supplier-" since Supplier is preselected
        inputField.value = "Supplier-" + inputField.value.slice(9);
    };

    function updateInputPrefix(selectElement) {
        // Get the selected option value
        var userType = selectElement.value;

        // Get the input field element
        var inputField = document.getElementById("txtid");

        // Determine the prefix based on the selected option
        var prefix;
        if (userType === "Supplier") {
            prefix = "Supplier-";
        } else if (userType === "Customer") {
            prefix = "Customer-";
        }

        // Update the input field value to start with the determined prefix
        inputField.value = prefix + inputField.value.slice(9);
    }

    $(function() {
        $("#form1").validate({
            rules: {
                txtid: {
                    required: true
                },
                txtusername: {
                    required: true
                },
                txtemail: {
                    required: true,
                    email: true
                },
                txtaddress: {
                    required: true
                },
                txtmobile: {
                    required: true,
                    pattern: /^\d{10}$/
                },
                txtpass: {
                    required: true
                },
                txtcpass: {
                    required: true,
                    equalTo: "#txtpass"
                }

            },
            messages: {
                txtid: {
                    required: "User ID is required"
                },
                txtusername: {
                    required: "UserName is required"
                },
                txtemail: {
                    required: "Email ID is required",
                    email: "Invalid email ID"
                },
                txtaddress: {
                    required: "Address is required"
                },
                txtmobile: {
                    required: "Mobile number is required",
                    pattern: "Mobile number always only 10 digits"
                },
                txtpass: {
                    required: "Password is required"
                },
                txtcpass: {
                    required: " Confirm Password is required",
                    equalTo: "Password Mismatch"
                }

            }
        });
    });
</script>
