package com.rialive.fund.controller{
	import com.rialive.fund.view.InputView;
	
	import org.robotlegs.mvcs.Command;
	
	public class InitViewCommand extends Command{		
		public override function execute():void{	
			
			var inputView:InputView = new InputView();			
			this.contextView.addChild( inputView );
		}
	}
}