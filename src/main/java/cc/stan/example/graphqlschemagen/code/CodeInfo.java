package cc.stan.example.graphqlschemagen.code;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 代码属性参数
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class CodeInfo {
    /** 用于JavaDoc的应用的名字 */
    private String program;
    /** 用于JavaDoc的作者 */
    private String author;
    /** 要生成code的属性列表 */
    private List<String> propList;
}
