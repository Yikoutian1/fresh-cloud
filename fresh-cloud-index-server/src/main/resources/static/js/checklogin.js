let login = new Vue({
	el:"#login_info", // 对应div的id，即这个vue的作用域
	data: {
		onlogin: false,
		outlogin: true,
		loginName: "匿名",
		loginId:"",
		carts:[],
		goodsCount: 0
	},
	mounted:function(){ //数据挂载之前，相当于jquery中的$(function(){})，页面加载完成
		axios({
			url:"/member/check",
			method:"get"
		}).then(result => {
			if (result.data.member) { // 说明登录了
				this.onlogin = true;
				this.outlogin = false;
				this.loginName = result.data.member.nickName;
				this.loginId = result.data.member.mno;
				if (result.data.carts) { 
					this.carts = result.data.carts;
					this.goodsCount = result.data.carts.length;
				}
			} else { // 说明没有登录
				this.onlogin = false;
				this.outlogin = true;
			}
		})
	}
})
