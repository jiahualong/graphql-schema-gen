package cc.stan.example.graphqlschemagen.template;

import cc.stan.example.graphqlschemagen.mod.Clz;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
public class FreemarkerGen {

    private final Configuration config;

    public FreemarkerGen() {
        config = new Configuration(Configuration.VERSION_2_3_28);
        config.setClassForTemplateLoading(FreemarkerGen.class, "/templates");
    }


    /** 生成器 */
    public String gen(Clz clz, String program, String author, String create, String tempFileName) throws IOException, TemplateException {
        Map<String, Object> properties = new HashMap() {
            {
                put("clz", clz);
                put("proList", clz.getPropList());
                put("program", program);
                put("author", author);
                put("create", create);
            }
        };
        log.info("| Gen | model ");
        Template template = config.getTemplate(tempFileName, "UTF-8");
        return FreeMarkerTemplateUtils.processTemplateIntoString(template, properties);
    }

    /** 生成Model.ftl */
    public String genModelFtl(Clz clz, String program, String author, String create) throws IOException, TemplateException {
        return gen(clz, program, author, create, "Model.ftl");
    }

    /** 生成 ctl.ftl */
    public String genCtlFtl(Clz clz, String program, String author, String create) throws IOException, TemplateException {
        return gen(clz, program, author, create, "Ctl.ftl");
    }

    /** 生成 DAO.ftl */
    public String genDAOFtl(Clz clz, String program, String author, String create) throws IOException, TemplateException {
        return gen(clz, program, author, create, "DAO.ftl");
    }

    /** 生成 DTO.ftl */
    public String genDTOFtl(Clz clz, String program, String author, String create) throws IOException, TemplateException {
        return gen(clz, program, author, create, "DTO.ftl");
    }
}
