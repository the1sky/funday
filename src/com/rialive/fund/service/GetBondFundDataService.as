package com.rialive.fund.service{
	import com.rialive.fund.configuration.FundAPIConfig;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	/**
	 * 获取债券型基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetBondFundDataService extends GetFundDataService{			
		public override function start():void{	
			apiUrl = FundAPIConfig.URL_BOND;
			succFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_BOND_SUCC;
			failFeedbackEventName = GetFundDataServiceFeedbackEvent.GET_BOND_FAIL;			
			super.start();
		}
	}		
}