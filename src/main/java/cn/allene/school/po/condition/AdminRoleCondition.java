package cn.allene.school.po.condition;

import lombok.Data;

@Data
public class AdminRoleCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private Integer adminId;
	/**
	 * 
	*/
	private Integer roleId;
}