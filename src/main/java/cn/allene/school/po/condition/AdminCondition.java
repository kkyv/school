package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
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

	private String roleId;

	private List<Integer> roleIdList;
}