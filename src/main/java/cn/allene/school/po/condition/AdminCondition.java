package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

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
	private Integer sex;

	private String email;

	private String phone;

	private String nickname;

	private String roleId;

	private List<Integer> roleIdList;

	private Integer state;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minAddTime;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxAddTime;
}