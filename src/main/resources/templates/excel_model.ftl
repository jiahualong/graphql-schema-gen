package model;

import com.seaboxdata.seamodel5.sdm.draft.upload.helper.SwitchEnumHelper;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * @Desc ${clz.comment}Excel实体
 * ${clz.tblName}
 * @Author ${author}
 * @Date ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class ${clz.clzName}Model {
<#list proList as pro >
    /** ${pro.comm} */
    private ${pro.clzType} ${pro.clzProp};
</#list>

    /**
     * redress values
     *
     * @param model MmEntityUploadExcelModel
     * @return MmEntityUploadExcelModel
     */
    public static ${clz.clzName}Model redress(${clz.clzName}Model model) {
        return model
                .setIf(SwitchEnumHelper.toEnum(model.getIf()).getCode())
        ;
    }
}