package cn.allene.school.po.condition;

import lombok.Data;

@Data
public class AdminCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private String password;
	/**
	 * 
	*/
	private String nickname;
}