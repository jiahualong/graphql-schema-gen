package api.input;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * ${clz.clzName} Input输入实体
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
public class BizInput {
<#list proVOList as pro >
    /** ${pro.comm} */
    private ${pro.clzType} ${pro.clzProp};
</#list>
}
