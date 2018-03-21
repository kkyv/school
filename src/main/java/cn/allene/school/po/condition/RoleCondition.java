package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RoleCondition extends BaseCondition<Integer> {
	/**
	 * 
	*/
	private String name;

	private String desc;

	private Date addTime;

	private String access;
}