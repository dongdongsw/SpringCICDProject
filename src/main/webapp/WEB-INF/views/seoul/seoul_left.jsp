<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-lg-4 col-md-5">
       <div class="blog__sidebar">
           <div class="blog__sidebar__search">
               <form action="#">
                   <input type="text" placeholder="Search...">
                   <button type="submit"><span class="icon_search"></span></button>
               </form>
           </div>
           <div class="blog__sidebar__item">
               <h4>Categories</h4>
               <ul>
                   <li><a href="/seoul?type=1">명소</a></li>
                   <li><a href="/seoul?type=2">자연 & 관광</a></li>
                   <li><a href="/seoul?type=3">쇼핑</a></li>
                   <li><a href="/seoul?type=4">음식점</a></li>
                   <li><a href="/seoul?type=5">테마여행</a></li>
               </ul>
           </div>
           <div class="blog__sidebar__item">
               <h4>Recent News</h4>
               <div class="blog__sidebar__recent">
                   <a href="#" class="blog__sidebar__recent__item">
                       <div class="blog__sidebar__recent__item__pic">
                           <img src="/img/blog/sidebar/sr-1.jpg" alt="">
                       </div>
                       <div class="blog__sidebar__recent__item__text">
                           <h6>09 Kinds Of Vegetables<br /> Protect The Liver</h6>
                           <span>MAR 05, 2019</span>
                       </div>
                   </a>
                   <a href="#" class="blog__sidebar__recent__item">
                       <div class="blog__sidebar__recent__item__pic">
                           <img src="/img/blog/sidebar/sr-2.jpg" alt="">
                       </div>
                       <div class="blog__sidebar__recent__item__text">
                           <h6>Tips You To Balance<br /> Nutrition Meal Day</h6>
                           <span>MAR 05, 2019</span>
                       </div>
                   </a>
                   <a href="#" class="blog__sidebar__recent__item">
                       <div class="blog__sidebar__recent__item__pic">
                           <img src="/img/blog/sidebar/sr-3.jpg" alt="">
                       </div>
                       <div class="blog__sidebar__recent__item__text">
                           <h6>4 Principles Help You Lose <br />Weight With Vegetables</h6>
                           <span>MAR 05, 2019</span>
                       </div>
                   </a>
               </div>
           </div>
           <div class="blog__sidebar__item">
               <h4>Search By</h4>
               <div class="blog__sidebar__item__tags">
                   <a href="#">Apple</a>
                   <a href="#">Beauty</a>
                   <a href="#">Vegetables</a>
                   <a href="#">Fruit</a>
                   <a href="#">Healthy Food</a>
                   <a href="#">Lifestyle</a>
               </div>
           </div>
       </div>
   </div>
</body>
</html>