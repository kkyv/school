package cn.allene.school.po;

import java.util.Date;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
public class AlbumPo {

	/**
	 * 
	*/
	private Integer id;
	/**
	 * 
	*/
	private String name;

	private String cateName;
	/**
	 * 封面
	*/
	private String photo;
	/**
	 * 
	*/
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date addTime;
}