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


//        List<String> sql = Arrays.asList(
//                "sys_info, 资源数据来源-从数据库获取的",
//                "id             ,bigint            ,ID",
//                "tenant_id      ,bigint            ,租户id",
//                "org_id         ,bigint            ,所属机构ID",
//                "order_id       ,int               ,排序id",
//                "info_system_id ,bigint            ,对应的信息系统id",
//                "mds_sys_id     ,bigint            ,Mds sys id",
//                "mds_plant_id   ,bigint            ,Mds plant id",
//                "mds_db_id      ,bigint            ,Mds db id",
//                "mds_obj_id     ,bigint            ,Mds db id",
//                "name           ,varchar200      ,数据库名称",
//                "type           ,varchar45       ,数据库类型",
//                "desc           ,varchar200      ,数据库描述",
//                "att_fid        ,varchar200       ,附件fid",
//                "att_file_name  ,varchar200       ,附件名",
//                "data_source_id ,bigint            ,数据源ID",
//                "is_connected   ,tinyint           ,是否接入",
//                "conn_tm        ,datetime          ,接入时间",
//                "creator        ,bigint            ,创建人",
//                "modifier       ,bigint            ,修改人",
//                "create_tm      ,datetime          ,创建时间",
//                "modify_tm      ,datetime          ,修改时间",
//                "is_del         ,tinyint           ,逻辑删除"
//        );

        List<String> sql = Arrays.asList(
                "res , 资源表",
                "id                 ,bigint            ,资源目录ID",
                "tenant_id          ,bigint            ,租户ID",
                "org_id             ,bigint            ,所属机构ID",
                "name               ,varchar(200)      ,资源名字",
                "code               ,varchar(100)      ,资源编号",
                "desc               ,varchar(200)      ,资源描述",
                "e_data_sub_id      ,bigint            ,数据主题枚举id",
                "e_biz_cate_id      ,bigint            ,行业分类枚举id",
                "e_field_id         ,bigint            ,所属领域枚举id",
                "e_data_range_id    ,varchar(100)      ,数据范围枚举id",
                "share_cond         ,varchar(10)       ,共享条件",
                "is_share_db        ,tinyint default 1 ,通过数据库共享",
                "is_share_api       ,tinyint default 1 ,通过api共享",
                "is_share_file      ,tinyint default 1 ,通过文件共享",
                "is_conn            ,tinyint default 0 ,是否接入",
                "is_open_to_society ,varchar(45)       ,是否向社会开放",
                "data_cap           ,varchar(45)       ,数据容量",
                "share_prop         ,varchar(45)       ,共享属性",
                "open_cond          ,varchar(45)       ,开放条件",
                "public_tm          ,datetime          ,发布日期",
                "update_tm          ,datetime          ,更新日期",
                "score              ,double            ,评分",
                "pv                 ,bigint            ,页面访问量",
                "exchange_num       ,bigint            ,交换数量",
                "field_1            ,varchar(45)       ,预留字段",
                "field_2            ,varchar(45)       ,预留字段",
                "field_3            ,varchar(45)       ,预留字段",
                "field_4            ,varchar(45)       ,预留字段",
                "field_5            ,varchar(45)       ,预留字段",
                "field_6            ,varchar(45)       ,预留字段",
                "field_7            ,varchar(45)       ,预留字段",
                "field_8            ,varchar(45)       ,预留字段",
                "field_9            ,varchar(45)       ,预留字段",
                "field_10           ,varchar(45)       ,预留字段",
                "ver_id             ,varchar(45)       ,版本ID",
                "edit_id            ,bigint            ,编辑id",
                "creator            ,bigint            ,记录创建人",
                "modifier           ,bigint            ,记录修改人",
                "create_tm          ,datetime(3)       ,创建时间",
                "modify_tm          ,datetime(3)       ,修改时间",
                "is_del             ,tinyint default 0 ,逻辑删除"
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
