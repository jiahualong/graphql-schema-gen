package dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @Desc ${clz.clzName} DTO对象
 * @Author ${author}
 * @Date ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ${clz.clzName}DTO {
  <#list proList as pro >
    /** ${pro.comm} */
    private ${pro.clzType} ${pro.clzProp};
  </#list>
}