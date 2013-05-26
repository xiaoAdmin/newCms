package com.ninebuy.cms.model

import org.codehaus.groovy.grails.plugins.codecs.MD5Codec

class User {

	String username
	String password
	/**
	 * 0 super admin
	 * 1 admin
	 * 10 opertion
	 */
	int level

	def boolean isEmpty(){
		if(username && password)  false	else true
	}
	
	static mapping={ table 'cms_user' }

	static constraints = {
	}
}
