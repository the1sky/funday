package com.rialive.fund.service.events{
	import flash.events.Event;
	
	/**
	 * 获取基金数据服务的反馈事件
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetFundDataServiceFeedbackEvent extends CustomerEvent{
		public static const GET_CLOSE_SUCC:String = 'get_close_succ';
		public static const GET_CLOSE_FAIL:String = 'get_close_fail';
		public static const GET_ALL_SUCC:String = 'get_all_succ';
		public static const GET_ALL_FAIL:String = 'get_all_fail';
		public static const GET_ONE_SUCC:String = 'get_one_succ';
		public static const GET_ONE_FAIL:String = 'get_one_fail';
		
		public function GetFundDataServiceFeedbackEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, data, bubbles, cancelable);
		}
		
		public override function clone():Event{
			return new GetFundDataServiceFeedbackEvent( this.type, this.data, this.bubbles, this.cancelable );
		}
	}
}