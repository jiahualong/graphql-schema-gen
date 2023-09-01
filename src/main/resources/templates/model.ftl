package model;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.seaboxdata.seamodel5.comm.model.BaseModel;
import com.seaboxdata.seamodel5.core.mpp.annotation.InsertFill;
import com.seaboxdata.seamodel5.core.mpp.enums.DefaultValueEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import lombok.EqualsAndHashCode;
import com.seaboxdata.seamodel5.sdm.draft.upload.helper.BaseModelHelper;
import org.jetbrains.annotations.NotNull;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @Desc ${clz.comment} ISheetProc实现
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
@MppMultiId
@TableLogic(value = "0", delval = "1")
<#list proList as pro >

    /** ${pro.comm} */
    @InsertFill(value = DefaultValueEnum.${pro.insertFillValue})
    @TableField(fill = FieldFill.INSERT)
    private ${pro.clzType} ${pro.clzProp};
</#list>

    /** helper */
    @TableField(exist = false)
    private final transient BaseModelHelper<${clz.clzName}> baseModelHelper = new BaseModelHelper<>();

    /** set base model */
    public ${clz.clzName} setBaseModelValue(Long userId, Long tenantId) {
        return baseModelHelper.setValue(this, userId, tenantId);
    }

    /** set base model */
    public ${clz.clzName} setBaseModelValue(@NotNull BaseModel baseModel) {
        return baseModelHelper.setValue(this, baseModel);
    }
}