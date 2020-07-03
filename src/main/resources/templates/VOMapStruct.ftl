package vo.mapstruct;

import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}DTO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * ${clz.clzName} VO MapStruct实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Mapper
public interface ${clz.clzName}VOMapStruct {
    ${clz.clzName}VOMapStruct INSTANCE = Mappers.getMapper(${clz.clzName}VOMapStruct.class);

    ${clz.clzName}VO fromDTO(${clz.clzName}DTO dto);
}