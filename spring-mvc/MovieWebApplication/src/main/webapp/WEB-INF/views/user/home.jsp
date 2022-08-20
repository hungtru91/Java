<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ page
language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/moviesite-main.css" rel="stylesheet">

<title>Movie - Home</title>

</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">MovieSite</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<form th:action="@{/1}">
				<div style="width: 300px;">
					<div class="input-group">
						<input type="search" class="form-control rounded"
							placeholder="Search" aria-label="Search"
							aria-describedby="search-addon" id="keyword"
							th:value="${keyword}" />
						<button type="button" class="btn btn-outline-primary"
							value="Search" onclick="search()">search</button>
					</div>
				</div>
			</form>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="home.html">Home</a></li>
					<li class="nav-item"><a class="nav-link" rel="external"
						href="#">Sign in</a></li>
					<li class="nav-item"><a class="nav-link" rel="external"
						href="${pageContext.request.contextPath}/signup">Sign up</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One -->
				<div class="carousel-item active"
					style="background-image: url('https://resizing.flixster.com/oWIge57URyGnJcHFHGpqutNvYAE=/1100x480/v1.czsxMDI3ODc0NDtqOzE3NjY4OzEyMDA7NTUwOzI0MA')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Black Panther</h3>
						<p>This is a description for the Black Panther.</p>
					</div>
				</div>
				<!-- Slide Two -->
				<div class="carousel-item"
					style="background-image: url('https://resizing.flixster.com/8lBXrsIFUgUY8LdRkW7u_l4J8eA=/1100x480/v1.czsxMDI3ODczMTtqOzE3NjY4OzEyMDA7NTUwOzI0MA')">
					<div class="carousel-caption d-none d-md-block">
						<h3>God Father</h3>
						<p>This is a description for the God Father.</p>
					</div>
				</div>
				<!-- Slide Three-->
				<div class="carousel-item"
					style="background-image: url('https://resizing.flixster.com/jPu7rsxgIhFJhx8883ZWbSUWZGo=/1100x480/v1.czsxMDI3ODczMjtqOzE3NjY4OzEyMDA7NTUwOzI0MA')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Pacific Rim</h3>
						<p>This is a description for the Pacific Rim.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>
	<div class="container">
		<h1 class="my-4">Phim đang chiếu</h1>
		<div class="row">
			<c:forEach items="${movies.listMovie}" var="movie">
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img style="height: 200px;" class="card-img-top"
							src="${movie.poster}" alt=""></a>
						<div class="card-body">
							<p class="card-title">${movie.title}</p>
							<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
								&#9733;</span> 5.0 stars
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center" id="pagination"></ul>
		</nav>
	</div>

	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; My Website
				2021</p>
		</div>

	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="vendor/jquery/jquery.twbsPagination.min.js"></script>

	<script type="text/javascript">
		var totalPages = ${movies.totalPage};
		var currentPage;
		if (${movies.page} == 0) {
			currentPage = 1;
		} else {
			currentPage = ${movies.page};
		}
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 5,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						window.location.href = "${pageContext.request.contextPath}/movies?page=" + page;
					}
				}
			});
		});
		function search() {
			
		}
	</script>

</body>

</html>