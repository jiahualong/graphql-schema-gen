package dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.seaboxdata.commons.query.PaginationResult;
import org.jetbrains.annotations.NotNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Desc MyBatis DAO实用方法 for ${clz.clzName}
 * @Author ${author}
 * @Date ${create}
 */
@Slf4j
@Component
public class ${clz.clzName}MppDaoImpl extends MppServiceImpl<${clz.clzName}MppMapper, ${clz.clzName}>
        implements I${clz.clzName}MppDao {
}