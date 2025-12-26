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
                        <h2>게시판</h2>
                        <div class="breadcrumb__option">
                            <span>목록</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="product-details spad" id="board_list">
	   <div class="container">
	       <div class="row">
	       		<table class="table">
	       			<tbody>
	       				<tr>
	       					<td>
	       						<a href="/board/insert" class="btn btn-sm btn-primary">새글</a>
	       					</td>
	       				</tr>
	       			</tbody>
	       		</table>
	       		<table class="table">
	       			<thead>
	       				<tr>
	       					<th width="10%" class="text-center">번호</th>
	       					<th width="45%" class="text-center">제목</th>
	       					<th width="15%" class="text-center">이름</th>
	       					<th width="20%" class="text-center">작성일</th>
	       					<th width="10%" class="text-center">조회수</th>
	       				</tr>
	       			</thead>
	       			<tbody>
	       				<tr v-for="vo in store.list" :key="vo.no">
	       					<td width="10%" class="text-center">{{vo.no}}</td>
	       					<td width="45%" class="text-center"><a :href="'http://localhost:8080/board/detail?no='+vo.no">{{vo.subject}}</a></td>
	       					<td width="15%" class="text-center">{{vo.name}}</td>
	       					<td width="20%" class="text-center">{{vo.dbday}}</td>
	       					<td width="10%" class="text-center">{{vo.hit}}</td>
	       				</tr>
	       				<tr>
	       					<td colspan="5" class="text-center">
	       						<button class="btn-sm btn-danger">이전</button>
	       							{{store.curpage}} page / {{store.totalpage}} pages
	       						<button class="btn-sm btn-danger">다음</button>
	       					</td>
	       				</tr>
	       			</tbody>
	       		</table>
	       </div>
	   </div>
	</section>
	<script src="/boardjs/boardListStore.js"></script>
	<script>
		const {createApp, onMounted} = Vue
		const {createPinia} = Pinia
		
		const app = createApp({
			setup(){
				
				const store = useBoardListStore()
				onMounted(()=>{
					store.dataRecv()
				})
				return{
					store
				}
			}
		})
		// Pinia객체 생성
		const pinia = createPinia()
		app.use(pinia)
		app.mount("#board_list")
	</script>
</body>
</html>