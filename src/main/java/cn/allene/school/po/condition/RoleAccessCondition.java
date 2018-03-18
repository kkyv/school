package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.List;

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

	private List<Integer> accessIdList;

	private List<Integer> roleIdList;
}