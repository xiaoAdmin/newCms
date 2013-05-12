<%@ page import="com.ninebuy.api.GoodsStatus"%>
<div id="status" role="complementary">
	<h1>商品管理</h1>
	<ul>
		<li><g:link controller="goods" action="list"
				params="[goodsStatus:'UNUSED']">未处理商品</g:link></li>
		<li><g:link controller="goods" action="list"
				params="[goodsStatus:'SELLING']">今日特价</g:link></li>
		<li><g:link controller="goods" action="list"
				params="[goodsStatus:'TOMORROW']">明日预告</g:link></li>
		<li><g:link controller="goods" action="list"
				params="[goodsStatus:'SCHEDULED']">排期商品</g:link></li>
	</ul>
	<h1>后台功能管理</h1>
	<ul>
		<li>会员管理</li>
	</ul>
</div>

