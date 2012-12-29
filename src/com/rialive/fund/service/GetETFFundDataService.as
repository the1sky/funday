package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取ETF型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetETFFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_ETF;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_ETF_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_ETF_FAIL;			
			super.start();
		}
	}		
}