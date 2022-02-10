package dao;

import com.baomidou.mybatisplus.extension.service.IService;
import com.seaboxdata.commons.query.PaginationResult;
import org.jetbrains.annotations.NotNull;

import java.util.List;

/**
 * @Desc MyBatis DAO实用方法 for ${clz.clzName}
 * @Author ${author}
 * @Date ${create}
 */
public interface I${clz.clzName}DAO extends IService<${clz.clzName}> {

    /**
    * 通过Id与租户Id进行查找
    *
    * @param id       类目ID
    * @param appId    应用ID
    * @param tenantId 租户ID
    * @return 查找类型
    */
    ${clz.clzName} findByIdAndAppIdTenantId(@NotNull Long id, @NotNull Long appId, @NotNull Long tenantId);

    /**
    * 通过编号批量删除 开发时应用需求分类表
    *
    * @param ${clz.clzName?uncap_first}  id列表
    * @param appId                       应用Id
    * @param tenantId                    当前租户
    * @return 删除的Id列表
    */
    List<${clz.clzName}> findInIdsByAppIdTenantId(@NotNull List<Long> ${clz.clzName?uncap_first}IdList, @NotNull Long appId, @NotNull Long tenantId);

            /**
             * 查询列表
             *
             * @param appId    应用ID
             * @param tenantId 租户ID
             * @return 列表结果
             */
            List<${clz.clzName}> findListByAppIdTenantId(@NotNull Long appId, @NotNull Long tenantId);

            /**
             * page开发时应用需求分类表
             *
             * @param input    搜索条件
             * @param userId   用户id
             * @param tenantId 租户Id
             * @return 搜索结果
             */
            PaginationResult<${clz.clzName}DTO> page${clz.clzName}(@NotNull Page${clz.clzName}Input input,
                                                                   @NotNull Long userId, @NotNull Long tenantId);
}