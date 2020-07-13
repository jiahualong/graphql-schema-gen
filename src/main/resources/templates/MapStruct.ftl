package model.mapstruct;

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
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface ${clz.clzName}MapStruct {

    ${clz.clzName}MapStruct INSTANCE = Mappers.getMapper(${clz.clzName}MapStruct.class);

    /**
     * Model -> DTO
     *
     * @param from Model
     * @return DTO
     */
    ${clz.clzName}DTO toDTO(${clz.clzName} from);

    /**
     * Input -> Model
     *
     * @param input Input
     * @return Model
     */
    ${clz.clzName} fromInput(${clz.clzName}Input input);
}
