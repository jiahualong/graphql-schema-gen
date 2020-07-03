package ctl;

import com.seaboxdata.drd2.api.controller.I${clz.clzName}Ctl;
import com.seaboxdata.drd2.api.dto.${clz.clzName}.${clz.clzName}DTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.${clz.clzName}.${clz.clzName}Input;
import com.seaboxdata.drd2.api.input.${clz.clzName}.Find${clz.clzName}ListInput;
import com.seaboxdata.drd2.${clz.clzName}.service.I${clz.clzName}Service;
import com.seaboxdata.drd2.${clz.clzName}.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * ${clz.clzName} API接口实现类
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Slf4j
@RestController
public class ${clz.clzName}Ctl implements I${clz.clzName}Ctl {

    private I${clz.clzName}Service ${clz.clzName?uncap_first}Service;
    private IUserService userService;

    public ${clz.clzName}Ctl(I${clz.clzName}Service ${clz.clzName?uncap_first}Service, IUserService userService) {
        this.${clz.clzName?uncap_first}Service = ${clz.clzName?uncap_first}Service;
        this.userService = userService;
    }

    /**
     * 通过条件查询 ${clz.comment}
     * @param input 查询条件
     * @return  查询结果
     */
    @Override
    public PaginationResult<${clz.clzName}DTO> find${clz.clzName}List(Find${clz.clzName}ListInput input) {
        return ${clz.clzName?uncap_first}Service.find${clz.clzName}List(input, userService.getUser());
    }

    /**
     * 添加或更新 ${clz.comment}
     * @param input 要添加或更新的实体
     * @return 添加或更新后的实体
     */
    @Override
    public ${clz.clzName}DTO addUpdate${clz.clzName}(${clz.clzName}Input input) {
        return ${clz.clzName?uncap_first}Service.addUpdate${clz.clzName}(input, userService.getUser());
    }

    /**
     * 批量删除 ${clz.comment}
     * @param IdList  要删除的Id
     * @return  删除成功的Id
     */
    @Override
    public List<Long> del${clz.clzName}ByIdList(List<Long> ${clz.clzName?uncap_first}IdList) {
        return ${clz.clzName?uncap_first}Service.del${clz.clzName}ByIdList(${clz.clzName?uncap_first}IdList, userService.getUser());
    }
}
