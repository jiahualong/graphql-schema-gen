package model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * ${clz.clzName!'-'}
 *
 * @program: ${program!'-'}
 * @description:${clz.comment!'-'}
 * @author: ${author!'-'}
 * @create: ${create!'-'}
*/
@TableName("${clz.tblName!'-'}")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ${clz.clzName!'-'} {

<#list proList as pro >
    /** ${pro.comm!'-'} */
    private ${pro.clzType!'-'} ${pro.clzProp!'-'};
</#list>

public boolean isNew() {
    return Objects.nonNull(this.id) ? false : true;
    }
}
