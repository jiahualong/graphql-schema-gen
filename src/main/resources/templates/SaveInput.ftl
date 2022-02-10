package input;

import com.seaboxdata.commons.query.OrderItem;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @Desc 分页查询${clz.comment}请求体
 * @Author ${author}
 * @Date ${create}
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Page${clz.clzName}Input {
    /** 应用编号 */
    private Long appId;
    /** 关键字 */
    private String keyWord;
    /** 开始时间 */
    private LocalDateTime lastOperateBeginTime;
    /** 结束时间 */
    private LocalDateTime lastOperateEndTime;
    /** 跳过前offset条数据 */
    private Integer offset;
    /** 读取limit条数据 < 100 */
    private Integer limit;
    /** 排序字段 */
    private List<OrderItem> orderBy;
}

