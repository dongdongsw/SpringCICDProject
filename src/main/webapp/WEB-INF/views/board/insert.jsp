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
	<section class="product-details spad" id="board_insert">
	   <div class="container">
	       <div class="row">
	       		<table class="table">
	       			<tbody>
	       				<tr>
	       					<td width="10%" class="text-center">이름</td>
	       					<td width="90%" class="text-left">
	       						<input type="text" ref="nameRef" v-model="store.name" size="20">
	       					</td>
	       				</tr>
	       				<tr>
	       					<td width="10%" class="text-center">제목</td>
	       					<td width="90%" class="text-left">
	       						<input type="text" ref="subRef" v-model="store.subject" size="60">
	       					</td>
	       				</tr>
	       				<tr>
	       					<td width="10%" class="text-center">내용</td>
	       					<td width="90%" class="text-left">
	       						<textarea rows="10" cols="60" ref="contRef" v-model="store.content" size="20"></textarea>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td width="10%" class="text-center">비밀번호</td>
	       					<td width="90%" class="text-left">
	       						<input type="text" ref="pwdRef" v-model="store.pwd" size="10">
	       					</td>
	       				</tr>	       				
	       				<tr>
	       					<td width="10%" class="text-center">
	       						<button class="btn-sm btn-success" @click="store.boardInsert({nameRef,subRef,contRef,pwdRef})">글쓰기</button>
	       						<button class="btn-sm btn-info" onclick="javascript:history.back()">취소</button>
	       					</td>
	       				</tr>
	       			</tbody>
	       		</table>
	       	</div>
	   </div>
	</section>
	<script src="/boardjs/boardInsertStore.js"></script>
	<script>
		const {createApp,ref} = Vue
		const {createPinia} = Pinia
		const app = createApp({
			setup(){
				const store = useBoardInsertStore()
				const nameRef = ref('')
				const subRef = ref('')
				const contRef = ref('')
				const pwdRef = ref('')
				
				return {
					store,
					nameRef,
					subRef,
					contRef,
					pwdRef
				}
				
			}
		})
		app.use(createPinia())
		app.mount("#board_insert")
	</script>
</body>
</html>