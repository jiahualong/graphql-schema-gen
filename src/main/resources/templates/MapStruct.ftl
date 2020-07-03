package model.mapstruct;

import com.seaboxdata.drd2.api.dto.biz.BizDTO;
import com.seaboxdata.drd2.api.input.biz.BizInput;
import com.seaboxdata.drd2.biz.model.Biz;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface BizMapStruct {
BizMapStruct INSTANCE = Mappers.getMapper(BizMapStruct.class);

BizDTO toDTO(Biz from);

Biz fromInput(BizInput input);
}
