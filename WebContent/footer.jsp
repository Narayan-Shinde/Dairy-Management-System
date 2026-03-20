
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="/College_Managment_System/js/jquery-3.6.0.js"></script>
<script src="/College_Managment_System/js/jquery.validate.js"></script>
<script src="/College_Managment_System/js/additional-methods.js"></script>

<%
if (errorMsg != null && !errorMsg.isEmpty()) {
%>
<script>
    Swal.fire({
        icon: "error",
        title: "Kalpraj Dairy Farm, Wai",
        text: "<%= errorMsg %>"
    });
</script>
<%
} else if (successMsg != null && !successMsg.isEmpty()) {
%>
<script>
    Swal.fire({
        icon: "success",
        title: "Kalpraj Dairy Farm, Wai",
        text: "<%= successMsg %>"
    });
</script>
<%
}
%>

 
 <footer class="bg-body-tertiary text-center text-lg-start">
  <!-- Grid container -->
  <div class="container p-4">
    <!--Grid row-->
    <div class="row">
      <!--Grid column-->
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase">Contact Us</h5>

      				<p class="mb-0"><strong>Our Address</strong></p>
                    <p>At Post Wai, Tal-Wai Dist-Satara, Pin: 412803</p>
                    <p><strong>Email:</strong> kalprajdairy@gmail.com</p>
                    <p><strong>Phone:</strong> +91 9373421623</p>
      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase">Working Time</h5>

        
                    <p class="mb-0">Morning: 7am - 11am</p>
                    <p class="mb-0">Night: 6pm - 10pm</p>
      </div>
      <!--Grid column-->
    </div>
    <!--Grid row-->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    Project Made By:
    <a class="text-body" href="#">Narayan Shinde</a>
  </div>
  <!-- Copyright -->
</footer>

</body>
</html>  