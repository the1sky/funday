package com.rialive.fund.service{
	import baidu.lib.serialization.JSON2;
	
	import com.godpaper.as3.utils.LogUtil;
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * 获取基金数据
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetFundDataService extends Actor implements IFeedbackEventName{
		private var _data:Object;
		private var _apiUrl:String = '';		
		private var _succFeedbackEventName:String = '';
		private var _failFeedbackEventName:String = '';
		private var _otherFeedbackEventName:String = '';
		
		/**
		 * 获取/设置获取数据的api url
		 *  
		 * @param value
		 * 
		 */		
		public function set apiUrl(value:String):void{
			_apiUrl = value;
		}
		public function get apiUrl():String{
			return _apiUrl;
		}
		
		/**
		 * 获取基金数据
		 *  
		 * @return 
		 * 
		 */		
		public function get fundData():Object{
			return _data;
		}
		
		/**
		 * 获取/设置成功时的反馈事件名称
		 *  
		 * @return 
		 * 
		 */		
		public function get succFeedbackEventName():String{
			return _succFeedbackEventName;
		}
		public function set succFeedbackEventName(value:String):void{
			_succFeedbackEventName = value;
		}
		
		/**
		 * 获取/设置失败时的反馈事件名称
		 *  
		 * @return 
		 * 
		 */		
		public function get failFeedbackEventName():String{
			return _failFeedbackEventName;
		}
		public function set failFeedbackEventName(value:String):void{
			_failFeedbackEventName = value;
		}
		
		/**
		 * 获取/设置其它情况时的反馈事件名称
		 *  
		 * @return 
		 * 
		 */		
		public function get otherFeedbackEventName():String{
			return _otherFeedbackEventName;
		}
		public function set otherFeedbackEventName(value:String):void{
			_otherFeedbackEventName = value;
		}
		
		/**
		 * 开始获取数据 
		 * 
		 */		
		public function start():void{	
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener( Event.COMPLETE, loadedHandler );
			urlLoader.addEventListener( IOErrorEvent.IO_ERROR,EORHandler );
			urlLoader.load( new URLRequest( _apiUrl ) );
		}
		
		/**
		 * 获取某一基金的数据
		 *  
		 * @param id
		 * @return 
		 * 
		 */		
		public function getFundDataById(id:String):Object{	
			var result:Object = _data['result'][0];
			var resultArr:Array = [];						
			for( var key:String in result ){
				resultArr.push( result[key] );
			}
			
			var func:Function = function(item:Object, index:int, array:Array):Boolean{
				return ( item['code'] == id );					
			}
			
			var  filtered:Array = resultArr.filter( func );		
									
			return ( filtered.length > 0 ) ? filtered[0] : null;
		}
		
		
		/**
		 * 获取所有数据成功
		 *  
		 * @param e
		 * 
		 */		
		private function loadedHandler(e:Event):void{	
			var jsonString:String = ( e.target as URLLoader ).data as String;
			LogUtil.debug( this, null, jsonString );
			jsonString = '{"resultcode":"200","reason":"SUCCESSED!","result":[{"1":{"code":"110003","name":"易方达上证50","newnet":"0.6685","totalnet":"2.5185","dayincrease":"0.0020","daygrowrate":"0.3001","weekgrowrate":"5.9800","monthgrowrate":"12.1500","time":"2012年12月18日"}}]}';
			_data = JSON2.decode( jsonString );
			LogUtil.debug( this, null, jsonString );	
			
			this.dispatch( new GetFundDataServiceFeedbackEvent( _succFeedbackEventName, JSON2.decode( jsonString ) ) );
		}
		
		/**
		 * 获取数据出错事件处理
		 *  
		 * @param e
		 * 
		 */		
		private function EORHandler(e:IOErrorEvent):void{
			this.dispatch( new GetFundDataServiceFeedbackEvent( _failFeedbackEventName ) );
		}
	}
}