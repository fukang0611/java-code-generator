import org.springframework.stereotype.Repository;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import javax.annotation.Resource;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@Repository
public class ${className}DaoImpl implements ${className}Dao {

	@Resource(name = "sessionFactory")
    SessionFactory factory;

    @Override
	public void add(${className} record){
		factory.getCurrentSession().save(record);
	}

    @Override
	public void delete(${className} record){
		factory.getCurrentSession().delete(record);
	}

    @Override
	public void delete(String id){
		factory.getCurrentSession().delete(get(id));
	}

    @Override
	public void update(${className} record){
		factory.getCurrentSession().update(record);
	}

    @Override
	public ${className} get(String id){
		return factory.getCurrentSession().get(${className}.class, id);
	}

    @Override
	public List<${className}> getList(${className} record, Pager pager, Map filter){

		Map bean = new HashMap();

        String hql = "from ${className} where remove = 0 ";

        if (record != null) {
            // TODO 此处根据实际情况编写查询过滤条件
        }
        if (filter != null) {
            // 排序
            if (filter.get("sort") != null && !"".equals(filter.get("sort"))) {
                hql += "order by " + filter.get("sort") + " ";
                if (filter.get("direction") != null && !"".equals(filter.get("direction"))) {
                    hql += filter.get("direction");
                }
            }
        }
        Query query = factory.getCurrentSession().createQuery(hql).setProperties(bean);
        if (pager != null) {
            query.setFirstResult(pager.getPageSize() * (pager.getPageNo() - 1)).setMaxResults(pager.getPageSize());
            Query query2 = factory.getCurrentSession().createQuery("select count(*) " + hql).setProperties(bean);
            int num = ((Number) query2.uniqueResult()).intValue();
            pager.setTotalCount(num);
        }
        return query.list();
	}
}