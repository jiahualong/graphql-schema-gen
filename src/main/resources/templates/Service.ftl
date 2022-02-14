package service.impl;

import com.seaboxdata.commons.id.IdGenerator;
import com.seaboxdata.commons.query.PaginationResult;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.lang.Boolean.TRUE;
import static java.util.stream.Collectors.toList;
import static org.springframework.util.Assert.notNull;

/**
 * @Desc ${clz.comment}}服务实现
 * @Author ${author}
 * @Date ${create}
 */
@Slf4j
@Service
public class ${clz.clzName}ServiceImpl implements I${clz.clzName}Service {

    private final IdGenerator idGenerator;
    private final IDevAppVerifyService devAppVerifyService;
    private final I${clz.clzName}DAO ${clz.clzName?uncap_first}DAO;

    public ${clz.clzName}ServiceImpl(IdGenerator idGenerator,
                                        IDevAppVerifyService devAppVerifyService,
                                        I${clz.clzName}DAO ${clz.clzName?uncap_first}DAO) {
        this.idGenerator = idGenerator;
        this.devAppVerifyService = devAppVerifyService;
        this.${clz.clzName?uncap_first}DAO = ${clz.clzName?uncap_first}DAO;
    }

    /**
     * 通过ID查询 ${clz.comment}记录
     *
     * @param id       ID
     * @param appId    应用ID
     * @param userId   用户信息
     * @param tenantId 租户信息
     * @return 查询结果
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public ${clz.clzName}DTO get${clz.clzName}ById(@NotNull Long id, @NotNull Long appId, @NotNull Long userId, @NotNull Long tenantId) {
        Assert.isTrue(devAppVerifyService.verifyAppId(appId, userId, tenantId), "您无权操纵该APP");
        ${clz.clzName} ${clz.clzName?uncap_first} = ${clz.clzName?uncap_first}DAO.findByIdAndAppIdTenantId(id, appId, tenantId);
        notNull(${clz.clzName?uncap_first}, String.format("未找到开发时应用需求分类表记录%s", id));
        return ${clz.clzName}Convert.INSTANCE.toDTO(${clz.clzName?uncap_first});
    }

    /**
     * list查询${clz.comment}记录
     *
     * @param appId    应用id
     * @param userId   用户id
     * @param tenantId 租户iD
     * @return 查询结果
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<${clz.clzName}DTO> list${clz.clzName}(@NotNull Long appId, @NotNull Long userId, @NotNull Long tenantId) {
        Assert.isTrue(devAppVerifyService.verifyAppId(appId, userId, tenantId), "您无权操纵该APP");
        List<${clz.clzName}> modelList = ${clz.clzName?uncap_first}DAO.findListByAppIdTenantId(appId, tenantId);
        return TRUE.equals(CollectionUtils.isEmpty(modelList))
                ? Collections.emptyList()
                : modelList.stream().map(${clz.clzName}Convert.INSTANCE::toDTO).collect(toList());
    }

    /**
     * page分页查询${clz.comment}记录
     *
     * @param input    搜索条件
     * @param userId   用户id
     * @param tenantId 租户Id
     * @return 搜索结果
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public PaginationResult<${clz.clzName}DTO> page${clz.clzName}(@NotNull Page${clz.clzName}Input input,
                                                                                @NotNull Long userId, @NotNull Long tenantId) {
        Assert.isTrue(devAppVerifyService.verifyAppId(input.getAppId(), userId, tenantId), "您无权操纵该APP");
        PaginationResult<${clz.clzName}DTO> result = ${clz.clzName?uncap_first}DAO.page${clz.clzName}(input, userId, tenantId);
        return result;
    }

    /**
     * 更新或添加 ${clz.comment}记录
     *
     * @param dto      即将操作的DTO实体
     * @param userId   用户
     * @param tenantId 租户ID
     * @return 处理后的对象
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public ${clz.clzName}DTO save(@NotNull ${clz.clzName}DTO dto, @NotNull Long userId, @NotNull Long tenantId) {
        ${clz.clzName} model = ${clz.clzName}Convert.INSTANCE.fromDTOToModel(dto);

        Boolean isNew = model.isNew();
        LocalDateTime now = LocalDateTime.now();
        Assert.isTrue(devAppVerifyService.verifyAppId(dto.getAppId(), userId, tenantId), "您无权操纵该APP");

        if (TRUE.equals(isNew)) {
            model.setId(idGenerator.getId());
            model.setTenantId(tenantId);
            model.setCreator(userId);
            model.setCreateTm(now);
            model.setIfDelete(0);
        } else {
            ${clz.clzName} before= ${clz.clzName?uncap_first}DAO.findByIdAndAppIdTenantId(model.getCategoryId(), model.getAppId(), tenantId);
            notNull(before, "未找到需要更新的信息");
            model.setTenantId(before.getTenantId());
            model.setCreator(before.getCreator());
            model.setCreateTm(before.getCreateTm());
        }
        model.setModifier(userId);
        model.setModifyTm(now);
        ${clz.clzName?uncap_first}DAO.saveOrUpdate(model);

        return ${clz.clzName}Convert.INSTANCE.toDTO(model);
    }

    /**
     * 通过编号批量删除${clz.comment}记录
     *
     * @param ${clz.clzName?uncap_first}IdList id列表
     * @param appId                       应用id
     * @param userId                      当前用户
     * @param tenantId                    当前租户
     * @return 删除的Id列表
     */
    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<Long> delete${clz.clzName}ByIds(@NotNull List<Long> ${clz.clzName?uncap_first}IdList,
                                                       @NotNull Long appId, @NotNull Long userId, @NotNull Long tenantId) {
        Assert.isTrue(devAppVerifyService.verifyAppId(appId, userId, tenantId), "您无权操纵该APP");
        List<${clz.clzName}> exist${clz.clzName}List = ${clz.clzName?uncap_first}DAO
                .findInIdsByAppIdTenantId(${clz.clzName?uncap_first}IdList, appId, tenantId);
        List<Long> delete${clz.clzName}IdList = exist${clz.clzName}List.stream()
                .map(${clz.clzName}::getCategoryId).distinct().collect(toList());
        if (TRUE.equals(CollectionUtils.isEmpty(delete${clz.clzName}IdList))) {
            return Collections.emptyList();
        }
        ${clz.clzName?uncap_first}DAO.removeByIds(delete${clz.clzName}IdList);
        return delete${clz.clzName}IdList;
    }
}
