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
                .program("DRD2-SERVER")
                .author("magic.hualong@gmail.com")
                .propList(Arrays.asList(
                        "sys_display_item       ,系统显示模块配置" ,
                        "id                     ,bigint                 ,id" ,
                        "tenant_id              ,bigint                 ,租户id" ,
                        "en_name                ,varchar(200)           ,英文名(与前端协商)" ,
                        "ch_name                ,varchar(200)           ,中文名" ,
                        "status                 ,tinyint(1)             ,显示状态" ,
                        "creator                ,bigint                 ,创建人" ,
                        "modifier               ,bigint                 ,修改人" ,
                        "create_tm              ,datetime               ,创建时间" ,
                        "modify_tm              ,datetime               ,修改时间" ,
                        "is_del                 ,tinyint                ,逻辑删除"

                )).build());
    }
}
