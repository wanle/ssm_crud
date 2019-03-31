package com.hytx.crud.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	//返回的状态码
	private int code;
	//返回的信息
	private String message;
	//
	private Map<String,Object> entend=new HashMap<String,Object>();
	
	public static Msg sueess(){
		Msg result=new Msg();
			result.setCode(200);
			result.setMessage("处理成功");
		return result;
	}
	
	public static Msg fail(){
		Msg result=new Msg();
			result.setCode(400);
			result.setMessage("处理失败");
		return result;
	}
	
	public int getCode() {
		return code;
	}
	
	public Msg add(String key,Object val){
		this.getEntend().put(key, val);
		return this;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, Object> getEntend() {
		return entend;
	}
	public void setEntend(Map<String, Object> entend) {
		this.entend = entend;
	}
	
}
