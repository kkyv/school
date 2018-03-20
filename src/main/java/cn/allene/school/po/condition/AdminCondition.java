package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.util.Date;
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
	private String phone;

	private String nickname;

	private String roleId;

	private List<Integer> roleIdList;

	private Integer state;

	private Date minAddTime;

	private Date maxAddTime;
}