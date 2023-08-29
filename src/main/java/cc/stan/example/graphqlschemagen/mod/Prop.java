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
    /**  */
    private String insertFillValue;
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

        if (dbType.indexOf("bigint") >= 0 || dbType.indexOf("int8") >= 0) {
            clzType = "Long";
            graphqlType = "ID";
            insertFillValue = "LONG";
            return;
        }
        if (dbType.indexOf("tinyint") >= 0 || dbType.indexOf("boolean") >= 0) {
            clzType = "Boolean";
            graphqlType = "Boolean";
            insertFillValue = "BOOLEAN";
            return;
        }
        if (dbType.indexOf("int") >= 0) {
            clzType = "Integer";
            graphqlType = "Int";
            insertFillValue = "INTEGER";
            return;
        }
        if (dbType.indexOf("varchar") >= 0 || dbType.indexOf("text") >= 0 ||dbType.indexOf("character") >= 0) {
            clzType = "String";
            graphqlType = "String";
            insertFillValue = "STRING";
            return;
        }
        if (dbType.indexOf("jsonb") >= 0) {
            clzType = "String";
            graphqlType = "String";
            insertFillValue = "JSONB";
            return;
        }
        if (dbType.indexOf("datetime") >= 0 || dbType.indexOf("timestamp") >= 0) {
            clzType = "LocalDateTime";
            graphqlType = "LocalDateTime";
            insertFillValue = "DATETIME";
            return;
        }
        if (dbType.indexOf("date") >= 0) {
            clzType = "LocalDate";
            graphqlType = "LocalDate";
            insertFillValue = "DATETIME";
            return;
        }
        if (dbType.indexOf("double") >= 0) {
            clzType = "Double";
            graphqlType = "Float";
            insertFillValue = "DEFAULT";
            return;
        }
        if (dbType.indexOf("numeric") >= 0) {
            clzType = "BigDecimal";
            graphqlType = "Float";
            insertFillValue = "BIG_DECIMAl";
            return;
        }
    }
}
