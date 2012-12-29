package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取创新型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetInnovFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_INNOV;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_INNOV_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_INNOV_FAIL;			
			super.start();
		}
	}		
}