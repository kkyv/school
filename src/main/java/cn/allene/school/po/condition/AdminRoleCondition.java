package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
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