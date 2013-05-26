package com.ninebuy.service

import grails.orm.PagedResultList

import com.ninebuy.api.GoodsStatus
import com.ninebuy.cms.model.Goods

class SearchGoodsService {
	def params
	def max

	static statusList = [
		[key:GoodsStatus.UNUSED.value, value:GoodsStatus.UNUSED.description],
		[key:GoodsStatus.SELLING.value, value:GoodsStatus.SELLING.description],
		[key:GoodsStatus.TOMORROW.value,value:GoodsStatus.TOMORROW.description],
		[key:GoodsStatus.SCHEDULED.value,value:GoodsStatus.SCHEDULED.description]
	]
	
	def service(){
		def queryParams = [:]
		queryParams['max'] = Math.min(max ?: 10, 100)
		queryParams['offset'] = params['offset'] ?: 0
		println params
		PagedResultList goodsList = Goods.createCriteria().list(queryParams){
			println params
			if(params['goodsStatus']) {
				eq("goodsStatus","${params.goodsStatus}")
			}
			if(params['forSale']) {
				eq("forSale",new Boolean("${params.forSale}"))
			}
			if(params['hasEdited']) {
				eq('hasEdited',new Boolean("${params.hasEdited}"))
			}
			if(params['keyWords']) {
				or{
					like('nick',"%${params.keyWords}%")
					like('goodsName',"%${params.keyWords}%")
					like('goodsLocation',"%${params.keyWords}%")
//					like('promotionPrice',"%${params.keyWords}%")
				}
			}
			if(params['sort']) {
				order("${params.sort}", "${params.order}")
			}
		}

		return [goodsInstanceList:goodsList,
			goodsInstanceTotal: goodsList.totalCount,
			params:params,statusList:statusList]
	}
}
