<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	login 
	|	Spring Security
	|	JWT
	|	kako 로그인 / gogle 로그인
	----------------------------
	Back-End
	=> 알림 : 카프카
	=> 실시간 : webSocket / batch => Git Action / docker / docker-component
									Jenkins
	----------------------------
	MSA + React => 연습  : kube
	
	
 --%>
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
                        <h2>회원</h2>
                        <div class="breadcrumb__option">
                            <span>로그인</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section class="product-details spad" id="member_login">
	   <div class="container">
	   		<div class="row" style="margin: 0px auto;">
	   			<table class="table">
	   				<tr>
	   					<td class="text-center" width="10%">ID</td>
	   					<td class="text-left" width="90%">
	   						<input type="text" size="20" class="input-sm" ref="idRef" v-model="store.id"> 
	   					</td>
	   				</tr>
	   				<tr>
	   					<td class="text-center" width="10%">PW</td>
	   					<td class="text-left" width="90%">
	   						<input type="password" size="20" class="input-sm" ref="pwdRef" v-model="store.pwd"> 
	   					</td>
	   				</tr>
	   				<tr>
	   					<td colspan="2" class="text-center">
	   						<!-- <a href="/member/login_ok" class="btn-sm btn-primary">로그인</a> -->
	   						<button type="button" class="btn-sm btn-primary" @click="store.login(idRef, pwdRef)">로그인</button>
	   						<button type="button" class="btn-sm btn-primary" onclick="javascript:history.back()">취소</button>
	   					</td>
	   				</tr>
	   			</table>
	   		</div>
	   </div>
	</section>
	<script src="/memberjs/memberStore.js"></script>
	<script>
		const {createApp, ref, onMounted} = Vue
		const {createPinia} = Pinia
		const app = createApp({
			
			setup(){
				const store = useMemberStore()
				const idRef = ref(null)
				const pwdRef = ref(null)
				
				
				return{
					store,
					idRef,
					pwdRef
				}
			}
		})
		app.use(createPinia())
		app.mount("#member_login")
	</script>
</body>
</html>