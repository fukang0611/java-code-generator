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

    /**
     * 代码生成
     *
     * @param className   类名
     * @param tableName   表名
     * @param fieldType   字段类型数组
     * @param fieldName   字段名称数组
     * @param packageName 代码根目录包名
     * @param session     用于获取模板路径
     * @return 代码生成结果
     */
    @RequestMapping("/generate")
    @ResponseBody
    public Object generate(String className, String tableName, String[] fieldType, String[] fieldName,
                           String packageName, HttpSession session) {

        // 封装模板数据
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
        String templateDir = session.getServletContext().getRealPath("/resources/template");
        // 模板生成后存放目录
        String targetRootPath = "D:/CodeGenerator/" + packageName + "/";
        // 分别生成对应的代码文件
        try {
            String templateFileName = "Model.ftl";
            String targetPath = targetRootPath + "model/";
            String fileName = className + ".java";
            process(data, templateDir, templateFileName, targetPath, fileName);

            templateFileName = "Service.ftl";
            targetPath = targetRootPath + "service/";
            fileName = className + "Service.java";
            process(data, templateDir, templateFileName, targetPath, fileName);

            templateFileName = "ServiceImpl.ftl";
            targetPath = targetRootPath + "service/impl/";
            fileName = className + "ServiceImpl.java";
            process(data, templateDir, templateFileName, targetPath, fileName);

            templateFileName = "Dao.ftl";
            targetPath = targetRootPath + "dao/";
            fileName = className + "Dao.java";
            process(data, templateDir, templateFileName, targetPath, fileName);

            templateFileName = "DaoImpl.ftl";
            targetPath = targetRootPath + "dao/impl/";
            fileName = className + "DaoImpl.java";
            process(data, templateDir, templateFileName, targetPath, fileName);

            templateFileName = "Controller.ftl";
            targetPath = targetRootPath + "controller/";
            fileName = className + "Controller.java";
            process(data, templateDir, templateFileName, targetPath, fileName);

        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("生成代码文件时产生异常！");
        }
        return "success";
    }

    /**
     * 读取模板文件、写入数据并生成代码文件
     *
     * @param data              封装数据
     * @param templateDirectory 模板路径
     * @param templateFileName  模板文件名
     * @param targetPath        生成文件路径
     * @param fileName          生成文件名
     * @throws IOException IO异常
     */
    private void process(Map data, String templateDirectory, String templateFileName, String targetPath,
                         String fileName) throws IOException {

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
            Template template = getConfiguration(templateDirectory).getTemplate(templateFileName, "UTF-8");
            template.process(data, writer);
        } catch (TemplateException | IOException e) {
            throw new RuntimeException(e);
        } finally {
            assert writer != null;
            writer.close();
        }
    }
}