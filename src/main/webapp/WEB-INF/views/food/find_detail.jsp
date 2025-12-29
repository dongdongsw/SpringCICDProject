<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <section class="breadcrumb-section set-bg" data-setbg="/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>맛집</h2>
                        <div class="breadcrumb__option">
                            <span>상세보기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="product-details spad" id="food_detail">
	   <div class="container">
	   		<div class="row" style="margin: 0px auto;">
	   			<!-- 상세보기 -->	
	   			<table class="table">
	   				<tr>
	   					<td width="30%" class="text-center" rowspan="8">
	   						<img alt="" :src="store.food_detail.poster" style="width: 270px; height: 200px">
	   					</td>
	   					<td colspan="2">
	   						<h3>{{store.food_detail.name}}&nbsp;
	   							<span style="color: orange">{{store.food_detail.score}}</span>
	   						</h3>	   						
	   					</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">주소</td>
	   					<td width="60%" class="text-left">{{store.food_detail.address}}</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">전화</td>
	   					<td width="60%" class="text-left">{{store.food_detail.phone}}</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">음식종류</td>
	   					<td width="60%" class="text-left">{{store.food_detail.type}}</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">시간</td>
	   					<td width="60%" class="text-left">{{store.food_detail.time}}</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">주차</td>
	   					<td width="60%" class="text-left">{{store.food_detail.parking}}</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">가격대</td>
	   					<td width="60%" class="text-left">{{store.food_detail.price}}</td>
	   				</tr>
	   				<tr>
	   					<td width="15%" class="text-center">테마</td>
	   					<td width="60%" class="text-left">{{store.food_detail.theme}}</td>
	   				</tr>
	   				
	   			</table>
	   			<table class="table">
	   				<tr>
	   					<td>{{store.food_detail.content}}</td>
	   				</tr>
	   				<tr>
	   					<td class="text-right">
	   						<button class="btn-xs btn-warning">예약</button>
	   						<button class="btn-xs btn-info" onclick="javascript:history.back()">목록</button>
	   					</td>
	   				</tr>
	   			</table>
	   		</div>
	   		<!-- 지도 -->
	   		<div class="row" style="margin: 20px auto;">
	   			<div id="map" style="width:100%;height:350px;"></div>
	   		</div>
	   		<!-- 댓글 -->
	   </div>
	</section>
	<script src="/foodjs/foodStore.js"></script>
	<script>
		const {createApp, onMounted} = Vue
		const {createPinia} = Pinia
		const app = createApp({
			setup(){
				const store = useFoodStore()
				const params = new URLSearchParams(location.search)
				const fno = params.get('fno')
				
				onMounted(()=>{
					store.foodDetailData(fno)
					if(!store.address){
						return
					}
					if(window.kakao && window.kakao.maps){
						initMap()
					}
					else{
						addScript()
					}
				})
				
				const initMap=()=>{
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };  
	
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
	
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
	
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(store.food_detail.address, function(result, status) {
	
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
	
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
	
					        // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+store.food_detail.name+'</div>'
					        });
					        infowindow.open(map, marker);
	
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});    
				}
				const addScript=()=>{
					const script = document.createElement("script")
					script.onload=()=>kakao.maps.load(initMap)
					script.src = "http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=eceae8f48d6cfa28f55de551f70f135b&libraries=services"
					document.head.appendChild(script)
				}
				
				return{
					store
				}
			}
		})
		app.use(createPinia())
		app.mount("#food_detail")
		
		
		
	</script>
</body>
</html>