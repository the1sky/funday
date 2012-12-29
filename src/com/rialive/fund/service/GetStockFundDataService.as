package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取股票型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetStockFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_STOCK;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_STOCK_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_STOCK_FAIL;			
			super.start();
		}
	}		
}