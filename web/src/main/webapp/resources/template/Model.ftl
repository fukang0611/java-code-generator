package ${packageName}.model;

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
	@Column(name = "${field.name}")
	private ${field.type} ${field.name};

</#list>
	@Column(name = "createUserId")
    private String createUserId;

    @Column(name = "createTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    @Column(name = "remove")
    private String remove;

	public ${className}() {}

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

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

 	public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public String getRemove() {
        return remove;
    }

    public void setRemove(String remove) {
        this.remove = remove;
    }
}