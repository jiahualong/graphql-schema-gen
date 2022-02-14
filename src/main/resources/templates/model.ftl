package model;

import com.baomidou.mybatisplus.annotation.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @Desc ${clz.comment}实体
 * @Author ${author}
 * @Date ${create}
 */
@TableName("${clz.tblName}")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ${clz.clzName} {

@TableId(type = IdType.INPUT)
@TableLogic(value = "0", delval = "1")
<#list proList as pro >
    /** ${pro.comm} */
    private ${pro.clzType} ${pro.clzProp};
</#list>

    /** id是否为空 */
    public boolean isNew() {
        return Objects.isNull(this.id);
    }
}


