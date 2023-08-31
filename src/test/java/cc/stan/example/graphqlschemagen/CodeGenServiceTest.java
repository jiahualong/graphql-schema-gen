package cc.stan.example.graphqlschemagen;

import cc.stan.example.graphqlschemagen.code.CodeInfo;
import cc.stan.example.graphqlschemagen.code.ICodeGenService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static java.util.stream.Collectors.toCollection;
import static java.util.stream.Collectors.toList;

@SpringBootTest
class CodeGenServiceTest {

    @Autowired
    private ICodeGenService codeGenService;

    @Test
    void genCodeFromCsv() {
        List<String> csvList = Arrays.asList(
//                "mm_attr_field_upload.csv",
//                "mm_attr_fk_assoc_upload.csv",
//                "mm_attr_rela_upload.csv",
//                "mm_attr_to_pub_attr_assoc_upload.csv",
//                "mm_attr_to_rela_upload.csv",

//                "mm_attr_upload.csv",
//                "mm_attr_upload_excel.csv"

//                "mm_canvas_to_entity_assoc_upload.csv",
//                "mm_canvas_to_fk_assoc_upload.csv",
//                "mm_canvas_to_sub_category_assoc_upload.csv",
//                "mm_canvas_upload.csv",
//                "mm_common_attr_grp_to_entity_assoc_upload.csv",
//                "mm_common_attr_grp_upload.csv",
//                "mm_common_attr_to_grp_assoc_upload.csv",
//                "mm_common_attr_upload.csv",
//                "mm_diagram_upload.csv",
//                "mm_dm_biz_subject_upload.csv",
//                "mm_dm_chk_rule_upload.csv",
//                "mm_dm_datatype_rela_upload.csv",

                "mm_dm_datatype_upload.csv",
                "mm_dm_datatype_upload_excel.csv"

//                "mm_dm_ddl_rule_upload.csv",
//                "mm_dm_instance_upload.csv",
//                "mm_dm_term_assoc_upload.csv",
//                "mm_dm_term_upload.csv",
//                "mm_entity_label_assoc_upload.csv",
//                "mm_entity_line_upload.csv",
//                "mm_entity_rela_upload.csv",
//                "mm_entity_sub_category_upload.csv",
//                "mm_entity_to_rela_upload.csv",

//                "mm_entity_upload.csv",
//                "mm_entity_upload_excel.csv"

//                "mm_export_default_rule_upload.csv",
//                "mm_fk_upload.csv",
//                "mm_folder_upload.csv",
//                "mm_key_assoc_upload.csv",
//                "mm_key_upload.csv",
//                "mm_sharding_assoc_upload.csv",
//                "mm_sharding_attr_rela_upload.csv",
//                "mm_sub_category_to_fk_assoc_upload.csv"

        );

        csvList.stream().forEach(f -> {
            Path path = Paths.get("/Users/hualong/l2_code_space/graphql-schema-gen/src/main/resources/table_csv/" + f);
            try (Stream<String> lines = Files.lines(path, StandardCharsets.UTF_8)) {
                List<String> columns = lines
                        .filter(e -> e.indexOf(",") > 0)
                        .map(e-> e.replace("\n",""))
                        .filter(e -> !e.startsWith("--"))
                        .filter(e -> !e.startsWith("create_tm,"))
                        .filter(e -> !e.startsWith("creator,"))
                        .filter(e -> !e.startsWith("modifier,"))
                        .filter(e -> !e.startsWith("modify_tm,"))
                        .filter(e -> !e.startsWith("tenant_id,"))
                        .filter(e -> !e.startsWith("if_delete,"))
                        .map(e-> e.replace("\n",""))
                        .collect(toList());
                System.out.println("proc:" + path);
                genCode(columns);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        });
    }

    private void genCode(List<String> columns) {
        codeGenService.genCodes(CodeInfo.builder()
                .program("SEAMODEL5-SERVER")
                .author("hualong.jia@seaboxdata.com")
                .propList(columns).build());
    }

    @Test
    void genCode() {
        codeGenService.genCodes(CodeInfo.builder()
                .program("SEAMODEL5-SERVER")
                .author("hualong.jia@seaboxdata.com")
                .propList(Arrays.asList(
                        "mm_attr_field_upload,属性域上传,元数据对象",
                        "attr_constraint,character varying(500),属性约束",
                        "attr_def,character varying(500),属性定义",
                        "attr_field_id,bigint,属性域标识",
                        "batch_id,bigint,批次标识",
                        "cn_name,character varying(500),中文名称",
                        "conflict_situation_cd,character varying(30),冲突情况代码",
                        "create_tm,timestamp without time zone,记录创建时间",
                        "creator,bigint,记录创建人",
                        "describe,character varying(500),描述",
                        "dm_datatype_id,bigint,模型数据类型标识",
                        "dm_id,bigint,模型标识",
                        "en_name,character varying(500),英文名称",
                        "if_delete,character varying(1),是否删除记录",
                        "modifier,bigint,记录修改人",
                        "modify_tm,timestamp without time zone,记录修改时间",
                        "parent_domain_id,bigint,父数据域标识",
                        "scope_content,character varying(2000),范围内容",
                        "scope_type_cd,character varying(30),范围类型代码",
                        "sort,integer,排序",
                        "tenant_id,bigint,租户标识"
                )).build());
    }
}
