package ${packageName}.service.impl;
import ${packageName}.model.${className};
import ${packageName}.service.${className}Service;
import ${packageName}.dao.${className}Dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class ${className}ServiceImpl implements ${className}Service {

	@Autowired
	private ${className}Dao dao;

	@Override
	public void add(${className} record){
		dao.add(record);
	}

	@Override
	public void delete(${className} record){
		dao.delete(record);
	}

	@Override
	public void delete(String id){
		dao.delete(id);
	}

	@Override
	public void update(${className} record){
		dao.update(record);
	}

	@Override
	public ${className} get(String id){
		return dao.get(id);
	}

	@Override
	public List<${className}> getList(${className} record, Pager pager, Map filter){
		return dao.getList(record, pager, filter);
	}
}