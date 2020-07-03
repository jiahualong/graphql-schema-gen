package cc.stan.example.graphqlschemagen;

import cc.stan.example.graphqlschemagen.mod.Clz;
import cc.stan.example.graphqlschemagen.template.FreemarkerGen;
import freemarker.template.TemplateException;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import static cc.stan.example.graphqlschemagen.mod.ClzUtil.fromSql;

public class Test1 {

    @Test
    public void t1() throws IOException, TemplateException {

        List<String> sql = Arrays.asList(
                "info_sys_source_db, 资源数据来源-从数据库获取",
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
        System.out.println( FreemarkerGen.gen(clz));

        System.out.println(clz);

    }
}
