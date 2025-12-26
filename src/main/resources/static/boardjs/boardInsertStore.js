const {defineStore} = Pinia
const useBoardInsertStore = defineStore('board_insert',{
	
	// 공통으로 사용하는 데이터 설정 => static
	// redux => state(store) = action dispatch() => reduce : vuex
	// pinia= tanStack-Query
	// ------------------------------NodeJS / TypeScript
	state:()=>({
		name:'',
		subject:'',
		content:'',
		pwd:'',
		msg:''
	}),
	// 서버와 연동
	actions:{
		// insert => 유효성 검사 (NOT NULL = 반드시 입력이 되게 만든다)
		// 비동기 처리 => async
		async boardInsert({nameRef, subRef, contRef, pwdRef}){
			if(this.name === ''){
				nameRef.focus()
				return
			}
			if(this.subject === ''){
				subRef.focus()
				return
			}
			if(this.content === ''){
				contRef.focus()
				return
			}
			if(this.pwd === ''){
				pwdRef.focus()
				return
			}
			// => jsp로 처리하는게 낫다
			const res = await axios.post('http://localhost:8080/board/insert_vue/',{
				name:this.name,
				subject:this.subject,
				content:this.content,
				pwd:this.pwd
			})
			
			if(res.data.msg === 'yes'){
				location.href="/board/list"
			}
			else{
				alert("글쓰기 입력에 실패 하셨습니다.")
			}
			
		}
	}
	
})