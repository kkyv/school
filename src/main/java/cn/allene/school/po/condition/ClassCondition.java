package cn.allene.school.po.condition;

import java.util.Date;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClassCondition extends BaseCondition<Integer> {
	/**
	 * 
	*/
	private String name;
	/**
	 * 最小
	*/

	private Integer adminId;

	private String notice;

	private String browse;

	private String news;

	private String pic;

	private Date minAddTime;
	/**
	 * 最大
	*/
	private Date maxAddTime;
}