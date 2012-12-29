package com.rialive.fund.service{
	import com.rialive.fund.service.events.GetFundDataServiceFeedbackEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	
	
	/**
	 * 获取所有基金数据的服务
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class GetAllFundDataService extends Actor{	
		[Inject]
		public var getStockFundService:GetStockFundDataService;
		[Inject]
		public var getCloseFundService:GetCloseFundDataService;
		[Inject]
		public var getBondFundService:GetBondFundDataService;
		[Inject]
		public var getETFFundService:GetETFFundDataService;
		[Inject]
		public var getInnovFundService:GetInnovFundDataService;
		[Inject]
		public var getLOFFundService:GetLOFFundDataService;
		[Inject]
		public var getMonetFundService:GetMonetFundDataService;
		[Inject]
		public var getQDIIFundService:GetQDIIFundDataService;	
		
		private var _count:int;
		private var _total:int = 8;
		private var _result:Object = {};				
		
		/**
		 * 开始 
		 * 
		 */		
		public function start():void{
			_count = 0;
			
			removeListeners();
			addEventListeners();
			
			getStockFundService.start();
			getCloseFundService.start();
			getBondFundService.start();
			getETFFundService.start();
			getInnovFundService.start();
			getLOFFundService.start();
			getMonetFundService.start();
			getQDIIFundService.start();
		}
		
		/**
		 * 添加监听器 
		 * 
		 */		
		private function addEventListeners():void{
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_STOCK_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_STOCK_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_BOND_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_BOND_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_ETF_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_ETF_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_INNOV_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_INNOV_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_LOF_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_LOF_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_MONET_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_MONET_FAIL, getDoneHandler );
			
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_QDII_SUCC, getDoneHandler );
			this.eventDispatcher.addEventListener( GetFundDataServiceFeedbackEvent.GET_QDII_FAIL, getDoneHandler );
		}
		
		/**
		 * 移除监听器 
		 * 
		 */		
		private function removeListeners():void{
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_STOCK_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_STOCK_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_CLOSE_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_BOND_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_BOND_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_ETF_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_ETF_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_INNOV_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_INNOV_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_LOF_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_LOF_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_MONET_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_MONET_FAIL, getDoneHandler );
			
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_QDII_SUCC, getDoneHandler );
			this.eventDispatcher.removeEventListener( GetFundDataServiceFeedbackEvent.GET_QDII_FAIL, getDoneHandler );
		}
		
		/**
		 * 加载完成处理，
		 * 包括每次成功的或者失败的 
		 * 
		 */		
		private function getDoneHandler(e:GetFundDataServiceFeedbackEvent):void{
			_count++;
			
			switch( e.type ){
				case GetFundDataServiceFeedbackEvent.GET_STOCK_SUCC:					
					_result['stock'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_STOCK_FAIL:
					_result['stock'] = null;
					break;
				case GetFundDataServiceFeedbackEvent.GET_CLOSE_SUCC:
					_result['close'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_CLOSE_FAIL:
					_result['close'] = null;
					break;
				case GetFundDataServiceFeedbackEvent.GET_BOND_SUCC:
					_result['bond'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_BOND_FAIL:
					_result['bond'] = null;
					break;
				case GetFundDataServiceFeedbackEvent.GET_ETF_SUCC:
					_result['etf'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_ETF_FAIL:
					_result['etf'] = null;
					break;
				case GetFundDataServiceFeedbackEvent.GET_INNOV_SUCC:
					_result['innov'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_INNOV_FAIL:
					_result['innov'] = null;
					break;
				case GetFundDataServiceFeedbackEvent.GET_LOF_SUCC:
					_result['lof'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_LOF_FAIL:
					_result['lof'] = null;
					break;
				case GetFundDataServiceFeedbackEvent.GET_QDII_SUCC:
					_result['qdii'] = e.data;
					break;
				case GetFundDataServiceFeedbackEvent.GET_QDII_FAIL:
					_result['qdii'] = null;
					break;
			}
			
			if( _count == _total ){
				
				removeListeners();				
				
				this.dispatch( new GetFundDataServiceFeedbackEvent( GetFundDataServiceFeedbackEvent.GET_ALL_SUCC, _result ) );
			}
		}										
	}		
}