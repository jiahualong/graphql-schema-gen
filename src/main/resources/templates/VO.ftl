package vo.${clz.clzName?uncap_first};

import com.seaboxdata.drd2.vo.res.ResVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * ${clz.clzName} GraphQL VO实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
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

    public static ${clz.clzName}VO empty() {
        return ${clz.clzName}VO.builder().build();
    }
}
