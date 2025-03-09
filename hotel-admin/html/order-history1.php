<!DOCTYPE html>
<html style="scroll-behavior: smooth;">

<head>
	<title>Order History</title>
	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
		rel="stylesheet">

	<!-- Icon Font Stylesheet -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

	<!-- Libraries Stylesheet -->
	<link href="../lib/animate/animate.min.css" rel="stylesheet">

	<!-- Customized Bootstrap Stylesheet -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet">

	
	
</head>

<body>
	<!-- Navbar & Hero Start -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3"
		style="position: sticky; top: 0; background: #10172b !important;">
		<a href="../html/hotel-admin.html" class="navbar-brand p-0">
			<h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>BooknDine</h1>
			<!-- <img src="img/logo.png" alt="Logo"> -->
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="fa fa-bars"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<div class="navbar-nav ms-auto py-0 pe-4">
				<a href="./hotel-admin.html" class="nav-item nav-link">Home</a>
				<a href="../html/about.html" class="nav-item nav-link">About</a>
			   
						<a href="../html/order-history.html" class="nav-item nav-link active">Order History</a>
					  
				<a href="../html/profile.html" class="nav-item nav-link">Profile</a>
				<a href="../../landingpage/index.html" class="nav-item nav-link">Logout</a>
			</div>
		</div>
	</nav>
	<!-- Navbar & Hero End -->

	<!-- Order History -->
	<link rel="stylesheet" href="https://allyoucan.cloud/cdn/icofont/1.0.1/icofont.css"
		integrity="sha384-jbCTJB16Q17718YM9U22iJkhuGbS0Gd2LjaWb4YJEZToOPmnKDjySVa323U+W7Fv" crossorigin="anonymous">
	
	<div class="container my-5">
		<div class="row">
			
			<div class="col-md-9">
				<div class="osahan-account-page-right shadow-sm bg-white p-4 h-100" style="width: 1249px;
    margin-left: -66px;">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane  fade  active show" id="orders" role="tabpanel" aria-labelledby="orders-tab">
							<h4 class="font-weight-bold mt-0 mb-4">Order Request</h4>
							<div id="order-history">

							</div>
							

    
    <?php include 'view_bookings.php'; ?>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Order History -->

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	

</body>
</html>