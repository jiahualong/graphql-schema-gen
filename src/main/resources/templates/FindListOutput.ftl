package vo.output;

import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}DTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.${clz.clzName}VO;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.${clz.clzName}VOMapStruct;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
 * ${clz.clzName} 结果GraphQL VO封装
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
public class Find${clz.clzName}ListOutput {
    private List<${clz.clzName}VO> data;
    private Integer pageNum;
    private Integer size;
    private Integer total;

    public static Find${clz.clzName}ListOutput fromDTO(PaginationResult<${clz.clzName}DTO> pageDTO) {
        if (Objects.isNull(pageDTO) || null == pageDTO.getData()) {
            return Find${clz.clzName}ListOutput.empty();
        } else {
            return Find${clz.clzName}ListOutput.builder()
                    .total(pageDTO.getTotal())
                    .size(pageDTO.getLimit())
                    .pageNum(pageDTO.getPageNum())
                    .data(pageDTO.getData().stream().map(${clz.clzName}VOMapStruct.INSTANCE::fromDTO).collect(toList()))
                    .build();
        }
    }

    private static Find${clz.clzName}ListOutput empty() {
        return Find${clz.clzName}ListOutput.builder()
                .data(Collections.emptyList())
                .pageNum(0)
                .size(10)
                .total(0)
                .build();
    }
}
