package cc.stan.example.graphqlschemagen;

import cc.stan.example.graphqlschemagen.code.CodeInfo;
import cc.stan.example.graphqlschemagen.code.ICodeGenService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;

@SpringBootTest
class CodeGenServiceTest {

    @Autowired
    private ICodeGenService codeGenService;

    @Test
    void genCode() {

        codeGenService.genCodes(CodeInfo.builder()
                .program("SAMP5-SERVER")
                .author("hualong.jia@seaboxdata.com")
                .propList(Arrays.asList(
                        "md_meta_obj_lineage,元数据对象血缘",
                        "meta_obj_lineage_id,bigint,元数据对象血缘标识",
                        "describe,character varying(2000),描述",
                        "daq_tm,timestamp without time zone,采集时间",
                        "origin_phy_ins_id,bigint,来源物理实例标识",
                        "origin_meta_obj_id,bigint,来源元数据对象标识",
                        "origin_meta_obj_en_name,character varying(500),来源元数据对象英文名称",
                        "if_tmp_origin_obj,character varying(1),是否临时来源对象",
                        "origin_refine_meta_attr_id,bigint,来源精细化元数据属性标识",
                        "origin_refine_constant_val,character varying(2000),来源精细化常量值",
                        "target_phy_ins_id,bigint,目标物理实例标识",
                        "target_meta_obj_id,bigint,目标元数据对象标识",
                        "target_meta_obj_en_name,character varying(500),目标元数据对象英文名称",
                        "if_tmp_target_obj,character varying(1),是否临时目标对象",
                        "lineage_relationship_type_cd,character varying(30),血缘关系类型代码",
                        "lineage_origin_mode_cd,character varying(30),血缘来源方式代码",
                        "meta_obj_oper_daq_id,bigint,元数据对象数据操作采集标识",
                        "meta_obj_map_file_daq_id,bigint,元数据对象映射文件采集标识",
                        "tenant_id,bigint,租户标识",
                        "if_delete,character varying(1),是否删除记录",
                        "creator,bigint,记录创建人",
                        "create_tm,timestamp without time zone,记录创建时间",
                        "modifier,bigint,记录修改人",
                        "modify_tm,timestamp without time zone,记录修改时间"
                )).build());
    }
}
