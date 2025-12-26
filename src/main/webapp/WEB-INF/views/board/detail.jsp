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
                            <span>내용보기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="product-details spad" id="board_detail">
	   <div class="container">
	       <div class="row">
	       		<table class="table">
	       			<tbody>
	       				<tr>
	       					<th width="20%" class="text-center success">번호</th>
	       					<td width="30%" class="text-center">{{store.vo.no}}</td>
	       					<th width="20%" class="text-center success">작성일</th>
	       					<td width="30%" class="text-center">{{store.vo.dbday}}</td>
	       				</tr>
	       				<tr>
	       					<th width="20%" class="text-center success">이름</th>
	       					<td width="30%" class="text-center">{{store.vo.name}}</td>
	       					<th width="20%" class="text-center success">조회수</th>
	       					<td width="30%" class="text-center">{{store.vo.hit}}</td>
	       				</tr>
	       				<tr>
	       					<th width="20%" class="text-center success">제목</th>
	       					<td colspan="3" class="text-center">{{store.vo.subject}}</td>
	       				</tr>
	       				<tr>
	       					<td colspan="4" class="text-left" valign="top" height="200">
	       						<pre style="white-space: pre-wrap; border: none; background: white;">{{store.vo.content}}</pre>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td colspan="4" class="text-right">
	       						<a :href="'/board/update?no='+store.vo.no" class="btn btn-xs btn-warning">수정</a>
	       						<a :href="'/board/delete?no='+store.vo.no" class="btn btn-xs btn-info">삭제</a>
	       						<a href="/board/list" class="btn btn-xs btn-success">목록</a>
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
				// 스토어 읽기
				const store = useBoardListStore()
				
				// 전송 데이터 읽기
				const params = new URLSearchParams(location.search)
				const no = params.get('no')
				
				// 함수 호출
				onMounted(()=>{
					store.boardDetail(no)
				})
				// return
				return{
					store
				}
			}
		})
		app.use(createPinia())
		app.mount('#board_detail')
	</script>
	
</body>
</html>