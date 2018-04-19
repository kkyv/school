package cn.allene.school.po.condition;

import cn.allene.school.contacts.Contacts;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MsgCondition extends BaseCondition<Integer> {
	/**
	 *
	 */
	private String title;
	/**
	 * 
	*/
	private String content;
	/**
	 *
	 */
	private String phone;
	/**
	 * 
	*/
	private Integer status = Contacts.State.Yes;
	/**
	 * 
	*/
	private Integer name;
	/**
	 *
	 */
	private Integer type;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxTime;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minTime;

}