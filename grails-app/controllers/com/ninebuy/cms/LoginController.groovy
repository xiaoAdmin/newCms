package com.ninebuy.cms

import com.ninebuy.api.TaobaoApi
import com.ninebuy.cms.model.User

class LoginController {

	def userLogin() {
		def user=new User(params)
		String msg=""
		if(user.validateEmpty()){
			msg="用户名密码不能为空"
			//redirect(controller:"")
			render(["msg":msg])
		}
		def u=User.findByUsername(user.username)
		if(!u){
			msg="user not found"
		    return render(view: "/index", model: ["msg":msg]) 
			
		}
		if(u.username==user.username &&u.password==user.password){
			session["user"]=user
			redirect (controller:"cmsIndex" ,action:"index")
		}else{
			msg="username or password error!"
			return render (["msg":msg])
		}
       
		
	}
}
