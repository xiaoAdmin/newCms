package com.ninebuy.cms

import com.ninebuy.cms.model.User

class LoginController {

	def userLogin() {
		User user=new User(params)
		
		String msg=""
		if(user.isEmpty()){
			msg="username or password is empty"
			return render(view: "/index", model: ["msg":msg]) 
		}
		
		def u=User.findByUsername(user.username)
		if(!u){
			msg="user not found"
		    return render(view: "/index", model: ["msg":msg]) 
		}
		
		if(u.username==user.username &&u.password==user.password){
			def userId = UUID.randomUUID().toString()
			session["user"]=user
			redirect (controller:"cmsIndex" ,action:"index")
			
		}else{
			msg="username or password error!"
			return render (["msg":msg])
		}
       
		
	}
}
