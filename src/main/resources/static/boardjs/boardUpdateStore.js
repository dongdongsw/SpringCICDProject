const {defineStore} = Pinia
const useBoardUpdateStore = defineStore('board_update',{
	
	// 공통으로 사용하는 데이터 설정 => static
	// redux => state(store) = action dispatch() => reduce : vuex
	// pinia= tanStack-Query
	// ------------------------------NodeJS / TypeScript
	state:()=>({
		name:'',
		subject:'',
		content:'',
		pwd:'',
		msg:'',
		no:0,
		vo:{}
	}),
	// 서버와 연동
	actions:{
		// insert => 유효성 검사 (NOT NULL = 반드시 입력이 되게 만든다)
		// 비동기 처리 => async
		async boardUpdate({ nameRef, subRef, contRef, pwdRef}){
			
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
			const res = await axios.put('http://localhost:8080/board/update_ok_vue/',{
				name:this.name,
				subject:this.subject,
				content:this.content,
				pwd:this.pwd,
				no:this.no
			})
			
			if(res.data.msg === 'yes'){
				location.href="/board/detail?no="+this.no
			}
			else{
				alert("비밀번호가 틀립니다.")
				this.pwd = ''
				pwdRef.focus()
			}
			
		},
		async boardUpdateData(no){
			this.no = no
			const res = await axios.get('http://localhost:8080/board/update_vue/',{
				params:{
					no:no
				}
			})
			this.vo = res.data
			this.name = res.data.name
			this.subject = res.data.subject
			this.content = res.data.content
			this.no = res.data.no
			
		}
	}
	
})