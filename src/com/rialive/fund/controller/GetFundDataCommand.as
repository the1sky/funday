package com.rialive.fund.controller{
	import com.rialive.fund.model.FundModel;
	import com.rialive.fund.service.GetFundDataService;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	import org.robotlegs.mvcs.Command;
	
	/**
	 * 获取基金数据
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetFundDataCommand extends Command{
		[Inject]
		public var getFundDataService:GetFundDataService;
		[Inject]
		public var fundModel:FundModel;
		
		public override function execute():void{				
			commandMap.detain( this );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_SUCC, getCloseSuccHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_FAIL, getCloseFailHandler );
			getFundDataService.start();
		}
		
		private function getCloseSuccHandler(e:GetFundDataServiceFeedbackEvent):void{			
			fundModel.allCloseData = e.data;
			clear();
		}
		
		private function getCloseFailHandler(e:GetFundDataServiceFeedbackEvent):void{
			clear();
		}
		
		/**
		 * 清除
		 * 
		 */		
		private function clear():void{
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_SUCC, getCloseSuccHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_FAIL, getCloseFailHandler );
			commandMap.release( this );
		}
	}
}