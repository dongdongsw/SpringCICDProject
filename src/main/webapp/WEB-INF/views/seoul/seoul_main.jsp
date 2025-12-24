<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>서울여행</h2>
                        <div class="breadcrumb__option">
                            <span>${title }</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
 	<!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
       		<jsp:include page="../seoul/seoul_left.jsp"></jsp:include>
       		<jsp:include page="${seoul_jsp }"></jsp:include>
       		</div>
        </div>
    </section>
    <!-- Blog Section End -->
</body>
</html>