package resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import com.seaboxdata.drd2.api.controller.I${clz.clzName}Ctl;
import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.*;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.${clz.clzName?uncap_first}.*;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.*;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.mapstruct.*;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.output.Find${clz.clzName}ListOutput;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

/**
 * ${clz.clzName} GraphQL 实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Component
public class ${clz.clzName}Resolver implements GraphQLQueryResolver, GraphQLMutationResolver {

    private I${clz.clzName}Ctl ${clz.clzName?uncap_first}Ctl;

    public ${clz.clzName}Resolver(I${clz.clzName}Ctl ${clz.clzName?uncap_first}Ctl) {
        this.${clz.clzName?uncap_first}Ctl = ${clz.clzName?uncap_first}Ctl;
    }

    /**
     * 通过编号查询 ${clz.comment}
     * @param id 编号
     * @return 查询结果
     */
    ${clz.clzName}VO find${clz.clzName}ById(Long id) {
        ${clz.clzName}DTO ${clz.clzName?uncap_first}DTO = ${clz.clzName?uncap_first}Ctl.find${clz.clzName}ById(id);
        return Objects.nonNull(${clz.clzName?uncap_first}DTO) ? ${clz.clzName}VOMapStruct.INSTANCE.fromDTO(${clz.clzName?uncap_first}DTO) : ${clz.clzName}VO.empty();
    }

    /**
     * 通过条件查询 ${clz.comment}
     * @param input 查询条件
     * @return 查询结果
     */
    Find${clz.clzName}ListOutput find${clz.clzName}List(Find${clz.clzName}ListInput input) {
        input = Objects.nonNull(input) ? input : Find${clz.clzName}ListInput.empty();
        PaginationResult<${clz.clzName}DTO> output = ${clz.clzName?uncap_first}Ctl.find${clz.clzName}List(input);
        return Find${clz.clzName}ListOutput.fromDTO(output);
    }

    /**
     * 添加或更新 ${clz.comment}
     * @param input 要添加或更新的对象
     * @return 查询结果
     */
    ${clz.clzName}VO addUpdate${clz.clzName}(${clz.clzName}Input input) {
        ${clz.clzName}DTO ${clz.clzName?uncap_first}DTO = ${clz.clzName?uncap_first}Ctl.addUpdate${clz.clzName}(input);
        return Objects.nonNull(${clz.clzName?uncap_first}DTO) ? ${clz.clzName}VOMapStruct.INSTANCE.fromDTO(${clz.clzName?uncap_first}DTO) : ${clz.clzName}VO.empty();
    }

    /**
     * 通过编号批量删除 ${clz.comment}
     * @param ${clz.clzName?uncap_first}IdList 编号列表
     * @return 成功删除的编号列表
     */
    List<Long> del${clz.clzName}(List<Long> ${clz.clzName?uncap_first}IdList) {
        return ${clz.clzName?uncap_first}Ctl.del${clz.clzName}ByIdList(${clz.clzName?uncap_first}IdList);
    }

}
