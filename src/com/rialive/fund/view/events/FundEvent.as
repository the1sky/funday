package com.rialive.fund.view.events{
	import com.rialive.fund.service.events.CustomerEvent;
	
	import flash.events.Event;
	
	/**
	 * 基金相关事件
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class FundEvent extends CustomerEvent{
		public static const QUERY_FUND:String = 'query_fund';
		
		public function FundEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, data, bubbles, cancelable);
		}
		
		public override function clone():Event{		
			return new FundEvent( this.type, this.data, this.bubbles, this.cancelable );
		}
	}
}