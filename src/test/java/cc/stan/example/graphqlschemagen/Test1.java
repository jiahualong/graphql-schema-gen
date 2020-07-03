package cc.stan.example.graphqlschemagen;

import cc.stan.example.graphqlschemagen.mod.Clz;
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
                "info_sys_source_db, 资源数据来源-从数据库获取的",
                "id             ,bigint            ,ID",
                "tenant_id      ,bigint            ,租户id",
                "org_id         ,bigint            ,所属机构ID",
                "order_id       ,int               ,排序id",
                "info_system_id ,bigint            ,对应的信息系统id",
                "mds_sys_id     ,bigint            ,Mds sys id",
                "mds_plant_id   ,bigint            ,Mds plant id",
                "mds_db_id      ,bigint            ,Mds db id",
                "mds_obj_id     ,bigint            ,Mds db id",
                "name           ,varchar200      ,数据库名称",
                "type           ,varchar45       ,数据库类型",
                "desc           ,varchar200      ,数据库描述",
                "att_fid        ,varchar200       ,附件fid",
                "att_file_name  ,varchar200       ,附件名",
                "data_source_id ,bigint            ,数据源ID",
                "is_connected   ,tinyint           ,是否接入",
                "conn_tm        ,datetime          ,接入时间",
                "creator        ,bigint            ,创建人",
                "modifier       ,bigint            ,修改人",
                "create_tm      ,datetime          ,创建时间",
                "modify_tm      ,datetime          ,修改时间",
                "is_del         ,tinyint           ,逻辑删除"
        );
        Clz clz = fromSql(sql);

        String model = gen.genModelFtl(clz, program, author, create);
        WriteUtil.writeModel(model, clz);

        String ctl = gen.genCtlFtl(clz, program, author, create);
        WriteUtil.writeCtl(ctl, clz);

        String dao = gen.genDAOFtl(clz, program, author, create);
        WriteUtil.writeDAO(dao, clz);

        String dto = gen.genDTOFtl(clz, program, author, create);
        WriteUtil.writeDTO(dao, clz);
    }
}
