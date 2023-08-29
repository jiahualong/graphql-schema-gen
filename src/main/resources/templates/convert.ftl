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
     * Upload -> Draft
     *
     * @param from Upload
     * @return Draft
     */
     ${clz.clzName}Draft toDraft(${clz.clzName} from);
}
