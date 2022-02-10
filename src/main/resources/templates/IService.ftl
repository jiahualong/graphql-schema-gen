package service;

import com.seaboxdata.commons.query.PaginationResult;
import org.jetbrains.annotations.NotNull;

import java.util.List;

/**
 * @Desc ${clz.comment}}服务接口
 * @Author ${author}
 * @Date ${create}
 */
public interface I${clz.clzName}Service {

    /**
     * 通过ID查询 ${clz.comment}记录
     *
     * @param id       ID
     * @param appId    应用ID
     * @param userId   用户信息
     * @param tenantId 租户信息
     * @return 查询结果
     */
    ${clz.clzName}DTO get${clz.clzName}ById(@NotNull Long id, @NotNull Long appId, @NotNull Long userId, @NotNull Long tenantId);

    /**
     * list查询${clz.comment}记录
     *
     * @param appId    应用id
     * @param userId   用户id
     * @param tenantId 租户iD
     * @return 查询结果
     */
    List<${clz.clzName}DTO> list${clz.clzName}(@NotNull Long appId, @NotNull Long userId, @NotNull Long tenantId);

    /**
     * page分页查询${clz.comment}记录
     *
     * @param input    搜索条件
     * @param userId   用户id
     * @param tenantId 租户Id
     * @return 搜索结果
     */
    PaginationResult<${clz.clzName}DTO> page${clz.clzName}(@NotNull Page${clz.clzName}Input input, @NotNull Long userId, @NotNull Long tenantId);

    /**
     * 更新或添加 ${clz.comment}记录
     *
     * @param dto      即将操作的DTO实体
     * @param userId   用户
     * @param tenantId 租户ID
     * @return 处理后的对象
     */
    ${clz.clzName}DTO save(@NotNull ${clz.clzName}DTO dto, @NotNull Long userId, @NotNull Long tenantId);

    /**
     * 通过编号批量删除${clz.comment}记录
     *
     * @param ${clz.clzName?uncap_first}IdList id列表
     * @param appId                       应用id
     * @param userId                      当前用户
     * @param tenantId                    当前租户
     * @return 删除的Id列表
     */
    List<Long> delete${clz.clzName}ByIds(@NotNull List<Long> ${clz.clzName?uncap_first}IdList, @NotNull Long appId, @NotNull Long userId, @NotNull Long tenantId);
}