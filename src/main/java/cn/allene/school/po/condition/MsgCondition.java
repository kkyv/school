package cn.allene.school.po.condition;

import lombok.Data;

@Data
public class MsgCondition extends BaseCondition<Integer> {
	/**
	 * 
	*/
	private String content;
	/**
	 * 
	*/
	private String status;
	/**
	 * 
	*/
	private Integer childId;
}