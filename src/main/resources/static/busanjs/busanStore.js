const {defineStore} = Pinia

const useBusanStore = defineStore('busan',{
	// 공통적용 변수
	state:()=>({
		list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0,
		type:1,
		detail:{}
	}),
	// 기능 설정 => axios => BASE_URL
	actions:{
		// 목록 => 페이지 처리
		async busanListData(type){
			this.type = type
			const res = await axios.get('http://localhost:9090/busan/list_vue/',{
					params:{
						page:this.curpage,
						type:this.type
					}
			})
			console.log(res.data)
			this.list = res.data.list
			this.curpage = res.data.curpage,
			this.totalpage = res.data.totalpage,
			this.startPage = res.data.startPage,
			this.endPage = res.data.endPage,
			this.type = res.data.type
		},
		// 페이징
		prev(page){
			this.curpage = page
			this.busanListData(this.type)
		},
		next(page){
			this.curpage = page
			this.busanListData(this.type)
		},
		pageChange(page){
			this.curpage = page
			this.busanListData(this.type)
		},
		range(start,end){
			let arr = []
			let len = end - start
			for(let i = 0; i <= len; i++){
				arr.push(start) //arr[i] = start
				start++;
			}
			return arr
		}
		
		
		// 상세보기
		
	}
})