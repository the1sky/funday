package com.rialive.fund.controller{
	import com.rialive.fund.view.events.StartupEvent;
	
	import org.robotlegs.mvcs.Command;

	/**
	 * 启动命令
	 *  
	 * @author dmt
	 * @version 1.0
	 * @created 02-3-2012 15:33:29
	 */
	public class StartupCommand extends Command{		
		public override function execute():void{	
			this.dispatch( new StartupEvent( StartupEvent.INIT_VIEW ) );
			this.dispatch( new StartupEvent( StartupEvent.GET_FUND_DATA ) );
		}		
	}
}