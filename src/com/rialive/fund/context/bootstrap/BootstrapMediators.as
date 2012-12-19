package com.rialive.fund.context.bootstrap{
	import com.rialive.fund.view.InputMediator;
	import com.rialive.fund.view.InputView;
	
	import org.robotlegs.core.IMediatorMap;
	
	/**	 
	 * view<---->mediator映射规则
	 *  
	 * @author dmt
	 * 
	 */	
	public class BootstrapMediators{
		public function BootstrapMediators(mediatorMap:IMediatorMap){	
			mediatorMap.mapView( InputView, InputMediator );
		}
	}
}