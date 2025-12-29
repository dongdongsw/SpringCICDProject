<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window._LOGIN_={
			sessionId : '<%= session.getAttribute("id") != null?session.getAttribute("id"):"" %>'
			
	}
</script>
</head>
<body>
	<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                           <!--  <ul>
                                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                                <li>Free Shipping for all Order of $99</li>
                            </ul> -->
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                           
                            <div class="header__top__right__auth">
                            	<c:if test="${sessionScope.id == null }">
                                	<a href="/member/login"><i class="fa fa-user"></i> Login</a>
                                </c:if>
                                <c:if test="${sessionScope.id != null }">
                                	<a href="/member/logout"><i class="fa fa-user"></i> Logout</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/main"><img src="/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="/main">Home</a></li>
                            <li><a href="#">맛집</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="/food/list">맛집 목록</a></li>
                                    <li><a href="/food/find">맛집 검색</a></li>
                                    <li><a href="/food/reserve">맛집 예약</a></li>	
                                </ul>
                            </li>
                            <li><a href="/seoul">서울여행</a></li>
                            <li><a href="/busan">부산여행</a></li>
                            
                            <li><a href="/board/list">커뮤니티</a></li>
                            <li><a href="./contact.html">마이페이지</a></li>
                        </ul>
                    </nav>
                </div>
                
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    
</body>
</html>