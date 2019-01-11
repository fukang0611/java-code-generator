package com.fk.core.controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/core")
public class CoreController {

    private static Configuration getConfiguration(String templateDirectory) {

        Configuration configuration = new Configuration(Configuration.VERSION_2_3_22);
        try {
            configuration.setTagSyntax(Configuration.AUTO_DETECT_TAG_SYNTAX);
            configuration.setDirectoryForTemplateLoading(new File(templateDirectory));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return configuration;
    }

    @RequestMapping("/add")
    @ResponseBody
    public Object add(String className, String tableName, String[] fieldType, String[] fieldName, HttpSession session) throws IOException {

        Map data = new HashMap();
        data.put("className", className);
        data.put("tableName", tableName);

        List<Map> fieldList = new ArrayList<>();
        for (int i = 0; i < fieldType.length; i++) {
            Map field = new HashMap();
            field.put("type", fieldType[i]);
            field.put("name", fieldName[i]);
            fieldList.add(field);
        }
        data.put("fieldList", fieldList);

        // 模板目录
        String templateDirectory = session.getServletContext().getRealPath("/resources/template");
        // 模板名称
        String templateFile = "Model.ftl";
        // 模板生成后存放目录
        String targetPath = "D:/CodeGenerator/";
        // 模板生成后新文件名
        String fileName = className + ".java";
        // 创建文件夹
        new File(targetPath).mkdirs();
        File newFile = new File(targetPath + "/" + fileName);
        if (newFile.exists()) {
            newFile.delete();
        }
        // 生成目标文件
        Writer writer = null;
        try {
            writer = new FileWriter(newFile);
            Template template = getConfiguration(templateDirectory).getTemplate(templateFile, "UTF-8");
            template.process(data, writer);
        } catch (TemplateException | IOException e) {
            throw new RuntimeException(e);
        } finally {
            assert writer != null;
            writer.close();
        }
        return "success";
    }
}