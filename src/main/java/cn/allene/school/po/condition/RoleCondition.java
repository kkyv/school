package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

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

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addTime;

	private String access;
}