package cn.allene.school.po.condition;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

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
	private String status;
	/**
	 * 
	*/
	private Integer childId;
}