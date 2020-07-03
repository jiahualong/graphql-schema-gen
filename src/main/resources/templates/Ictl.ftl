package api.controller;

import com.seaboxdata.drd2.api.config.FeignClientConfig;
import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}DTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.${clz.clzName?uncap_first}.${clz.clzName}Input;
import com.seaboxdata.drd2.api.input.${clz.clzName?uncap_first}.Find${clz.clzName}ListInput;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.FeignClientsConfiguration;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * ${clz.clzName} API接口
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@FeignClient(contextId = "Drd2${clz.clzName}",
        url = FeignClientConfig.URL,
        name = FeignClientConfig.NAME,
        configuration = FeignClientsConfiguration.class)
public interface I${clz.clzName}Ctl {

    /**
     * 通过条件查询 ${clz.comment}
     * @param input 查询条件
     * @return  查询结果
     */
    @PostMapping("/${clz.clzName?uncap_first}ctl/find${clz.clzName}List")
    PaginationResult<${clz.clzName}DTO> find${clz.clzName}List(@RequestBody Find${clz.clzName}ListInput input);

    /**
     * 通过Id查询 ${clz.comment}
     * @param ${clz.clzName?uncap_first}Id 编号
     * @return 查询结果
     */
    @PostMapping("/${clz.clzName?uncap_first}Ctl/find${clz.clzName}ById")
    BizDTO findBizById(@RequestParam("${clz.clzName?uncap_first}Id") Long ${clz.clzName?uncap_first}Id);

    /**
     * 添加或更新 ${clz.comment}
     * @param input 要添加或更新的实体
     * @return 添加或更新后的实体
     */
    @PostMapping("/${clz.clzName?uncap_first}ctl/addUpdate${clz.clzName}")
    ${clz.clzName}DTO addUpdate${clz.clzName}(@RequestBody ${clz.clzName}Input input);

    /**
     * 批量删除 ${clz.comment}
     * @param ${clz.clzName?uncap_first}IdList  要删除的Id
     * @return  删除成功的Id
     */
    @DeleteMapping("/${clz.clzName?uncap_first}ctl/del${clz.clzName}ByIdList")
    List<Long> del${clz.clzName}ByIdList(@RequestParam("${clz.clzName?uncap_first}IdList") List<Long> ${clz.clzName?uncap_first}IdList);

}
