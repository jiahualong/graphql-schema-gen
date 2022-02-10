package cc.stan.example.graphqlschemagen;

import cc.stan.example.graphqlschemagen.code.CodeInfo;
import cc.stan.example.graphqlschemagen.code.ICodeGenService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;

@SpringBootTest
public class CodeGenServiceTest {

    @Autowired
    private ICodeGenService codeGenService;

    @Test
    public void genCode() {

        codeGenService.genCodes(CodeInfo.builder()
                .program("HAIDA-SERVER")
                .author("hualong.jia")
                .propList(Arrays.asList(
                        
                        //---
//                        "dev_app_require_category,开发时应用需求分类表",
//                        "category_id        ,int8      , 需求分类ID ",
//                        "app_id             ,int8      , 应用ID     ",
//                        "category_name      ,varchar   , 分类名称   ",
//                        "sort               ,int4      , 排序       ",
//                        "parent_category_id ,int8      , 上级分类ID ",
//                        "tenant_id          ,int8      , 租户ID     ",
//                        "creator            ,int8      , 创建人     ",
//                        "modifier           ,int8      , 修改人     ",
//                        "create_tm          ,timestamp , 创建时间   ",
//                        "modify_tm          ,timestamp , 修改时间   ",
//                        "if_delete          ,int4      , 是否删除"
                )).build());
    }
}
