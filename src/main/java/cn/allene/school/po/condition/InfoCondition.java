package cn.allene.school.po.condition;

import java.util.Date;
import java.util.List;

import com.github.pagehelper.util.StringUtil;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class InfoCondition extends BaseMongoCondition<String> {

	/**
	 * 
	*/
	private String title;
	/**
	 * 
	*/
	private String content;
	/**
	 * 最小
	*/
	private Date minAddTime;
	/**
	 * 最大
	*/
	private Date maxAddTime;
	/**
	 * 浏览次数
	*/
	private Integer total;
	/**
	 * 
	*/
	private Integer cateId;

	private List<Integer> cateIdList;

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
			query.addCriteria(Criteria.where("title").regex(content));
		}
		if(minAddTime != null){
			query.addCriteria(Criteria.where("addTime").gte(minAddTime));
		}
		if(maxAddTime != null){
			query.addCriteria(Criteria.where("addTime").lte(maxAddTime));
		}
		if(!CollectionUtils.isEmpty(cateIdList)){
			Criteria criteria = new Criteria();
			for(Integer cate : cateIdList){
				criteria.orOperator(Criteria.where("cateId").is(cate));
			}
			query.addCriteria(criteria);
		}
	}
}