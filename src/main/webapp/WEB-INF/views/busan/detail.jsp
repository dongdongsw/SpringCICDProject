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
                        <h2>상세보기</h2>
                        <div class="breadcrumb__option">
                            <span>부산</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <div id="seoul_detail">
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                :src="store.detail.vo.image1" alt="">
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>{{store.detail.vo.title}}</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span>
                        </div>
                       
                        <p>{{store.detail.vo.msg}}</p>
                       
                        <ul>
                            <li><b>주소</b> <span>{{store.detail.vo.address}}</span></li>
                            <li><b>조회수</b> <span>{{store.detail.vo.hit}}</span></li>
                            <li><div class="text-right"><button class="btn-xs btn-danger" onclick="javascript:history.back()">목록</button></div></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>주변 맛집</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6" v-for="fvo in store.detail.list">
                    <div class="product__item">
                        <div class="product__item__pic">
                        	<img :src="fvo.poster">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-calendar"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">{{fvo.name}}</a></h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </div>
    <!-- Related Product Section End -->
    
    <script src="/busanjs/busanStore.js"></script>
	<script>
		const detailApp = Vue.createApp({
			setup(){
				const store = useBusanStore()
				const params = new URLSearchParams(location.search)
				const no = params.get('no')
				
				Vue.onMounted(()=>{
					store.busanDetailData(no, 1)
				})
				
				return {
					store
				}
			}
		})
		detailApp.use(Pinia.createPinia())
		detailApp.mount("#seoul_detail")
	</script>
</body>
</html>