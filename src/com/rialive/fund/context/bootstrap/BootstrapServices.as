package com.rialive.fund.context.bootstrap{
	import com.rialive.fund.service.*;
	
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
			injector.mapSingleton( GetStockFundDataService );
			injector.mapSingleton( GetCloseFundDataService );
			injector.mapSingleton( GetBondFundDataService );
			injector.mapSingleton( GetETFFundDataService );
			injector.mapSingleton( GetInnovFundDataService );
			injector.mapSingleton( GetLOFFundDataService );
			injector.mapSingleton( GetMonetFundDataService );
			injector.mapSingleton( GetQDIIFundDataService );
			injector.mapSingleton( GetAllFundDataService );
		}
	}
}