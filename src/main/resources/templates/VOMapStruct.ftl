package com.seaboxdata.drd2.vo.duty;

import com.seaboxdata.drd2.api.dto.duty.DutyDTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface DutyVOMapStruct {

DutyVOMapStruct INSTANCE = Mappers.getMapper(DutyVOMapStruct.class);

DutyVO fromDTO(DutyDTO dto);
}
