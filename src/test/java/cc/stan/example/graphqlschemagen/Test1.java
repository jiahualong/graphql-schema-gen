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
//                "sys_custom_field    ,系统自定义字段选项",
//                "id                  ,bigint             ,id",
//                "tenant_id           ,bigint             ,租户id",
//                "en_name             ,varchar(200)       ,英文名",
//                "ch_name             ,varchar(200)       ,中文名",
//                "type                ,varchar(200)       ,字段类型",
//                "value               ,text               ,下拉框的值_以逗号分割",
//                "creator             ,bigint             ,创建人",
//                "modifier            ,bigint             ,修改人",
//                "create_tm           ,datetime           ,创建时间",
//                "modify_tm           ,datetime           ,修改时间",
//                "is_del              ,tinyint default 0  ,逻辑删除"
//        );

        List<String> sql = Arrays.asList(
                "res                 ,资源表",
                "id                  ,bigint            ,资源目录ID",
                "tenant_id           ,bigint            ,租户ID",
                "org_id              ,bigint            ,所属机构ID",
                "ver_id              ,varchar(45)       ,版本ID",
                "name                ,varchar(200)      ,资源名字",
                "code                ,varchar(100)      ,资源编号",
                "`desc`              ,varchar(200)      ,资源描述",
                "is_exist_info_sys   ,tinyint(1)        ,是否有绑定信息系统",
                "info_sys_id         ,bigint            ,信息系统ID",
                "res_format_class_id ,bigint            ,资源格式分类ID",
                "res_format_type_id  ,bigint            ,资源格式类型ID",
                "update_cycle_id     ,bigint            ,更新周期ID",
                "data_sub_id         ,bigint            ,数据主题ID",
                "data_range_id       ,bigint            ,数据范围ID",
                "biz_cate_id         ,bigint            ,行业类型ID",
                "share_prop          ,varchar(20)       ,共享属性",
                "share_mode_type     ,bigint            ,共享方式类型ID",
                "share_reasons       ,varchar(200)      ,共享及不共享理由",
                "is_open_to_society  ,tinyint(1)        ,是否向社会开放",
                "open_cond           ,varchar(10)       ,共享条件",
                "is_share_db         ,tinyint default 1 ,通过数据库共享",
                "is_share_api        ,tinyint default 1 ,通过api共享",
                "is_share_file       ,tinyint default 1 ,通过文件共享",
                "is_conn             ,tinyint default 0 ,是否接入",
                "public_tm           ,datetime          ,发布日期",
                "update_tm           ,datetime          ,更新日期",
                "f1_ch               ,varchar(200)      ,预留字段1中文名",
                "f1_en               ,varchar(200)      ,预留字段1英文名",
                "f1_type             ,varchar(200)      ,预留字段1数据类型",
                "f1_val              ,varchar(200)      ,预留字段1值",
                "f2_ch               ,varchar(200)      ,预留字段2中文名",
                "f2_en               ,varchar(200)      ,预留字段2英文名",
                "f2_type             ,varchar(200)      ,预留字段2数据类型",
                "f2_val              ,varchar(200)      ,预留字段2值",
                "f3_ch               ,varchar(200)      ,预留字段3中文名",
                "f3_en               ,varchar(200)      ,预留字段3英文名",
                "f3_type             ,varchar(200)      ,预留字段3数据类型",
                "f3_val              ,varchar(200)      ,预留字段3值",
                "f4_ch               ,varchar(200)      ,预留字段4中文名",
                "f4_en               ,varchar(200)      ,预留字段4英文名",
                "f4_type             ,varchar(200)      ,预留字段4数据类型",
                "f4_val              ,varchar(200)      ,预留字段4值",
                "f5_ch               ,varchar(200)      ,预留字段5中文名",
                "f5_en               ,varchar(200)      ,预留字段5英文名",
                "f5_type             ,varchar(200)      ,预留字段5数据类型",
                "f5_val              ,varchar(200)      ,预留字段5值",
                "f6_ch               ,varchar(200)      ,预留字段6中文名",
                "f6_en               ,varchar(200)      ,预留字段6英文名",
                "f6_type             ,varchar(200)      ,预留字段6数据类型",
                "f6_val              ,varchar(200)      ,预留字段6值",
                "f7_ch               ,varchar(200)      ,预留字段7中文名",
                "f7_en               ,varchar(200)      ,预留字段7英文名",
                "f7_type             ,varchar(200)      ,预留字段7数据类型",
                "f7_val              ,varchar(200)      ,预留字段7值",
                "f8_ch               ,varchar(200)      ,预留字段8中文名",
                "f8_en               ,varchar(200)      ,预留字段8英文名",
                "f8_type             ,varchar(200)      ,预留字段8数据类型",
                "f8_val              ,varchar(200)      ,预留字段8值",
                "f9_ch               ,varchar(200)      ,预留字段9中文名",
                "f9_en               ,varchar(200)      ,预留字段9英文名",
                "f9_type             ,varchar(200)      ,预留字段9数据类型",
                "f9_val              ,varchar(200)      ,预留字段9值",
                "f10_ch              ,varchar(200)      ,预留字段10中文名",
                "f10_en              ,varchar(200)      ,预留字段10英文名",
                "f10_type            ,varchar(200)      ,预留字段10数据类型",
                "f10_val             ,varchar(200)      ,预留字段10值",
                "creator             ,bigint            ,记录创建人",
                "modifier            ,bigint            ,记录修改人",
                "create_tm           ,datetime(3)       ,创建时间",
                "modify_tm           ,datetime(3)       ,修改时间",
                "is_del              ,tinyint default 0 ,逻辑删除'"
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
