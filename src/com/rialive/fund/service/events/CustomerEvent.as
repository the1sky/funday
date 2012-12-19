package com.rialive.fund.service.events{
	
	import flash.events.Event;
	
	/**
	 * 自定义事件类基类，其它类最好从此直接继承
	 * 
	 * @author dumingtan
	 * @date 2010-10-08
	 * 
	 */	
	public class CustomerEvent extends Event{
		private var _data:Object;
		public function CustomerEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
			_data = data;
		}
		
		/**
		 * 数据
		 *  
		 * @return 
		 * 
		 */		
		public function get data():Object{
			return _data;
		}
		
		/**
		 * 克隆
		 *  
		 * @return 
		 * 
		 */		
		public override function clone():Event{
			return new CustomerEvent( this.type, this.data, this.bubbles, this.cancelable );
		}
	}
}