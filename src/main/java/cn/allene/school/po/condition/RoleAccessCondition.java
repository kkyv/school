package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
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