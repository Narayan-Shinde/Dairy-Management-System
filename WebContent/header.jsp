<%@ page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
      DataAccess db=new DataAccess();
      String successMsg="";
      String errorMsg="";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dairy management system</title>
<link href="/Dairy_management_system/css/bootstrap.css" rel="stylesheet"/>
<link href="/Dairy_management_system/css/Style.css" rel="stylesheet"/>
<style>
label.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>


  <!-- For DropDown -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


<nav class="navbar navbar-expand-lg bg-info navbar-light sticky-top px-4 px-lg-5 fs-5" data-bs-theme="dark">
  <div class="container-fluid ">
    <a class="navbar-brand" href="/Dairy_management_system/index.jsp">Kalpraj Dairy</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      
      <!-- Master Page When no one is Login -->
      
      <%
      if(session.getAttribute("user")==null) //if no login
      {
      %>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/Dairy_management_system/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_management_system/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_management_system/ourjourney.jsp">Our Journey</a>
            </div>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/animalfeed.jsp">Animal feed</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/milkratecard.jsp">Milk rate card</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/contact.jsp">Contact</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/login.jsp">Login</a>
        </li>
                
             </ul>  
      
      <!-- Admin Page When Admin  is Login -->
      
         <%
           }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
         %> 
         <ul class="navbar-nav me-auto">
         <li class="nav-item">
          <a class="nav-link active" href="/Dairy_management_system/admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_management_system/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_management_system/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Add User</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/admin/addcollector.jsp">Add Collector</a>
            <a class="dropdown-item" href="/Dairy_management_system/admin/adduser.jsp">Add Supplier</a>
            </div>
        </li>             
        
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/admin/animalfeed.jsp">Animal feed</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/admin/MilkCollection.jsp">View Milk Card</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/admin/Bill.jsp">Payment</a>
        </li> 
        </ul>
        <!-- Admin NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
        <a class="dropdown-item" href="/Dairy_management_system/admin/addanimalfeed.jsp">Add Animal Feed</a>
        <a class="dropdown-item" href="/Dairy_management_system/admin/collectorlist.jsp">View Collector List</a>
        <a class="dropdown-item" href="/Dairy_management_system/admin/supplierlist.jsp">View Supplier List</a>
        <a class="dropdown-item" href="/Dairy_management_system/admin/feedbacks.jsp">View FeedBacks</a>
          <a class="dropdown-item" href="/Dairy_management_system/admin/OrderFeedList.jsp">View Ordered Feed</a>
        <a class="dropdown-item" href="/Dairy_management_system/admin/FatRate.jsp">View Milk Rate Card</a>
        <a class="dropdown-item" href="/Dairy_management_system/admin/DailyCollection.jsp">View Daily Collection</a>
         <a class="dropdown-item" href="/Dairy_management_system/admin/MilkCollectionReport.jsp">View Milk Collection</a>
        <a class="dropdown-item" href="/Dairy_management_system/admin/setmilkrate.jsp">Set Milk Rate</a>
                <a class="dropdown-item" href="/Dairy_management_system/admin/reportlist.jsp">Reports</a>
      <a class="dropdown-item" href="/Dairy_management_system/admin/changepass.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_management_system/admin/logout.jsp">Logout</a>
    </div>
   </div>
       
      <!-- Collector Page When Collector is Login -->
                                                        
      <%
      }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("collector")){
      %>
      <ul class="navbar-nav me-auto">
      <li class="nav-item">
          <a class="nav-link active" href="/Dairy_management_system/collector/collector.jsp">Collector
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_management_system/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_management_system/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
             <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/collector/AddUser.jsp">Add Supplier</a>
        </li>         
               
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/collector/AddMilkSell.jsp">Add Milk Collection</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/collector/MilkCollection.jsp">View Milk Collection</a>
        </li> 
        </ul>
           <!-- Collector NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
       <a class="dropdown-item" href="/Dairy_management_system/collector/supplierlist.jsp">View Supplier List</a>
       <a class="dropdown-item" href="/Dairy_management_system/collector/FatRate.jsp">View Milk Rate</a>
       <a class="dropdown-item" href="/Dairy_management_system/collector/OrderFeedList.jsp">View Ordered Feed</a>
       <a class="dropdown-item" href="/Dairy_management_system/collector/changepass.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_management_system/collector/logout.jsp">Logout</a>
    </div>
   </div>           
             
             <!-- Customer Page When Customer is Login -->
                                                              
      <%
      }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("customer")){
      %>
      <ul class="navbar-nav me-auto">
      <li class="nav-item">
          <a class="nav-link active" href="/Dairy_management_system/customer/customer.jsp">Customer
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_management_system/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_management_system/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Bill</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/customer/addsupplier.jsp">Bill Card</a>
            <a class="dropdown-item" href="/Dairy_management_system/customer/addcustomer.jsp">Bill Report</a>
            </div>
        </li>             
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/animalfeed.jsp">Animal feed</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="milkbuy.jsp">Feedback</a>
        </li>
        </ul>
           <!-- Customer NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
       <a class="dropdown-item" href="/Dairy_management_system/customer/YourProfile.jsp">Your Profile</a>
        <a class="dropdown-item" href="/Dairy_management_system/customer/addanimalfeed.jsp">View Milk Rate</a>
      <a class="dropdown-item" href="/Dairy_management_system/customer/FatSnf.jsp">Fat & SNF Chart</a>
      <a class="dropdown-item" href="/Dairy_management_system/customer/changepassword.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_management_system/customer/logout.jsp">Logout</a>
    </div>
   </div>           
             <!-- Supplier Page when Supplier is Login -->
      <%
      }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("supplier")){
      %>
            <ul class="navbar-nav me-auto">
      <li class="nav-item">
          <a class="nav-link active" href="/Dairy_management_system/supplier/supplier.jsp">Supplier
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/aboutus.jsp">About us</a>
            <a class="dropdown-item" href="/Dairy_management_system/services.jsp">Services</a>
            <a class="dropdown-item" href="/Dairy_management_system/ourjourney.jsp">Our Journey</a>
            </div>
        </li> 
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Bill</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="/Dairy_management_system/supplier/billcard.jsp">Bill Card</a>
            <a class="dropdown-item" href="/Dairy_management_system/supplier/billreport.jsp">Bill Report</a>
            </div>
        </li>             
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/supplier/orderfeed.jsp">Animal feed</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/Dairy_management_system/supplier/contact.jsp">Feedback</a>
        </li>
        </ul>
           <!-- Supplier NavBar After Login -->
   <div class="nav-item dropdown d-flex float-end" >
     <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="nav-link dropdown-toggle rounded-circle" height="50" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false" alt="Your Profile Photo"/>
     <div class="dropdown-menu dropdown-menu-end">
        <a class="dropdown-item" href="/Dairy_management_system/supplier/milkratecard.jsp">View Milk Rate</a>
      <a class="dropdown-item" href="/Dairy_management_system/supplier/changepass.jsp">Change Password</a>
       <a class="dropdown-item" href="/Dairy_management_system/supplier/logout.jsp">Logout</a>
    </div>
   </div> 
   
          
      <%
      }
      %>
      </div>
        </div> 
       
      </nav> 
      
      
      
      
          
      