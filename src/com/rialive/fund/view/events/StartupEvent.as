package com.rialive.fund.view.events{
	import com.rialive.fund.service.events.CustomerEvent;
	
	import flash.events.Event;
	
	/**
	 * 启动相关的事件
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class StartupEvent extends CustomerEvent{
		public static const GET_FUND_DATA:String = 'get_fund_data';
		public static const INIT_VIEW:String = 'init_view';
		
		public function StartupEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, data, bubbles, cancelable);
		}
		
		/**
		 * 克隆
		 *  
		 * @return 
		 * 
		 */		
		public override function clone():Event{
			return new StartupEvent( this.type, this.data, this.bubbles, this.cancelable );
		}
	}
}