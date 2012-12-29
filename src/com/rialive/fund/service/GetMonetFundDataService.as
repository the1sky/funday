package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取货币型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetMonetFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_MONET;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_MONET_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_MONET_FAIL;			
			super.start();
		}
	}		
}