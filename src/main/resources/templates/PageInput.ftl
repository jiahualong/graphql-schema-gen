package input;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @Desc 保存或更新${clz.comment}请求体
 * @Author ${author}
 * @Date ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Save${clz.clzName}Input {
<#list propInputList as pro >
    /** ${pro.comm} */
    private ${pro.clzType} ${pro.clzProp};
</#list>
}
