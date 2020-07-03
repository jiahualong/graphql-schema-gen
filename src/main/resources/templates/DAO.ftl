package dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.seaboxdata.drd2.${clz.clzName?uncap_first}.dao.mapper.${clz.clzName}Mapper;
import com.seaboxdata.drd2.${clz.clzName?uncap_first}.model.${clz.clzName};
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Objects;

/**
 * ${clz.clzName} DAO 数据库对象
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Component
public class ${clz.clzName}DAO {

    private ${clz.clzName}Mapper ${clz.clzName?uncap_first}Mapper;

    public ${clz.clzName}DAO(${clz.clzName}Mapper ${clz.clzName?uncap_first}Mapper) {
        this.${clz.clzName?uncap_first}Mapper = ${clz.clzName?uncap_first}Mapper;
    }

    /**
    * 通过Id和租户Id搜索
    * @param Id 编号
    * @param tenantId 租户编号
    */
    public ${clz.clzName} selectById(Long ${clz.clzName?uncap_first}Id, Long tenantId) {
    ${clz.clzName} ${clz.clzName?uncap_first} =
        ${clz.clzName?uncap_first}Mapper.selectOne(new LambdaQueryWrapper<${clz.clzName}>()
                .eq(${clz.clzName}::getTenantId, tenantId)
                .eq(${clz.clzName}::getId, ${clz.clzName?uncap_first}Id)
        );
        return ${clz.clzName?uncap_first};
    }

    /**
     * 更新对象
     * @param ${clz.clzName?uncap_first} 要更新的对象
     * @param now 更新时间
     * @param tenantId 租户编号
     * @param userId 用户编号
     */
    public ${clz.clzName} update${clz.clzName}(${clz.clzName} ${clz.clzName?uncap_first}, LocalDateTime now, Long tenantId, Long userId) {
    ${clz.clzName} origin = selectById(${clz.clzName?uncap_first}.getId(), tenantId);
        if (Objects.isNull(origin)) {
            return create${clz.clzName}(${clz.clzName?uncap_first}, now, tenantId, userId);
        }
        origin.setOrgId(${clz.clzName?uncap_first}.getOrgId())
                .setTenantId(origin.getTenantId())
                .setOrderId(${clz.clzName?uncap_first}.getOrderId())
                .setName(${clz.clzName?uncap_first}.getName())
                .setDesc(${clz.clzName?uncap_first}.getDesc())
                .setModifier(userId)
                .setModifyTm(now);
        ${clz.clzName?uncap_first}Mapper.updateById(origin);
        return origin;
    }

    /**
     * 创建对象
     * @param ${clz.clzName?uncap_first}  要创建的对象
     * @param now 创建时间
     * @param tenantId 租户编号
     * @param userId 用户编号
     */
    public ${clz.clzName} create${clz.clzName}(${clz.clzName} ${clz.clzName?uncap_first}, LocalDateTime now, Long tenantId, Long userId) {
        ${clz.clzName?uncap_first}Mapper.insert(${clz.clzName?uncap_first}
                .setTenantId(tenantId)
                .setCreator(userId)
                .setModifier(userId)
                .setCreateTm(now)
                .setModifyTm(now)
                .setIsDel(false)
        );
        return ${clz.clzName?uncap_first};
    }
}
