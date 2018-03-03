package cn.allene.school.po.condition;

import java.util.Date;
import lombok.Data;

@Data
public class ClassCondition extends BaseCondition<Integer> {
	/**
	 * 
	*/
	private String name;
	/**
	 * 最小
	*/
	private Date minAddTime;
	/**
	 * 最大
	*/
	private Date maxAddTime;
}