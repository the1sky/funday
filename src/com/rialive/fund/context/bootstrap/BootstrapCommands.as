package com.rialive.fund.context.bootstrap{
	import com.rialive.fund.controller.GetFundDataCommand;
	import com.rialive.fund.controller.InitViewCommand;
	import com.rialive.fund.controller.QueryFundDataCommand;
	import com.rialive.fund.controller.StartupCommand;
	import com.rialive.fund.view.events.FundEvent;
	import com.rialive.fund.view.events.StartupEvent;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.ICommandMap;
	
	/**
	 * 事件<---->Command映射
	 *  
	 * @author dmt
	 * 
	 */	
	public class BootstrapCommands{		
		public function BootstrapCommands(commandMap:ICommandMap){							
			commandMap.mapEvent( ContextEvent.STARTUP, StartupCommand );
			commandMap.mapEvent( StartupEvent.INIT_VIEW, InitViewCommand );
			commandMap.mapEvent( StartupEvent.GET_FUND_DATA, GetFundDataCommand );			
			commandMap.mapEvent( FundEvent.QUERY_FUND, QueryFundDataCommand );
		}
	}
}