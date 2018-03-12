package cn.allene.school.po.condition;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
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

	private List<Integer> cateIdList;

	public InfoCondition(Integer cateId) {
		this.cateId = cateId;
	}
}