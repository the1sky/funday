package com.rialive.fund.view{
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	import com.rialive.fund.view.events.FundEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class InputMediator extends Mediator{
		[Inject]
		public var view:InputView;
		
		public override function onRegister():void{		
			this.addViewListener( MouseEvent.CLICK, clickHandler ); 
			this.addContextListener( GetFundDataServiceFeedbackEvent.GET_ONE_SUCC, queryFundSuccHandler );
			this.addContextListener( GetFundDataServiceFeedbackEvent.GET_ONE_FAIL, queryFundFailHandler );
		}
		
		private function clickHandler(e:MouseEvent):void{
			if( e.target == view.confirm ){
				this.dispatch( new FundEvent( FundEvent.QUERY_FUND, view.inputData ) );
			}
		}
		
		private function queryFundSuccHandler(e:GetFundDataServiceFeedbackEvent):void{
			view.outData = e.data as String;
		}
		
		private function queryFundFailHandler(e:GetFundDataServiceFeedbackEvent):void{			
		}
	}
}