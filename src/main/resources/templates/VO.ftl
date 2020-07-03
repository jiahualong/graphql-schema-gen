package com.seaboxdata.drd2.vo.duty;

import com.seaboxdata.drd2.vo.res.ResVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/** 职责 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class DutyVO {
/** 职责ID */
private Long id;
/** 租户id */
private Long tenantId;
/** 所属机构id */
private Long orgId;
/** 排序id */
private Integer orderId;
/** 职责名称 */
private String name;
/** 职责内容 */
private String desc;
/** 职责所包含的Res对象 */
private List<ResVO> resList;

    public static DutyVO empty() {
    return DutyVO.builder().build();
    }
    }
