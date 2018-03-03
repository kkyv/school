package cn.allene.school.po.condition;

import lombok.Data;

@Data
public class RoleAccessCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private Integer accessId;
	/**
	 * 
	*/
	private Integer roleId;
}