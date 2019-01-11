
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "${tableName}")
public class ${className} {

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Column(name="id",length=36)
	private String id;

<#list fieldList as field>

	@Column(name="${field.name}")
	private ${field.type} ${field.name};

</#list>

	public ${className} {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

<#list fieldList as field>

	public ${field.type} get${field.name?cap_first}() {
		return ${field.name};
	}

	public void set${field.name?cap_first}(${field.type} ${field.name}) {
		this.${field.name} = ${field.name};
	}

</#list>

}