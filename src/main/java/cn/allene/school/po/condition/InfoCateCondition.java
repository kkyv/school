package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InfoCateCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private String name;
	/**
	 * 
	*/
	private Integer firstId;
}