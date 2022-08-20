<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@
page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="template/header.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.0/css/bootstrap.min.css">

</head>
<style>
.movie-container {
	margin-left: 100px;
}

.carousel-item {
	height: 65vh;
	min-height: 300px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.portfolio-item {
	margin-bottom: 30px;
}
</style>
<body>
	<jsp:include page="template/nav.jsp" />
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

	<!-- Main content -->

	<section class="container">
		<div class="container-fluid">
			<h2 class="page-heading" style="padding-left: 0px;">Tìm kiếm
				theo</h2>
			<div>
				<form method="get" action="/search" class="row">
					<div class="form-group element" style="display: inline-flex;">
						<label for="start-date"
							style="width: 120px; padding-top: 5px; margin-left: 15px;">Tên
							Phim:</label> <input name="movieName" type="text" class="form-control"
							id="movieName" placeholder="Nhập tên phim">
					</div>
					<div class="form-group element" style="display: inline-flex;">
						<label for="category"
							style="width: 120px; padding-top: 5px; padding-left: 20px;">Thể
							loại:</label> <select name="category" class="form-control" id="category">
							<option value="ALL">Tất cả</option>
							<c:forEach var="category" items="${categories}">
								<option value="${category}">${category}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group" style="display: inline-flex;">
						<button style="margin-left: 10px;"
							class="btn btn-primary form-control" type="submit">Tìm
							kiếm</button>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<c:forEach var="movie" items="${allMovies}">
				<!-- Movie preview item -->
				<div class="col-lg-4 col-sm-6 portfolio-item">
					<div class="card h-100">
						<a href="#"><img style="height: 200px;" class="card-img-top"
							src="${movie.image}" alt="image"></a>
						<div class="card-body">
							<a href='/movies?id=${movie.id}' class="card-title link--huge">${movie.name}</a>
							<p class="movie__time">${movie.time} phút</p>
							<span class="text-warning">&#9733; &#9733; &#9733; &#9733;
								&#9733;</span> 5.0 stars
						</div>
						<div class="movie__btns">
							<a href="/movies?id=${movie.id}" class="btn btn-md btn--warning">Xem
								chi tiết <span class="hidden-sm">phim</span>
							</a> <a href="/purchase/${movie.id}/${cityId}/${date}"
								class="watchlist">Mua vé</a>
						</div>
					</div>

					<div class="col-sm-9 col-md-10 col-lg-10 movie__about">
<%--					<p class="movie__option"><strong>Ngôn ngữ: </strong>${movie.language}</p>--%>
<%--					<p class="movie__option"><strong>Thể loại: </strong>${movie.category}</p>--%>
<%--					<p class="movie__option"><strong>Ngày chiếu: </strong>${movie.premiere}</p>--%>
<%--					<p class="movie__option"><strong>Đạo diễn: </strong>${movie.director}</p>--%>
<%--					<p class="movie__option"><strong>Định dạng: </strong>${movie.format}</p>--%>
<%--					<p class="movie__option"><strong>Lượt xem: </strong>${movie.view}</p>--%>
<%--					<p class="movie__option"><strong>Giới hạn tuổi: </strong>${movie.ageLimit == 0 ? 13 : movie.ageLimit}</p>--%>
						<div class="preview-footer">
							<%--
							<hr />
							--%>
						</div>
					</div>
				</div>
				<!-- end movie preview item -->
			</c:forEach>
		</div>
		<nav aria-label="Page navigation">
			<ul class="pagination justify-content-center" id="pagination"></ul>
		</nav>
	</section>

	<div class="clearfix"></div>

	<jsp:include page="template/footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
	<script
		src="	https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-alpha1/js/bootstrap.bundle.min.js"></script>
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
				visiblePages : 10,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						window.location.href = "${pageContext.request.contextPath}/?page=" + page;
					}
				}
			});
		});
	</script>
</body>
</html>
