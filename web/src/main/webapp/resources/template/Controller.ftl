import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/${className?uncap_first}")
public class ${className}Controller extends BaseController{

@Autowired
private ${className}Service ${className?uncap_first}Svc;

@RequestMapping("/data")
@ResponseBody
public Map data(${className} record, HttpServletRequest request){

        Pager pager = getPager(request);
        Map filter = packFilter("createTime", "desc", request);

        List<${className}> list = ${className?uncap_first}Svc.getList(record, pager, filter);

        List<Map> dataList = new ArrayList<>();
        Map data;
        for(${className} ${className?uncap_first} : list){
        data = beanToMap(${className?uncap_first});
        // TODO
        dataList.add(data);
        }
        return getData(pager,filter,dataList);
}

    @RequestMapping("/addSucc")
    @ResponseBody
    public Map addSucc(${className} record, HttpServletRequest request){
        try{
            User user = (User)request.getSession().getAttribute("user");
            record.setCreateUserId(user == null ? "" : user.getId());
            ${className?uncap_first}Svc.add(record);
        }catch(Exception e){
            e.printStackTrace();
            return packResultAndMsg("failure", "添加操作失败");
        }
        return packResultAndMsg("success", "添加操作成功");
    }

    @RequestMapping("/toEdit")
    public String toEdit(String id, Model model){

        ${className} record = ${className?uncap_first}Svc.get(id);
        model.addAttribute("${className?uncap_first}", record);
        return "";
    }



    @RequestMapping("/deleteSucc")
    @ResponseBody
    public Map deleteSucc(String id){
        try{
            ${className?uncap_first}Svc.del(id);
        }catch(Exception e){
            e.printStackTrace();
            return packResultAndMsg("failure","删除操作失败");
        }
        return packResultAndMsg("success","删除操作成功");
    }

    @RequestMapping("/viewDetail")
    public String viewDetail(String id,Model model){

        ${className} record = ${className?uncap_first}Svc.getById(id);
        model.addAttribute("${className?uncap_first}", record);
        return "";
    }
}
