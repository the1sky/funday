package com.rialive.fund.context.bootstrap{
	import com.rialive.fund.service.GetFundDataService;
	
	import org.robotlegs.core.IInjector;
	
	/**
	 * service注入规则
	 *  
	 * @author dmt
	 * 
	 */	
	public class BootstrapServices{
		public function BootstrapServices(injector:IInjector){	
			injector.mapSingleton( GetFundDataService );
		}
	}
}