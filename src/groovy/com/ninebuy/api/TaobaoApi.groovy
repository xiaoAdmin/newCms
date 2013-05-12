package com.ninebuy.api

import com.taobao.api.DefaultTaobaoClient
import com.taobao.api.TaobaoClient
import com.taobao.api.domain.PromotionDisplayTop
import com.taobao.api.domain.PromotionInItem
import com.taobao.api.domain.TaobaokeItem
import com.taobao.api.request.MarketingPromotionsGetRequest
import com.taobao.api.request.TaobaokeItemsCouponGetRequest
import com.taobao.api.request.TaobaokeItemsGetRequest
import com.taobao.api.request.UmpPromotionGetRequest
import com.taobao.api.response.MarketingPromotionsGetResponse
import com.taobao.api.response.TaobaokeItemsCouponGetResponse
import com.taobao.api.response.TaobaokeItemsGetResponse
import com.taobao.api.response.UmpPromotionGetResponse

class TaobaoApi{

	String url = "http://gw.api.taobao.com/router/rest";
	String appkey = "21453849";
	String secret = "54bd9a787d60ac059749495c751e6c7b";
	TaobaoClient client=new DefaultTaobaoClient(url, appkey, secret);

	def promotionPrice(String keyword){
		TaobaokeItemsCouponGetRequest req=new TaobaokeItemsCouponGetRequest();
		req.setKeyword("琛ｆ湇");
		req.setCid(0L);
		this.setFields(req)
		TaobaokeItemsCouponGetResponse rs = client.execute(req);
		def list= rs.getTaobaokeItems()
		list.each{ println it }
	}

	/**
	 * 获得商品促销活动价格
	 * @param id 商品ID
	 * @return 促销价，为空说明没有促销
	 */

	public  String getPromotionPrice(long id) {
		if(!id){
			return ""
		}
		String promPrice = "";
		// taobao.ump.promotion.get
		UmpPromotionGetRequest req = new UmpPromotionGetRequest();
		req.setItemId(id);
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		// 获取折扣可以不使用sessionKey
		UmpPromotionGetResponse response = null;

		response = client.execute(req, null);

		PromotionDisplayTop top = response.getPromotions();
		// 商品优惠详情查询，可查询商品设置的详细优惠。包括限时折扣，满就送等官方优惠以及第三方优惠。
		// 下面是从列表查一个符合当前日期范围的促销价格

		List<PromotionInItem> list = top.getPromotionInItem();
		if(list==null){
			return null;
		}
		for (int i = 0; i < list.size(); i++) {
			PromotionInItem item = list.get(i);
			Date startDt = item.getStartTime();
			Date endDt = item.getEndTime();
			Date currentDate = new Date(System.currentTimeMillis());
			if (currentDate.after(startDt) && currentDate.before(endDt)) {
				promPrice = item.getItemPromoPrice();
				// System.out.print(item.getItemPromoPrice());
				break;
			}
		}

		return promPrice;
	}

	def testApi(String id){

		MarketingPromotionsGetRequest req=new MarketingPromotionsGetRequest();
		req.setFields("promotion_id,promotion_title,item_id,status");
		req.setNumIid(id);
		MarketingPromotionsGetResponse response = client.execute(req , null);
		response.getPromotions().each{
			println it.getStatus();println it.getPromotionDesc()
		}
	}

	private def setFields(req){
		req.setFields("promotion_price,num_iid,title,nick,pic_url,price,click_url,commission,commission_rate,commission_num,commission_volume,shop_click_url,seller_credit_score,item_location,volume")
	}
	/**
	 * 搜索淘客商品
	 * @param keyword
	 * @param pageNo
	 * @param pageSize
	 * @param sortBy
	 * @return
	 */
	def   List<TaobaokeItem> searchTaoke(String keyword,long pageNo,long pageSize,String sortBy) {
		if(!keyword){
			return null
		}
		TaobaokeItemsGetRequest req = new TaobaokeItemsGetRequest();
		//req.setFields("num_iid,title,nick,pic_url,price,click_url,commission,commission_rate,commission_num,commission_volume,shop_click_url,seller_credit_score,item_location,volume");
		this.setFields(req)
		if(sortBy){
			req.setSort("delistTime_"+sortBy);
		}
		if(pageNo&&pageSize){
			req.setPageNo(pageNo)
			req.setPageSize(pageSize)
		}
		req.setCid(0L);
		req.setKeyword(keyword);

		TaobaokeItemsGetResponse response = client.execute(req);
		response.getTaobaokeItems()
	}
}






