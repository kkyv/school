package cn.allene.school.po.condition;

import java.util.List;
import java.util.Date;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class AlbumCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private String name;
	/**
	 * 
	*/
	private Integer classId;

	private String cateName;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minAddTime;
	/**
	 *
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxAddTime;


}