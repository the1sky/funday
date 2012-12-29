package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取QDII型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetQDIIFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_QDII;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_QDII_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_QDII_FAIL;			
			super.start();
		}
	}		
}