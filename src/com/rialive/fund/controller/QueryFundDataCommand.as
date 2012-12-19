package com.rialive.fund.controller{
	import com.rialive.fund.model.FundModel;
	import com.rialive.fund.service.GetFundDataService;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	import com.rialive.fund.view.events.FundEvent;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 查询某一个基金的数据
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class QueryFundDataCommand extends Command{
		[Inject]
		public var getFundDataService:GetFundDataService;
		[Inject]
		public var fundModel:FundModel;
		
		[Inject]
		public var event:FundEvent;
		
		public override function execute():void{
			var id:String = event.data as String;
			
			var data:Object = getFundDataService.getFundDataById( id );
			
			if( data ){
				fundModel.addFundData( id, data );
				this.dispatch( new GetFundDataServiceFeedbackEvent( GetFundDataServiceFeedbackEvent.GET_ONE_SUCC , data['name'] ) );
			}else{
				this.dispatch( new GetFundDataServiceFeedbackEvent( GetFundDataServiceFeedbackEvent.GET_ONE_FAIL ) );
			}
		}
	}
}