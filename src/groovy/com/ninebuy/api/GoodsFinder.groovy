package com.ninebuy.api

import com.ninebuy.cms.model.Goods
import com.taobao.api.domain.TaobaokeItem
import java.lang.Double

class GoodsFinder {
	/**
	 * 开始
	 */
	void start() {
		/*
		 * 1.查询商品
		 * 2.找出新商品,存入数据库
		 * 3.旧商品更新数据
		 */
		//TODO:添加商品分类参数
		processGoods(1, 100,"米折网专享")
	}

	def processGoods(long pageNo,long pageSize,String Keyword){
		def remoteGoods = findGoods(pageNo, pageSize,Keyword)
		
		def localGoodsMap = loadLocalGoods()
		println '---'+remoteGoods.size()
		remoteGoods.each {
			if (localGoodsMap.keySet().contains(it.numId)) {
				//TODO：update info and save
			}
			println it.save()
		}
	}

	def Map loadLocalGoods(){
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, -7);
		def timestamp = c.getTime();

		def query = Goods.where { (creationDate > timestamp) }
		def map=[:]
		query.list()?.each{
			map[it.numId]=it
		}
		map
	}

	/**
	 * 获取goods列表
	 * @return
	 */
	def List<Goods> findGoods(long pageNo,long pageSize,String keyword){
		def tao = new TaobaoApi()
		def taokeList = tao.searchTaoke(keyword, pageNo, pageSize, "desc")
		taokeList.collect { createGoods(it) }
	}

	/**
	 * 根据taokeitem创建goods
	 * @param item
	 * @return
	 */
	def Goods createGoods(TaobaokeItem item){
		def goods = new Goods([
			numId:item.numIid,
			nick:item.nick,
			goodsName:item.title,
			originalPrice:Double.parseDouble(item.price),
			originalPriceDes:item.price,
			goodsLocation:item.itemLocation,
			sellerCreditScore:item.sellerCreditScore,
			clickUrl:item.clickUrl,
			shopClickUrl:item.shopClickUrl,
			picUrl:item.picUrl,
			commissionRate:item.commissionRate,
			commission:item.commission,
			commissionNum:item.commissionNum,
			commissionVolume:item.commissionVolume,
			volume:item.volume,
			promotionPrice:Double.parseDouble(item.promotionPrice),
			promotionPriceDes:item.promotionPrice
		])
		//TODO:找个好点的正则
		goods['goodsName'] = goods.getGoodsName().
				replaceAll("^((【)?米折网专享(】)?)|(<[a-zA-Z]+[1-9]?[^><]*>)|(</[a-zA-Z]+[1-9]?>)", "")
		return goods
	}

	def show(TaobaokeItem item){
		println "淘宝客商品数字id:"+ item.getNumIid()
		println "商品title:"+item.getTitle()
		println "商品价格:"+item.getPrice()
		println "卖家信用等级"+item.getSellerCreditScore()
		println "推广点击url:" +item.getClickUrl()
		println	"图片url"+item.getPicUrl()
		println	"30天累计成交量"+item.getCommissionNum()
		println "促销价格"+item.getPromotionPrice()
		item.getItemLocation()
	}
}
