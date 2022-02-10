package convert;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import org.mapstruct.factory.Mappers;

/**
 * @Desc ${clz.clzName} Bean转换实现
 * @Author ${author}
 * @Date ${create}
 */
@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface ${clz.clzName}Convert {

    ${clz.clzName}Convert INSTANCE = Mappers.getMapper(${clz.clzName}Convert.class);

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
    ${clz.clzName} fromInput(Save${clz.clzName}Input input);

    /**
     * DTO -> Model
     *
     * @param dto DTO
     * @return model
     */
    ${clz.clzName} fromDTOToModel(${clz.clzName}DTO dto);

    /**
     * DTO -> VO
     *
     * @param dto DTO
     * @return VO
     */
    ${clz.clzName}VO fromDTOToVo(${clz.clzName}DTO dto);

    /**
     * Input -> DTO
     *
     * @param input input
     * @return DTO
     */
    ${clz.clzName}DTO fromInputToDTO(Save${clz.clzName}Input input);

}
