package com.ninebuy.cms.model

class User {
	
	String username
	String password
	/**
	 * 0 super admin
	 * 1 admin
	 * 10 opertion
	 */
    int level
	def boolean validateEmpty(){
		if(username && password)  true	else false
	}
	static mapping={
		table 'cms_user'
	}
	static constraints = {
	}
}
