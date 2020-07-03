package com.seaboxdata.drd2.vo.duty.output;

import com.seaboxdata.drd2.api.dto.duty.DutyDTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.vo.duty.DutyVO;
import com.seaboxdata.drd2.vo.duty.DutyVOMapStruct;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class FindDutyListOutput {
private List<DutyVO> data;
    private Integer pageNum;
    private Integer size;
    private Integer total;

    public static FindDutyListOutput fromDTO(PaginationResult<DutyDTO> pageDTO) {
        if (Objects.isNull(pageDTO) || null == pageDTO.getData()) {
        return FindDutyListOutput.empty();
        } else {
        return FindDutyListOutput.builder()
        .total(pageDTO.getTotal())
        .size(pageDTO.getLimit())
        .pageNum(pageDTO.getPageNum())
        .data(pageDTO.getData().stream().map(DutyVOMapStruct.INSTANCE::fromDTO).collect(toList()))
        .build();
        }
        }

        private static FindDutyListOutput empty() {
        return FindDutyListOutput.builder()
        .data(Collections.emptyList())
        .pageNum(0)
        .size(10)
        .total(0)
        .build();
        }
        }
