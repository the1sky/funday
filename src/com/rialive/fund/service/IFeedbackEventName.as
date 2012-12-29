package com.rialive.fund.service{
	
	/**
	 * 反馈事件名称的接口
	 *  
	 * @author dumingtan
	 * 
	 */	
	public interface IFeedbackEventName{
		function get succFeedbackEventName():String;
		function set succFeedbackEventName(value:String):void;
		
		function get failFeedbackEventName():String;
		function set failFeedbackEventName(value:String):void;
		
		function get otherFeedbackEventName():String;
		function set otherFeedbackEventName(value:String):void;
	}
}