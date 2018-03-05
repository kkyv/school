package cn.allene.school.po.condition;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChildCondition extends BaseCondition<String> {
	/**
	 * 
	*/
	private String password;
	/**
	 * 
	*/
	private String nickname;
	/**
	 * 最小
	*/
	private Date minAddTime;
	/**
	 * 最大
	*/
	private Date maxAddTime;
	/**
	 * 
	*/
	private String sex;
	/**
	 * 
	*/
	private Integer classId;

	public ChildCondition(Integer classId) {
		this.classId = classId;
	}
}