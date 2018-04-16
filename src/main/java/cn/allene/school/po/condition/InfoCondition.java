package cn.allene.school.po.condition;

import java.util.Date;
import java.util.List;

import cn.allene.school.contacts.Contacts;
import com.github.pagehelper.util.StringUtil;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InfoCondition extends BaseMongoCondition<String> {

	private String id;

	private List<String> idList;
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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date minAddTime;
	/**
	 *
	*/
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date maxAddTime;
	/**
	 *
	*/
	private Integer total;
	/**
	 * 
	*/
	private Integer cateId;
	/**
	 *
	 */
	private List<Integer> cateIdList;
	/**
	 *
	 */
	private Integer cateGroup;
	/**
	 *
	 */
	private Integer state = Contacts.State.Yes;

	public InfoCondition(Integer cateId) {
		this.cateId = cateId;
	}

	@Override
	protected void appendQuery(Query query) {
		if(getId() != null){
			query.addCriteria(Criteria.where("_id").is(this.getId()));
		}
		if(cateId != null){
			query.addCriteria(Criteria.where("cateId").is(this.cateId));
		}
		if(StringUtil.isNotEmpty(title)){
			query.addCriteria(Criteria.where("title").regex(title));
		}
		if(StringUtil.isNotEmpty(content)){
			query.addCriteria(Criteria.where("content").regex(content));
		}
		if(null != cateGroup){
			query.addCriteria(Criteria.where("cateGroup").is(cateGroup));
		}

		if(minAddTime != null || maxAddTime != null){
			Criteria addTimeCriteria = Criteria.where("addTime");
			if(minAddTime != null){
				addTimeCriteria.gte(minAddTime);
			}
			if(maxAddTime != null){
				addTimeCriteria.lte(maxAddTime);
			}
			query.addCriteria(addTimeCriteria);
		}

		if(!CollectionUtils.isEmpty(cateIdList)){
			query.addCriteria(Criteria.where("cateId").in(cateIdList));
		}
		if(state != null){
			query.addCriteria(Criteria.where("state").is(state));
		}
	}
}