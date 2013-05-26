
<%@ page import="com.ninebuy.cms.model.Goods"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'goods.label', default: 'Goods')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<style type="text/css" media="screen"></style>
<g:javascript library="jquery" />
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'left_navigator.css')}" />
<script type="text/javascript">
	function selectAll(checked) {
		var selectors = $('input[name=selector]')
		selectors.each(function() {
			this.checked = checked
		})
	}

	function deleteGoods(id) {
		if (confirm("确认要删除吗？")) {
			$("#id").val(id);
			document.goods.submit();
		}
	}

	function changeStatus(id,field,checked){
		var params = {id:id}
		params[field] = checked
		$.post('../goods/changeStatus',params, function(data) {
			if(!data.success){
				alert(data.message)
			}
			$('#goodsList').submit()
			//location.reload()
		});
	}

</script>
</head>
<body>
	<g:render template="/layouts/cms/menu" />
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="load-data" action='load'>
					<g:message code="加载数据" />
				</g:link></li>
		</ul>
	</div>
	<div id="page-body" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="nav">
			<g:form name="goods" action="delete">
				<g:hiddenField name="id" />
				<g:hiddenField name="menu" value="${params.action}" />
			</g:form>
			<g:form name="goodsList" action="${params.action}">
				<g:hiddenField name="goodsStatus" value="${params.goodsStatus}" />
				<g:submitButton name="search" class="search"
					value="${message(code: 'default.button.search.label', default: 'search')}" />
				<g:if test="${params.goodsStatus != 'SELLING'}">
						编辑状态: <g:select id="hasEdited" name='hasEdited'
						noSelection="${['':'Select']}" value="${params.hasEdited}"
						from="[[key:false,value:'未编辑'],[key:true,value:'已编辑']]"
						optionKey="key" optionValue="value" />
				</g:if>
				<g:if test="${params.goodsStatus == 'SELLING'}">
							上架状态: <g:select id="forSale" name='forSale'
						noSelection="${['':'Select']}" value="${params.forSale}"
						from="[[key:false,value:'下架'],[key:true,value:'上架']]"
						optionKey="key" optionValue="value" />
				</g:if>
						关键字: <g:textField name="keyWords" value="${params.keyWords}"/>
			</g:form>
		</div>
		<table id="goods-list">
			<thead>
				<tr>
					<g:sortableColumn property="id" params="${params}"
						title="${message(code: 'goods.numId.label', default: 'ID')}" />

					<g:sortableColumn property="goodsName" params="${params}"
						title="${message(code: 'goods.goodsName.label', default: '商品名称')}" />

					<g:sortableColumn property="originalPrice" params="${params}"
						title="${message(code: 'goods.originalPrice.label', default: '原价')}" />

					<g:sortableColumn property="promotionPrice" params="${params}"
						title="${message(code: 'goods.promotionPrice.label', default: '折扣价')}" />

					<th colspan="3">状态</th>

					<g:sortableColumn property="creationDate" params="${params}"
						title="${message(code: 'goods.creationDate.label', default: '创建日期')}" />
					<th />
					<th />
					<th />
				</tr>
			</thead>
			<tbody>
				<g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							${fieldValue(bean: goodsInstance, field: "id")}
						</td>
						<td><g:img
								uri="${fieldValue(bean: goodsInstance, field: "picUrl")}"
								width="50" height="50" /> <a id="${goodsInstance.id}"
							href="${goodsInstance.clickUrl}" target="_blank"> ${fieldValue(bean: goodsInstance, field: "goodsName")}
						</a></td>
						<td>
							${fieldValue(bean: goodsInstance, field: "originalPriceDes")}
						</td>

						<td>
							${fieldValue(bean: goodsInstance, field: "promotionPriceDes")}
						</td>
						<td><g:if test="${params.goodsStatus != 'SELLING'}">编辑 <g:checkBox
									name="hasEdited" checked="${goodsInstance.hasEdited}"
									value="${goodsInstance.hasEdited}"
									onclick="changeStatus(${goodsInstance.id},'hasEdited',this.checked)" />
							</g:if></td>
						<td><g:if test="${params.goodsStatus == 'SELLING'}">上架
								<g:checkBox name="forSale" checked="${goodsInstance.forSale}"
									value="${goodsInstance.forSale}"
									onclick="changeStatus(${goodsInstance.id},'forSale',this.checked)" />
							</g:if></td>
						<td><g:select id="goodsStatus" name='goodsStatus'
								value="${params.goodsStatus}" from="${statusList}"
								optionKey="key" optionValue="value"
								onchange="changeStatus(${goodsInstance.id},'goodsStatus',this.value)" /></td>
						<td>
							${fieldValue(bean: goodsInstance, field: "creationDateDes")}
						</td>

						<td><g:link action="show" id="${goodsInstance.id}">查看</g:link></td>
						<td><g:link action="edit" id="${goodsInstance.id}">编辑</g:link></td>
						<td><g:link url="javascript:deleteGoods(${goodsInstance.id})"
								id="${goodsInstance.id}">删除</g:link></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${goodsInstanceTotal}" params="${params}" />
		</div>
	</div>
</body>
</html>
