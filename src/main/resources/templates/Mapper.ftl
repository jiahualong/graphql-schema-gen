package dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.seaboxdata.drd2.${clz.clzName?uncap_first}.model.${clz.clzName};
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * ${clz.clzName} Mapper实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Repository
@Mapper
public interface ${clz.clzName}Mapper extends BaseMapper<${clz.clzName}> {
}
