package {
	import com.rialive.fund.context.ApplicationContext;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * 入口程序
	 * 
	 * 基金定投日预测工具
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class funday extends Sprite{
		private var _ac:ApplicationContext;		
		
		public function funday(){
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
									
			if( stage ){
				init();
			}else{
				addEventListener( Event.ADDED_TO_STAGE, init );
			}
		}
		
		/**
		 * 初始化
		 *  
		 * @param e
		 * 
		 */		
		private function init(e:Event=null):void{
			_ac = new ApplicationContext( this, false );
			_ac.startup();			
		}
	}
}