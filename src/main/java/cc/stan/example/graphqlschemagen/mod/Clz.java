package cc.stan.example.graphqlschemagen.mod;

import com.google.common.base.CaseFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

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
    /** tbl名 */
    private String tblName;
    /** comment */
    private String comment;
    /** 属性 */
    private List<Prop> propList;

    public Clz fill() {
        clzName = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, tblName);
        propList = propList.stream().map(Prop::fill).collect(toList());
        return this;
    }
}
