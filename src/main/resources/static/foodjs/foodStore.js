const {defineStore} = Pinia
/*
	<template>
		HTML => JSP
	</template>
	<script>
		data()=> setup()
	</script>
*/
const useFoodStore = defineStore('food',{
	// data() => Model
	state:()=>({
		address:'마포',
		food_list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0,
		food_detail:{}
	}),
	
	// VM => Model
	actions:{
		async foodDetailData(fno){
			const res = await axios.get('http://localhost:8080/food/find_detail_vue/',{
					params:{
						fno:fno
					}
			})
			console.log(res.data)
			this.food_detail = res.data
		},
	
		// 비동기적 처리
		async dataRecv(){
			const res = await axios.get('http://localhost:8080/food/find_vue/',{
				params:{
					page : this.curpage,
					address: this.address
				}
			})
			console.log(res.data) // map
			this.food_list = res.data.list
			this.curpage = res.data.curpage
			this.totalpage = res.data.totalpage
			this.startPage = res.data.startPage
			this.endPage = res.data.endPage
			
		},
		find(addressRef){
			if(this.address === ''){
				addressRef.focus()
				return
			}
			this.curpage = 1
			this.dataRecv()
		},
		prev(page){
			this.curpage = page
			this.dataRecv()
		},
		next(page){
			this.curpage = page
			this.dataRecv()
		},
		pageChange(page){
			this.curpage = page
			this.dataRecv()
		},
		range(start,end){
			let arr = []
			let len = end - start
			for(let i = 0;  i<=len; i++){
				arr[i] = start
				start++
			}
			return arr
		}
	}
})