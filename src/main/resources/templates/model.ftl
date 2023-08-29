package model;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.seaboxdata.seamodel5.comm.model.BaseModel;
import com.seaboxdata.seamodel5.core.mpp.annotation.InsertFill;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @Desc ${clz.comment}实体
 * @Author ${author}
 * @Date ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "${clz.tblName}", autoResultMap = true)
public class ${clz.clzName} extends BaseModel{
@TableId
@TableLogic(value = "0", delval = "1")
<#list proList as pro >
    /** ${pro.comm} */
    @InsertFill
    @TableField(fill = FieldFill.INSERT)
    private ${pro.clzType} ${pro.clzProp};
</#list>

    /** id是否为空 */
    public boolean isNew() {
        return Objects.isNull(this.id);
    }
}


