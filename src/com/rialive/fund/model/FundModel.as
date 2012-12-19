package com.rialive.fund.model{
	import baidu.lib.serialization.JSON2;
	
	import flash.utils.Dictionary;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * 基金数据模型
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class FundModel extends Actor{
		private var _allCloseData:Object;
		private var _fundID:String;		
		private var _data:Object;
		
		public function FundModel():void{
			init();
		}
		
		/**
		 * 添加某一基金的数据
		 * 
		 * 数据结构：
		 * {[{},{}...],[{},{},{}...],[{},{},{}...]}
		 *  
		 * @param id
		 * @param data
		 * 
		 */		
		public function addFundData(id:String, data:Object):void{
			if( !_data[id] ) _data[id] = [];
			
			var name:String = data['name'];
			var time:String = data['time'];
			var tmp:Object = {};
			tmp[time] = data;
			tmp['name'] = name;
			( _data[id] as Array ).push( tmp );
		}
		
		/**
		 * 获取某一基金的名称
		 *  
		 * @param id
		 * @return 
		 * 
		 */		
		public function getFundNameById(id:String):String{			
			return ( _data[id] ) ? _data[id][0]['name'] : '';
		}
		
		/**
		 * 获取某一基金的指定时间的数据
		 * 
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundTimeDataById(id:String, time:String):Object{
			if( _data[id] ){
				var allData:Array = _data[id];
				var result:Array = allData.filter( function(item:Object, index:int, arr:Array):Boolean{
					return ( item[time] != undefined );
				});
				
				return result[time];
			}
			return null;
		}
		
		/**
		 * 获取某一基金的最新净值
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundNewNet(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['newnet'];
		}
		
		/**
		 * 获取某一基金的累计净值
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundTotalNet(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['totalnet'];
		}
		
		/**
		 * 获取某一基金的日增长值
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundDayIncrease(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['dayincrease'];
		}
		
		/**
		 * 获取某一基金的日增长率
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundDayGrowRate(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['daygrowrate'];
		}
		
		/**
		 * 获取某一基金的周增长率
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundWeekGrowRate(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['weekgrowrate'];
		}
		
		/**
		 * 获取某一基金的月增长率
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundMonthGrowRate(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['monthgrowrate'];
		}
		
		/**
		 * 获取某一基金的本年收益
		 *  
		 * @param id
		 * @param time
		 * @return 
		 * 
		 */		
		public function getFundAnnualIncome(id:String, time:String):String{
			var timeData:Object = getFundTimeDataById( id, time );
			return timeData['annualincome'];
		}
		
		/**
		 * 获取/设置所有封闭基金数据
		 *  
		 * @return 
		 * 
		 */		
		public function get allCloseData():Object{
			return _allCloseData;
		}
		public function set allCloseData(value:Object):void{
			_allCloseData = value;
		}
		
		/**
		 * 初始化
		 *  		 
		 * 
		 */		
		private function init():void{
			_data = {};					
			_allCloseData = {};
		}
	}
}