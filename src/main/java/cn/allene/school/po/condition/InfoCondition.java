package cn.allene.school.po.condition;

import java.util.Date;
import lombok.Data;

@Data
public class InfoCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private String title;
	/**
	 * 
	*/
	private String content;
	/**
	 * 最小
	*/
	private Date minAddTime;
	/**
	 * 最大
	*/
	private Date maxAddTime;
	/**
	 * 浏览次数
	*/
	private Integer total;
	/**
	 * 
	*/
	private Integer cateId;
}