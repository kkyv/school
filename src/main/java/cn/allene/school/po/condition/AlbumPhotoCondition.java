package cn.allene.school.po.condition;

import java.util.Date;
import java.util.List;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class AlbumPhotoCondition extends BaseCondition<Integer> {

	/**
	 * 
	*/
	private Integer albumId;
	/**
	 * 
	*/
	private String photoId;

	private String name;

	private List<Integer> albumIdList;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minAddTime;
	/**
	 *
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxAddTime;
}