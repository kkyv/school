package cn.allene.school.po.condition;

import java.util.Date;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClassCondition extends BaseCondition<Integer> {

	private String name;

	private Integer adminId;

	private String notice;

	private String browse;

	private String news;

	private String pic;

	private Integer state;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minAddTime;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxAddTime;
}