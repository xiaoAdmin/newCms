package com.ninebuy

import javax.servlet.http.HttpServletRequest;

import com.sun.media.jai.codecimpl.util.Request

class LoginFilters {
    
	def filters = {
		all(controller:'*', action:'*') {
			before = {
				HttpServletRequest rs;
				//rs.getContextPath()
				def uri=request.getRequestURI()
				def url=request.getRequestURL()
			  
				if(uri.contains(request.getContextPath())){
					return true
				}
				if(url.indexOf("index.gsp")>0){
					return true
				}
				if (!session.user && !actionName.equals('userLogin')) {
					redirect(controller: 'login', action: 'userLogin')
					return false
				}
				return true
			}
		}
	}
}
