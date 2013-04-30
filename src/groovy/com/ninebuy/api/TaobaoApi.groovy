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
	 * 鑾峰緱鍟嗗搧淇冮攢娲诲姩浠锋牸
	 * @param id 鍟嗗搧ID
	 * @return 淇冮攢浠凤紝涓虹┖璇存槑娌℃湁淇冮攢
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
		// 鑾峰彇鎶樻墸鍙互涓嶄娇鐢╯essionKey
		UmpPromotionGetResponse response = null;

		response = client.execute(req, null);

		PromotionDisplayTop top = response.getPromotions();
		// 鍟嗗搧浼樻儬璇︽儏鏌ヨ锛屽彲鏌ヨ鍟嗗搧璁剧疆鐨勮缁嗕紭鎯犮�鍖呮嫭闄愭椂鎶樻墸锛屾弧灏遍�绛夊畼鏂逛紭鎯犱互鍙婄涓夋柟浼樻儬銆�
		// 涓嬮潰鏄粠鍒楄〃鏌ヤ竴涓鍚堝綋鍓嶆棩鏈熻寖鍥寸殑淇冮攢浠锋牸

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
	 * 鎼滅储娣樺鍟嗗搧
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
		def list=response.getTaobaokeItems()
		//		for( item in list){
		//			item.promotionPrice
		//			def promotionPrice= getPromotionPrice(item.getNumIid())
		//			item.setPromotionPrice(promotionPrice)
		//		}

		list


	}
}






