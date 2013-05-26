<%@ page import="com.ninebuy.cms.model.Goods"%>


<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'numId', 'error')} required">
	<label for="numId"> <g:message code="goods.numId.label"
			default="Num Id" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="numId" type="number" value="${goodsInstance.numId}"
		required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsName', 'error')} ">
	<label for="goodsName"> <g:message code="goods.goodsName.label"
			default="Goods Name" />

	</label>
	<g:textField name="goodsName" value="${goodsInstance?.goodsName}"
		required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'originalPrice', 'error')} ">
	<label for="originalPrice"> <g:message
			code="goods.originalPrice.label" default="Original Price" />

	</label>
	<g:textField name="originalPrice"
		value="${goodsInstance?.originalPrice}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'promotionPrice', 'error')} ">
	<label for="promotionPrice"> <g:message
			code="goods.promotionPrice.label" default="Promotion Price" />

	</label>
	<g:textField name="promotionPrice"
		value="${goodsInstance?.promotionPrice}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'clickUrl', 'error')} ">
	<label for="clickUrl"> <g:message code="goods.clickUrl.label"
			default="Click Url" />

	</label>
	<g:textField name="clickUrl" value="${goodsInstance?.clickUrl}"
		required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'hasEdited', 'error')} ">
	<label for="hasEdited"> <g:message code="goods.hasEdited.label"
			default="Has Edited" />
	</label>
	<g:checkBox name="hasEdited" value="${true}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'forSale', 'error')} ">
	<label for="forSale"> <g:message code="goods.forSale.label"
			default="For Sale" />
	</label>
	<g:checkBox name="forSale" value="${goodsInstance?.forSale}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsStatus', 'error')} ">
	<label for="goodsStatus"> <g:message code="goods.goodsStatus.label"
			default="商品状态" />
	</label>
<g:select id="goodsStatus" name='goodsStatus'
								value="${params.goodsStatus}" from="${statusList}"
								optionKey="key" optionValue="value"
								onchange="changeStatus(${goodsInstance.id},'goodsStatus',this.value)" />
</div>								
<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'picUrl', 'error')} ">
	<label for="picUrl"> <g:message code="goods.picUrl.label"
			default="Pic Url" />

	</label>
	<g:textField name="picUrl" value="${goodsInstance?.picUrl}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate"> <g:message
			code="goods.creationDate.label" default="Creation Date" /> <span
		class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"
		value="${goodsInstance?.creationDate}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'updateDate', 'error')} required">
	<label for="updateDate"> <g:message
			code="goods.updateDate.label" default="Update Date" /> <span
		class="required-indicator">*</span>
	</label>
	<g:datePicker name="updateDate" precision="day"
		value="${goodsInstance?.updateDate}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'goodsLocation', 'error')} ">
	<label for="goodsLocation"> <g:message
			code="goods.goodsLocation.label" default="Goods Location" />

	</label>
	<g:textField name="goodsLocation"
		value="${goodsInstance?.goodsLocation}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'shopClickUrl', 'error')} ">
	<label for="shopClickUrl"> <g:message
			code="goods.shopClickUrl.label" default="Shop Click Url" />

	</label>
	<g:textField name="shopClickUrl" value="${goodsInstance?.shopClickUrl}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'nick', 'error')} ">
	<label for="nick"> <g:message code="goods.nick.label"
			default="Nick" />

	</label>
	<g:textField name="nick" value="${goodsInstance?.nick}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'commission', 'error')} ">
	<label for="commission"> <g:message
			code="goods.commission.label" default="Commission" />

	</label>
	<g:textField name="commission" value="${goodsInstance?.commission}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'commissionNum', 'error')} ">
	<label for="commissionNum"> <g:message
			code="goods.commissionNum.label" default="Commission Num" />

	</label>
	<g:textField name="commissionNum"
		value="${goodsInstance?.commissionNum}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'commissionRate', 'error')} ">
	<label for="commissionRate"> <g:message
			code="goods.commissionRate.label" default="Commission Rate" />

	</label>
	<g:textField name="commissionRate"
		value="${goodsInstance?.commissionRate}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'commissionVolume', 'error')} ">
	<label for="commissionVolume"> <g:message
			code="goods.commissionVolume.label" default="Commission Volume" />

	</label>
	<g:textField name="commissionVolume"
		value="${goodsInstance?.commissionVolume}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'sellerCreditScore', 'error')} required">
	<label for="sellerCreditScore"> <g:message
			code="goods.sellerCreditScore.label" default="Seller Credit Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sellerCreditScore" type="number"
		value="${goodsInstance.sellerCreditScore}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: goodsInstance, field: 'volume', 'error')} required">
	<label for="volume"> <g:message code="goods.volume.label"
			default="Volume" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="volume" type="number" value="${goodsInstance.volume}"
		required="" />
</div>

