package ${packageName}.service;
import ${packageName}.model.${className};
import java.util.List;
import java.util.Map;

public interface ${className}Service {

	void add(${className} record);

	void delete(${className} record);

	void delete(String id);

	void update(${className} record);

	${className} get(String id);

	List<${className}> getList(${className} record, Pager pager, Map filter);
}