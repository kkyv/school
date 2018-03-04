package cn.allene.school.po.condition;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccessCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private String name;
}