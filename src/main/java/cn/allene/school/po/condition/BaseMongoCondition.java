package cn.allene.school.po.condition;

import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Query;

/**
 * create by KKYV on 2018-03-29
 */
public abstract class BaseMongoCondition<K> extends BaseCondition<K> {

    private Query query;

    protected abstract void appendQuery(Query query);

    public final Query toQuery() {
        query = new Query();
        appendQuery(query);
        query.limit(this.getPageSize());
        return query;
    }
}
