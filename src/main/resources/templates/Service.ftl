package service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.user.model.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
 * ${clz.clzName} 服务实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Slf4j
@Service
public class ${clz.clzName}Service implements I${clz.clzName}Service {

    private ${clz.clzName}DAO ${clz.clzName?uncap_first}DAO;
    private ${clz.clzName}Mapper ${clz.clzName?uncap_first}Mapper;

    public ${clz.clzName}Service(${clz.clzName}DAO ${clz.clzName?uncap_first}DAO, ${clz.clzName}Mapper ${clz.clzName?uncap_first}Mapper) {
        this.${clz.clzName?uncap_first}DAO = ${clz.clzName?uncap_first}DAO;
        this.${clz.clzName?uncap_first}Mapper = ${clz.clzName?uncap_first}Mapper;
    }

    /**
     * 通过条件查询 ${clz.comment}
     * @param ${clz.clzName?uncap_first}Id 条件
     * @param user 用户
     * @return 查询结果
     */
    @Override
    public ${clz.clzName}DTO find${clz.clzName}ById(Long ${clz.clzName?uncap_first}Id, User user) {
        ${clz.clzName} ${clz.clzName?uncap_first} = ${clz.clzName?uncap_first}DAO.findByIdAndTenantId(${clz.clzName?uncap_first}Id, user.getTenantId());
        notNull(${clz.clzName?uncap_first}, String.format("未找到${clz.clzName},${clz.clzName?uncap_first}Id,{},tenantId,{}", ${clz.clzName?uncap_first}Id, user.getTenantId()));
        return ${clz.clzName}MapStruct.INSTANCE.toDTO(${clz.clzName?uncap_first});
    }

    /**
     * 通过条件查询 ${clz.comment}
     * @param input 条件
     * @param user 用户
     * @return 查询结果
     */
    @Override
    public PaginationResult<${clz.clzName}DTO> find${clz.clzName}List(Find${clz.clzName}ListInput input, User user) {
        input.trim();
        LambdaQueryWrapper<${clz.clzName}> query = new LambdaQueryWrapper<${clz.clzName}>()
                .eq(${clz.clzName}::getIsDel, false)
                .eq(${clz.clzName}::getTenantId, user.getTenantId())
                .eq(${clz.clzName}::getOrgId, input.getOrgId())
                .orderByDesc(${clz.clzName}::getCreateTm);
        IPage<${clz.clzName}> page = ${clz.clzName?uncap_first}Mapper.selectPage(new Page<>(input.getPageNum(), input.getSize()), query);
        if (Objects.nonNull(page)) {
            PaginationResult<${clz.clzName}DTO> result = new PaginationResult<>();
            result
                    .setTotal((int) page.getTotal())
                    .setPageNum(input.getPageNum())
                    .setLimit((int) page.getSize())
                    .setData(page.getRecords().stream().map(${clz.clzName}MapStruct.INSTANCE::toDTO).collect(toList()));
            return result;
        } else {
            return new PaginationResult<>(0, input.getPageNum(), input.getSize(), Collections.emptyList());
        }
    }

    /**
     * 添加或更新 ${clz.comment}
     * @param input 要添加或更新的对象
     * @param user 用户
     * @return 添加或更新后的对象
     */
    @Override
    public ${clz.clzName}DTO addUpdate${clz.clzName}(${clz.clzName}Input input, User user) {
    ${clz.clzName} ${clz.clzName?uncap_first} =${clz.clzName}MapStruct.INSTANCE.fromInput(input);
        if (${clz.clzName?uncap_first}.isNew()){
        ${clz.clzName?uncap_first} =
            ${clz.clzName?uncap_first}DAO.create${clz.clzName}(${clz.clzName?uncap_first}, LocalDateTime.now(), user.getTenantId(), user.getId());
        } else{
            ${clz.clzName?uncap_first}DAO.update${clz.clzName}(${clz.clzName?uncap_first}, LocalDateTime.now(), user.getTenantId(), user.getId());
        }
        return ${clz.clzName}MapStruct.INSTANCE.toDTO(${clz.clzName?uncap_first});
    }

    /**
     * 批量删除 ${clz.comment}
     * @param ${clz.clzName?uncap_first}IdList 要删除的Id列表
     * @param user 用户
     * @return 成功删除的Id列表
     */
    @Override
    public List<Long> del${clz.clzName}ByIdList(List<Long> ${clz.clzName?uncap_first}IdList, User user) {
        List<${clz.clzName}> exist${clz.clzName}List = ${clz.clzName?uncap_first}Mapper.selectList(new LambdaQueryWrapper<${clz.clzName}>()
                .eq(${clz.clzName}::getTenantId, user.getTenantId())
                .in(${clz.clzName}::getId, ${clz.clzName?uncap_first}IdList)
        );
        List<Long> del${clz.clzName}IdList = exist${clz.clzName}List.stream().map(d -> {
            d.setIsDel(true);
            ${clz.clzName?uncap_first}Mapper.updateById(d);
            return d.getId();
        }).collect(toList());
        return del${clz.clzName}IdList;
    }
}
