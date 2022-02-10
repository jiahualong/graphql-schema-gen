package cc.stan.example.graphqlschemagen.mod;

import com.google.common.base.CaseFormat;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Prop {
    /** db属性名 */
    private String dbProp;
    /** clz属性名 */
    private String clzProp;
    /** db类型 */
    private String dbType;
    /** clz 类型 */
    private String clzType;
    /** graphql 类型 */
    private String graphqlType;
    /** 注释 */
    private String comm;

    public Prop fill() {
        clzProp = CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, dbProp);
        dbTypeFill();
        return this;
    }

    private void dbTypeFill() {

        if (dbType.indexOf("bigint") >= 0) {
            clzType = "Long";
            graphqlType = "ID";
            return;
        }
        if (dbType.indexOf("tinyint") >= 0 || dbType.indexOf("boolean") >= 0) {
            clzType = "Boolean";
            graphqlType = "Boolean";
            return;
        }
        if (dbType.indexOf("int8") >= 0) {
            clzType = "Long";
            graphqlType = "ID";
            return;
        }
        if (dbType.indexOf("int") >= 0) {
            clzType = "Integer";
            graphqlType = "Int";
            return;
        }
        if (dbType.indexOf("varchar") >= 0 || dbType.indexOf("text") >= 0) {
            clzType = "String";
            graphqlType = "String";
            return;
        }

        if (dbType.indexOf("datetime") >= 0 || dbType.indexOf("timestamp") >= 0) {
            clzType = "LocalDateTime";
            graphqlType = "LocalDateTime";
            return;
        }

        if (dbType.indexOf("double") >= 0) {
            clzType = "Double";
            graphqlType = "Float";
            return;
        }
    }
}
