package model.mapstruct;

import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}DTO;
import com.seaboxdata.drd2.api.input.${clz.clzName?uncap_first}.${clz.clzName}Input;
import com.seaboxdata.drd2.${clz.clzName?uncap_first}.model.${clz.clzName};
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * ${clz.clzName} MapStruct实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Mapper
public interface ${clz.clzName}MapStruct {
    ${clz.clzName}MapStruct INSTANCE = Mappers.getMapper(${clz.clzName}MapStruct.class);

    ${clz.clzName}DTO toDTO(${clz.clzName} from);

    ${clz.clzName} fromInput(${clz.clzName}Input input);
}
