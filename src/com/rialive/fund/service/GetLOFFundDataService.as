package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取LOF型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetLOFFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_LOF;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_LOF_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_LOF_FAIL;			
			super.start();
		}
	}		
}