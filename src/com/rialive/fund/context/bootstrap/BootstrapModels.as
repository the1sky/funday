package com.rialive.fund.context.bootstrap{
	
	import org.robotlegs.core.IInjector;
	import com.rialive.fund.model.FundModel;
	import com.rialive.fund.service.GetFundDataService;
	
	/**
	 * Model的注入规则
	 *  
	 * @author dmt
	 * 
	 */	
	public class BootstrapModels{
		public function BootstrapModels(injector:IInjector){
			injector.mapSingleton( FundModel );			
		}
	}
}