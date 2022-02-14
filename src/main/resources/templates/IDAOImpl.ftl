package dao.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.seaboxdata.commons.query.PaginationResult;
import org.apache.commons.lang3.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.lang.Boolean.FALSE;
import static java.lang.Boolean.TRUE;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

/**
 * @Desc MyBatis DAO实用方法实现类 for ${clz.clzName}
 * @Author hualong.jia
 * @Date ${create}
 */
@Component
public class ${clz.clzName}DAOImpl extends ServiceImpl<${clz.clzName}Mapper, ${clz.clzName}> implements I${clz.clzName}DAO {

    private final ${clz.clzName}Mapper ${clz.clzName?uncap_first}Mapper;

    public ${clz.clzName}DAOImpl(${clz.clzName}Mapper ${clz.clzName?uncap_first}Mapper) {
        this.${clz.clzName?uncap_first}Mapper = ${clz.clzName?uncap_first}Mapper;
    }

    /**
     * 通过Id与租户Id进行查找
     *
     * @param id       类目ID
     * @param appId    应用ID
     * @param tenantId 租户ID
     * @return 类目
     */
    @Override
    public ${clz.clzName} findByIdAndAppIdTenantId(@NotNull Long id, @NotNull Long appId, @NotNull Long tenantId) {
    LambdaQueryWrapper<${clz.clzName}> query = new LambdaQueryWrapper<${clz.clzName}>()
            .eq(${clz.clzName}::getId, id)
            .eq(${clz.clzName}::getAppId, appId)
            .eq(${clz.clzName}::getTenantId, tenantId)
            .eq(${clz.clzName}::getIfDelete, 0);
        return ${clz.clzName?uncap_first}Mapper.selectOne(query);
    }

    /**
     * 通过编号批量删除
     *
     * @param ${clz.clzName?uncap_first}IdList id列表
     * @param appId                       应用id
     * @param tenantId                    当前租户
     * @return 删除的Id列表
     */
    @Override
    public List<${clz.clzName}> findInIdsByAppIdTenantId(@NotNull List<Long> ${clz.clzName?uncap_first}IdList, @NotNull Long appId, @NotNull Long tenantId) {
        ${clz.clzName?uncap_first}IdList = ${clz.clzName?uncap_first}IdList.stream().distinct().collect(toList());
        if (TRUE.equals(CollectionUtils.isEmpty(${clz.clzName?uncap_first}IdList))) {
            return Collections.emptyList();
        }
        return ${clz.clzName?uncap_first}Mapper.selectList(new LambdaQueryWrapper<${clz.clzName}>()
            .eq(${clz.clzName}::getTenantId, tenantId)
            .eq(${clz.clzName}::getAppId, appId)
            .in(${clz.clzName}::getCategoryId, ${clz.clzName?uncap_first}IdList)
            .eq(${clz.clzName}::getIfDelete, 0)
        );
    }

    /**
     * 查询列表 开发时应用需求分类表
     *
     * @param appId    应用id
     * @param tenantId 租户iD
     * @return 列表结果
     */
    @Override
    public List<${clz.clzName}> findListByAppIdTenantId(@NotNull Long appId, @NotNull Long tenantId) {
        return ${clz.clzName?uncap_first}Mapper.selectList(new LambdaQueryWrapper<${clz.clzName}>()
            .eq(${clz.clzName}::getTenantId, tenantId)
            .eq(${clz.clzName}::getIfDelete, 0));
    }

    /**
     * page开发时应用需求分类表
     *
     * @param input    搜索条件
     * @param userId   用户id
     * @param tenantId 租户Id
     * @return 搜索结果
     */
    @Override
    public PaginationResult<${clz.clzName}DTO> page${clz.clzName}(@NotNull Page${clz.clzName}Input input,
                                                                  @NotNull Long userId, @NotNull Long tenantId) {
        LambdaQueryWrapper<${clz.clzName}> condition = new LambdaQueryWrapper<${clz.clzName}>()
                .eq(${clz.clzName}::getTenantId, tenantId)
                .eq(${clz.clzName}::getAppId, input.getAppId());

        if (StringUtils.isNotBlank(input.getKeyWord())) {
            condition.like(${clz.clzName}::getCategoryName, input.getKeyWord());
        }
        if (Objects.nonNull(input.getLastOperateBeginTime())) {
            condition.ge(${clz.clzName}::getModifyTm, input.getLastOperateBeginTime());
        }
        if (Objects.nonNull(input.getLastOperateEndTime())) {
            condition.le(${clz.clzName}::getModifyTm, input.getLastOperateEndTime());
        }
        if (FALSE.equals(CollectionUtils.isEmpty(input.getOrderBy()))) {
            String orderByCondition = input.getOrderBy().stream().map(i -> i.getField() + " " + i.getOrder()).collect(joining(","));
            condition.last(" ORDER BY " + orderByCondition);
        }

        IPage<${clz.clzName}> page = ${clz.clzName?uncap_first}Mapper.selectPage(new Page<>(1L + (input.getOffset() / input.getLimit()), input.getLimit()), condition);
        PaginationResult<${clz.clzName}DTO> result = new PaginationResult<>();
        result.setData(page.getRecords().stream().map(${clz.clzName}Convert.INSTANCE::toDTO).collect(toList()));
        result.setLimit(input.getLimit());
        result.setOffset(input.getOffset());
        result.setTotal((int) page.getTotal());
        return result;
    }
}