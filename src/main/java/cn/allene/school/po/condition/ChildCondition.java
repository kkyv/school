package cn.allene.school.po.condition;

import java.util.Date;
import java.util.List;

import cn.allene.school.contacts.Contacts;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minAddTime;
	/**
	 * 最大
	*/
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxAddTime;
	/**
	 * 
	*/
	private String sex;
	/**
	 *
	 */
	private String addr;
	/**
	 * 
	*/
	private Integer classId;
	/**
	 *
	 */
	private Integer state = Contacts.State.Yes;
	/**
	 *
	 */
	private String photo;
	public ChildCondition(Integer classId) {
		this.classId = classId;
	}
}