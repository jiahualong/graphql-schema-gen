package cc.stan.example.graphqlschemagen;

import cc.stan.example.graphqlschemagen.mod.Clz;
import cc.stan.example.graphqlschemagen.mod.FtlAndJava;
import cc.stan.example.graphqlschemagen.template.FreemarkerGen;
import cc.stan.example.graphqlschemagen.template.WriteUtil;
import freemarker.template.TemplateException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

import static cc.stan.example.graphqlschemagen.mod.ClzUtil.fromSql;

@SpringBootTest
public class Test1 {

    @Autowired
    private FreemarkerGen gen;

    @Test
    public void t1() throws IOException, TemplateException {

        String program = "DRD2-SERVICE";
        String author = "jhl";
        String create = LocalDate.now().format(DateTimeFormatter.ISO_DATE);

        List<String> sql = Arrays.asList(
                "select_item    ,全局下拉框选项",
                "id             ,bigint             ,id ",
                "tenant_id      ,bigint             ,租户id",
                "type           ,varchar(200)       ,下拉框条目类型",
                "name           ,varchar(200)       ,选项名",
                "`desc`         ,varchar(200)       ,选项描述",
                "creator        ,bigint             ,创建人",
                "modifier       ,bigint             ,修改人",
                "create_tm      ,datetime           ,创建时间",
                "modify_tm      ,datetime           ,修改时间",
                "is_del         ,tinyint default 0  ,逻辑删除"
        );
        Clz clz = fromSql(sql);

        List<FtlAndJava> ftlAndJavaList = Arrays.asList(
                new FtlAndJava("Model.ftl", "%s.java"),
                new FtlAndJava("Ctl.ftl", "%sCtl.java"),
                new FtlAndJava("DAO.ftl", "%sDAO.java"),
                new FtlAndJava("DTO.ftl", "%sDTO.java"),
                new FtlAndJava("FindListOutput.ftl", "Find%sListOutput.java"),
                new FtlAndJava("FindListInput.ftl", "Find%sListInput.java"),
                new FtlAndJava("Ictl.ftl", "I%sCtl.java"),
                new FtlAndJava("Input.ftl", "%sInput.java"),
                new FtlAndJava("IService.ftl", "I%sService.java"),
                new FtlAndJava("Mapper.ftl", "%sMapper.java"),
                new FtlAndJava("MapStruct.ftl", "%sMapStruct.java"),
                new FtlAndJava("PropertyResolver.ftl", "%sPropertyResolver.java"),
                new FtlAndJava("Resolver.ftl", "%sResolver.java"),
                new FtlAndJava("Service.ftl", "%sService.java"),
                new FtlAndJava("VO.ftl", "%sVO.java"),
                new FtlAndJava("VOMapStruct.ftl", "%sVOMapStruct.java"),
                new FtlAndJava("graphqls.ftl", "%s.graphqls")
        );

        ftlAndJavaList.stream().forEach(fj -> {
            System.out.println("gen," + fj);
            String data = gen.gen(clz, program, author, create, fj.getFtl());
            WriteUtil.write(data, clz, fj.getJava());
        });

    }
}
