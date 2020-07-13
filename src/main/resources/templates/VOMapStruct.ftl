package vo.mapstruct;

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
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface ${clz.clzName}VOMapStruct {

    ${clz.clzName}VOMapStruct INSTANCE = Mappers.getMapper(${clz.clzName}VOMapStruct.class);

    /**
     * DTO -> VO
     *
     * @param dto DTO
     * @return VO
     */
    ${clz.clzName}VO fromDTO(${clz.clzName}DTO dto);
}
