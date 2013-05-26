package com.ninebuy.cms.model

import com.ninebuy.api.GoodsStatus;

class Goods {

	Long numId//淘宝客商品数字id
	String nick
	String goodsName
	Double originalPrice//商品原价
	String originalPriceDes//商品原价des
	String goodsLocation//商品所在地
	Long SellerCreditScore//卖家信用，可能用于业务排序
	String clickUrl//推广点击url
	String shopClickUrl//商品所在店铺的推广点击url
	String picUrl
	String commissionRate//淘宝客佣金比率，比如：1234.00代表12.34%
	String commission //淘宝客佣金
	String commissionNum//累计成交量.注：返回的数据是30天内累计推广量
	String commissionVolume//累计总支出佣金量
	Long volume//30天内交易量
	Double promotionPrice //促销价格
	String promotionPriceDes//促销价格des

	String cid//标准商品后台类目id。该ID可以通过taobao.itemcats.get接口获取到,数字串，例如：1234,34343,2313
	
	Date creationDate = new Date()
	String creationDateDes= creationDate.format('yyyy-MM-dd')
	
	Date updateDate = new Date()
	String updateDateDes= updateDate.format('yyyy-MM-dd')
	
	String goodsStatus = GoodsStatus.UNUSED.value
	boolean hasEdited  = false//已经编辑标志
	boolean forSale = false//上架标记	
	
	static constraints = {
		clickUrl(maxSize: 1024)
		shopClickUrl(maxSize:1024)
		goodsName(maxSize:512)
		
		goodsStatus validator: {val, obj ->
			if(!val.equals(GoodsStatus.UNUSED.value)){
				return obj.hasEdited?:['invalid.changestatus']
			}
		}
	}

	static mapping = {
		table 'cms_goods'
	}
}
