package com.ninebuy.cms.model

class Goods {
	static String UNUSED = 'UNUSED'
	static SELLING ='SELLING'
	static TOMORROW ='TOMORROW'
	static SCHEDULED ='SCHEDULED'

	static statusList=[
		[key:UNUSED, value:"未处理"],
		[key:SELLING,value:'今日特价'],
		[key:TOMORROW,value:'明日预告'],
		[key:SCHEDULED,value:'排期商品']
	]

	Long numId
	String nick
	String goodsName
	String originalPrice
	String goodsLocation
	Long SellerCreditScore//卖家信用，可能用于业务排序
	String clickUrl
	String shopClickUrl
	String picUrl
	String commissionRate
	String commission //淘宝客佣金
	String commissionNum//累计成交量.注：返回的数据是30天内累计推广量
	String commissionVolume
	Long volume//30天内交易量
	String promotionPrice

	//
	Date creationDate = new Date()
	Date updateDate = new Date()

	String creationDateString = creationDate.format('yyyy-MM-dd')

	String goodsStatus = UNUSED
	boolean hasEdited  = false//已经编辑标志
	boolean forSale = false//上架标记

	long parentCid
	List cids
	
	static constraints = {
		clickUrl(maxSize: 300)
		shopClickUrl(maxSize:300)
		
		goodsStatus validator: {val, obj ->
			if(val != Goods.UNUSED){
				return obj.hasEdited?:['invalid.changestatus']
			}
		}
	}

	static mapping = {
	}
}
