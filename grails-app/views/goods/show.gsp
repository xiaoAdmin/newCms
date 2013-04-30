
<%@ page import="com.ninebuy.cms.model.Goods"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'goods.label', default: 'Goods')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-goods" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="unused">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-goods" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list goods">

			<g:if test="${goodsInstance?.numId}">
				<li class="fieldcontain"><span id="numId-label"
					class="property-label"><g:message code="goods.numId.label"
							default="Num Id" /></span> <span class="property-value"
					aria-labelledby="numId-label"><g:fieldValue
							bean="${goodsInstance}" field="numId" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.goodsName}">
				<li class="fieldcontain"><span id="goodsName-label"
					class="property-label"><g:message
							code="goods.goodsName.label" default="Goods Name" /></span> <span
					class="property-value" aria-labelledby="goodsName-label"><g:fieldValue
							bean="${goodsInstance}" field="goodsName" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.originalPrice}">
				<li class="fieldcontain"><span id="originalPrice-label"
					class="property-label"><g:message
							code="goods.originalPrice.label" default="Original Price" /></span> <span
					class="property-value" aria-labelledby="originalPrice-label"><g:fieldValue
							bean="${goodsInstance}" field="originalPrice" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.promotionPrice}">
				<li class="fieldcontain"><span id="promotionPrice-label"
					class="property-label"><g:message
							code="goods.promotionPrice.label" default="Promotion Price" /></span> <span
					class="property-value" aria-labelledby="promotionPrice-label"><g:fieldValue
							bean="${goodsInstance}" field="promotionPrice" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.clickUrl}">
				<li class="fieldcontain"><span id="clickUrl-label"
					class="property-label"><g:message
							code="goods.clickUrl.label" default="Click Url" /></span> <span
					class="property-value" aria-labelledby="clickUrl-label"><g:fieldValue
							bean="${goodsInstance}" field="clickUrl" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.hasEdited}">
				<li class="fieldcontain"><span id="hasEdited-label"
					class="property-label"><g:message
							code="goods.hasEdited.label" default="Has Edited" /></span> <span
					class="property-value" aria-labelledby="hasEdited-label"><g:formatBoolean
							boolean="${goodsInstance?.hasEdited}" /></span></li>
			</g:if>
			<g:if test="${goodsInstance?.forSale}">
				<li class="fieldcontain"><span id="forSale-label"
					class="property-label"><g:message code="goods.forSale.label"
							default="For Sale" /></span> <span class="property-value"
					aria-labelledby="forSale-label"><g:formatBoolean
							boolean="${goodsInstance?.forSale}" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.goodsStatus}">
				<li class="fieldcontain"><span id="goodsStatus-label"
					class="property-label"><g:message
							code="goods.goodsStatus.label" default="商品状态" /></span> <span
					class="property-value" aria-labelledby="goodsStatus-label"><g:fieldValue
							bean="${goodsInstance}" field="goodsStatus" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.picUrl}">
				<li class="fieldcontain"><span id="picUrl-label"
					class="property-label"><g:message code="goods.picUrl.label"
							default="Pic Url" /></span> <span class="property-value"
					aria-labelledby="picUrl-label"><g:fieldValue
							bean="${goodsInstance}" field="picUrl" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.creationDate}">
				<li class="fieldcontain"><span id="creationDate-label"
					class="property-label"><g:message
							code="goods.creationDate.label" default="Creation Date" /></span> <span
					class="property-value" aria-labelledby="creationDate-label"><g:formatDate
							date="${goodsInstance?.creationDate}" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.updateDate}">
				<li class="fieldcontain"><span id="updateDate-label"
					class="property-label"><g:message
							code="goods.updateDate.label" default="Update Date" /></span> <span
					class="property-value" aria-labelledby="updateDate-label"><g:formatDate
							date="${goodsInstance?.updateDate}" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.goodsLocation}">
				<li class="fieldcontain"><span id="goodsLocation-label"
					class="property-label"><g:message
							code="goods.goodsLocation.label" default="Goods Location" /></span> <span
					class="property-value" aria-labelledby="goodsLocation-label"><g:fieldValue
							bean="${goodsInstance}" field="goodsLocation" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.shopClickUrl}">
				<li class="fieldcontain"><span id="shopClickUrl-label"
					class="property-label"><g:message
							code="goods.shopClickUrl.label" default="Shop Click Url" /></span> <span
					class="property-value" aria-labelledby="shopClickUrl-label"><g:fieldValue
							bean="${goodsInstance}" field="shopClickUrl" /></span></li>
			</g:if>
			<g:if test="${goodsInstance?.nick}">
				<li class="fieldcontain"><span id="nick-label"
					class="property-label"><g:message code="goods.nick.label"
							default="Nick" /></span> <span class="property-value"
					aria-labelledby="nick-label"><g:fieldValue
							bean="${goodsInstance}" field="nick" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.commission}">
				<li class="fieldcontain"><span id="commission-label"
					class="property-label"><g:message
							code="goods.commission.label" default="Commission" /></span> <span
					class="property-value" aria-labelledby="commission-label"><g:fieldValue
							bean="${goodsInstance}" field="commission" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.commissionNum}">
				<li class="fieldcontain"><span id="commissionNum-label"
					class="property-label"><g:message
							code="goods.commissionNum.label" default="Commission Num" /></span> <span
					class="property-value" aria-labelledby="commissionNum-label"><g:fieldValue
							bean="${goodsInstance}" field="commissionNum" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.commissionRate}">
				<li class="fieldcontain"><span id="commissionRate-label"
					class="property-label"><g:message
							code="goods.commissionRate.label" default="Commission Rate" /></span> <span
					class="property-value" aria-labelledby="commissionRate-label"><g:fieldValue
							bean="${goodsInstance}" field="commissionRate" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.commissionVolume}">
				<li class="fieldcontain"><span id="commissionVolume-label"
					class="property-label"><g:message
							code="goods.commissionVolume.label" default="Commission Volume" /></span>

					<span class="property-value"
					aria-labelledby="commissionVolume-label"><g:fieldValue
							bean="${goodsInstance}" field="commissionVolume" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.sellerCreditScore}">
				<li class="fieldcontain"><span id="sellerCreditScore-label"
					class="property-label"><g:message
							code="goods.sellerCreditScore.label"
							default="Seller Credit Score" /></span> <span class="property-value"
					aria-labelledby="sellerCreditScore-label"><g:fieldValue
							bean="${goodsInstance}" field="sellerCreditScore" /></span></li>
			</g:if>

			<g:if test="${goodsInstance?.volume}">
				<li class="fieldcontain"><span id="volume-label"
					class="property-label"><g:message code="goods.volume.label"
							default="Volume" /></span> <span class="property-value"
					aria-labelledby="volume-label"><g:fieldValue
							bean="${goodsInstance}" field="volume" /></span></li>
			</g:if>

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${goodsInstance?.id}" />
				<g:link class="edit" action="edit" id="${goodsInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
