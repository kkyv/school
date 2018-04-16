package cn.allene.school.po;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class AlbumPhotoPo {

	/**
	 * 
	*/
	private Integer id;
	/**
	 * 
	*/
	private Integer albumId;

	private String name;
	/**
	 * 
	*/
	private String photoId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addTime;
}