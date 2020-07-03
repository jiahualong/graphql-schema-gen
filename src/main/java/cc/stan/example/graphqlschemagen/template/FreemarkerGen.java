package cc.stan.example.graphqlschemagen.template;

import cc.stan.example.graphqlschemagen.mod.Clz;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

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
    public String gen(Clz clz, String program, String author, String create, String tempFileName) {
        Map<String, Object> properties = new HashMap() {
            {
                put("clz", clz);
                put("proList", clz.getPropList());
                put("proVOList", clz.getPropVOList());
                put("propInputList", clz.getPropInputList());
                put("program", program);
                put("author", author);
                put("create", create);
            }
        };
        try {
            Template template = config.getTemplate(tempFileName, "UTF-8");
            return FreeMarkerTemplateUtils.processTemplateIntoString(template, properties);
        } catch (Exception e) {
            log.warn("gen file error,{} ", e.getMessage());
            return e.getMessage();
        }
    }


    public String genIctlFtl(Clz clz, String program, String author, String create) {
        return gen(clz, program, author, create, "Ictl.ftl");
    }
}
