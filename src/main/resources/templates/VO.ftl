package vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @Desc ${clz.clzName} GraphQL VO实现
 * @Author ${author}
 * @Date ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ${clz.clzName}VO {
  <#list proVOList as pro >
    /** ${pro.comm} */
    private ${pro.clzType} ${pro.clzProp};
  </#list>
    /** 生成一个空的实体 */
    public static ${clz.clzName}VO empty() {
        return ${clz.clzName}VO.builder().build();
    }
}
