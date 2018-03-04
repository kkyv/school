package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

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
}