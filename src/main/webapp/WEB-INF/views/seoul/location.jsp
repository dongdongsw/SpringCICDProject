<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="col-lg-8 col-md-7" id="seoul_list">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6" v-for="vo in store.list">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img :src="vo.poster" :title="vo.address" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i>2025.12</li>
                            <li><i class="fa fa-comment-o"></i>{{vo.hit}}</li>
                        </ul>
                        <h5><a href="#">{{vo.title}}</a></h5>
                        <p>{{vo.address}}</p>
                        <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="product__pagination blog__pagination">
                 	<a  v-if="store.startPage > 1" @click="store.prev(store.startPage-1)"><i class="fa fa-long-arrow-left"></i></a>
                    <a  v-for="i in store.range(store.startPage, store.endPage)" @click="store.pageChange(i)">{{i}}</a>
                    <a  v-if="store.endPage < store.totalpage" @click="store.next(store.endPage+1)"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
   <script src="/seouljs/seoulStore.js"></script>
	<script>
		const app = Vue.createApp({
			setup(){
				const store = useSeoulStore()
				// 한번 실행
				Vue.onMounted(()=>{
					store.seoulListData(1)
				})
				
				return {
					store
				}
			}
		})
		app.use(Pinia.createPinia())
		app.mount("#seoul_list")
	</script>
</body>
</html>