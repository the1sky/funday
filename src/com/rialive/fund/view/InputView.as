package com.rialive.fund.view{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	/**
	 * 输入界面
	 *  
	 * @author dumingtan
	 * 
	 */	
	public class InputView extends Sprite{
		private var _confirm:Sprite;
		private var _input:TextField;
		private var _output:TextField;
		
		public function InputView(){
			if( stage ){
				init();
			}else{
				this.addEventListener( Event.ADDED_TO_STAGE, init );
			}
		}
		
		public function get confirm():Sprite{
			return _confirm;
		}
		
		public  function get inputData():String{
			return _input.text;
		}
		
		public function set outData(value:String):void{
			_output.text = value;
		}
		
		/**
		 * 初始化
		 *  
		 * @param e
		 * 
		 */		
		private function init(e:Event=null):void{
			_confirm = new Sprite();
			_confirm.graphics.clear();
			_confirm.graphics.beginFill( 0xffff00 );
			_confirm.graphics.drawRect( 0, 0, 80, 30 );
			_confirm.graphics.endFill();
			//_confirm.addEventListener( MouseEvent.CLICK, clickHandler );
			addChild( _confirm );
			
			_input = new TextField();
			_input.type = TextFieldType.INPUT;
			_input.text = '110003';
			_input.border = true;
			_input.autoSize = TextFieldAutoSize.LEFT;
			_input.y = 30;
			addChild( _input );						
			
			_output = new TextField();
			_output.border = true;
			_output.y = _input.y + _input.height;
			addChild( _output );			
		}
		
		private function clickHandler(e:MouseEvent):void{
			this.dispatchEvent( e );
		}
	}
}