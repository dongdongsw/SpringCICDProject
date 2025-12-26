const {defineStore} = Pinia
const useBoardDeleteStore = defineStore('board_delete',{
	state:()=>({
		no:0,
		pwd:''
	}),
	
	actions:{
		async boardDelete(no,pwdRef){
			this.no = no
			if(this.pwd == ''){
				pwdRef.focus()
				return
			}
			const res = await axios.delete('http://localhost:8080/board/delete_vue/',{
				params:{
					no:this.no,
					pwd:this.pwd
				}
			})
			console.log(res.data)
			if(res.data.msg === 'yes'){
				location.href="/board/list"
			}
			else{
				alert("비밀번호가 틀립니다")
				this.pwd = ''
				pwdRef.focus()
			}
		}
	}
})