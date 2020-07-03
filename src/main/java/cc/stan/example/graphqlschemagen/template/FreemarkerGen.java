package cc.stan.example.graphqlschemagen.template;

import cc.stan.example.graphqlschemagen.mod.Clz;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class FreemarkerGen {
    private static Configuration config;

    static {
        config = new Configuration(Configuration.VERSION_2_3_28);
        config.setClassForTemplateLoading(FreemarkerGen.class, "/templates");
    }

    public static String gen(Clz clz) throws IOException, TemplateException {
        Map<String, Object> properties = new HashMap() {
            {
                put("clz", clz);
                put("proList", clz.getPropList());
            }
        };
        log.info("| Gen | model ");
        Template template = config.getTemplate("model.ftl", "UTF-8");
        String result = FreeMarkerTemplateUtils.processTemplateIntoString(template, properties);
        return result;
    }
}
