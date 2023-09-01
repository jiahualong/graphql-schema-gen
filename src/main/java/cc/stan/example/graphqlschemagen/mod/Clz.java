package cc.stan.example.graphqlschemagen.mod;

import com.google.common.base.CaseFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.apache.commons.text.WordUtils;

import java.util.List;

import static java.util.stream.Collectors.toList;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Clz {
    /** class名 */
    private String clzName;
    private String clzNameUncapitalize;
    /** tbl名 */
    private String tblName;
    /** comment */
    private String comment;
    /** 属性 */
    private List<Prop> propList;
    /** VO属性 */
    private List<Prop> propVOList;
    /** Input属性 */
    private List<Prop> propInputList;

    /** 填充 */
    public Clz fill() {
        clzName = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, tblName);
        clzNameUncapitalize = WordUtils.uncapitalize(clzName);
        propList = propList.stream().map(Prop::fill).collect(toList());
        propVOList = propList.stream().filter(p -> {
            if (p.getClzProp().indexOf("creator") >= 0
                    || p.getClzProp().indexOf("modifier") >= 0
                    || p.getClzProp().indexOf("createTm") >= 0
                    || p.getClzProp().indexOf("modifyTm") >= 0
                    || p.getClzProp().indexOf("isDel") >= 0) {
                return false;
            } else {
                return true;
            }
        }).collect(toList());
        propInputList = propVOList.stream().filter(p -> {
            if (p.getClzProp().indexOf("tenantId") >= 0) {
                return false;
            } else {
                return true;
            }
        }).collect(toList());

        return this;
    }
}
