package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取封闭型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetCloseFundDataService extends GetFundDataService{
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_CLOSE;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_CLOSE_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_CLOSE_FAIL;			
			super.start();
		}
	}
}