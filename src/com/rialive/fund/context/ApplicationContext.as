package com.rialive.fund.context{
	
	import com.rialive.fund.context.bootstrap.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.*;
	import org.robotlegs.core.IContext;
	import org.robotlegs.mvcs.Context;
	
	/**	 
	 *  
	 * @author dmt
	 * 
	 */	
	public class ApplicationContext extends Context implements IContext{
		public function ApplicationContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true){
			super(contextView, autoStartup);
		}
		
		/**
		 * 启动 
		 * 
		 */		
		public override function startup():void{				
			super.startup();
						
			new BootstrapModels( injector );
			new BootstrapServices( injector );
			new BootstrapCommands( commandMap );
			new BootstrapMediators( mediatorMap );																					
			
			//开始
			this.dispatchEvent( new ContextEvent( ContextEvent.STARTUP ) );						
		}					
	}
}