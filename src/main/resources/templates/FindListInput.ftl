
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Objects;

/**
 * ${clz.clzName} GraphQL VO请求封装
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Find${clz.clzName}ListInput {
    private Long orgId;
    private Integer pageNum;
    private Integer size;

    public static Find${clz.clzName}ListInput empty() {
        return Find${clz.clzName}ListInput.builder()
                .pageNum(1)
                .size(10)
                .build();
    }

    public void trim() {
        pageNum = Objects.isNull(pageNum) ? 1 : pageNum;
        pageNum = pageNum <= 0 ? 1 : pageNum;
        size = Objects.isNull(this.size) ? 10 : size;
        size = size <= 0 ? 1 : size;
        size = size > 100 ? 100 : size;
    }
}
