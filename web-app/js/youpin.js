// JavaScript Documentfunction loadGoods(){	isLoading = true	$.get('goods-item.html', function(data) {		pageNo ++		isLoading = false  		$('.goods-list-ul').append(data);	});	}var isLoading = falsevar pageSize = 9var pageNo = 0var totalCount = 30$(window).scroll(function(){	if(isLoading)		return;	  	if((pageSize * pageNo) >=totalCount)		return;			var onEdge = ($(window).scrollTop() + $(window).height() > $(document).height() - 200);		if(onEdge){		loadGoods();	}})