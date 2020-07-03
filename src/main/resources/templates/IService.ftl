package service;

import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}DTO;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.${clz.clzName?uncap_first}.${clz.clzName}Input;
import com.seaboxdata.drd2.api.input.${clz.clzName?uncap_first}.Find${clz.clzName}ListInput;
import com.seaboxdata.drd2.user.model.User;

import java.util.List;

/**
 * ${clz.clzName} 服务接口
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
public interface I${clz.clzName}Service {

    /**
     * 通过条件查询 ${clz.comment}
     * @param input 条件
     * @param user 用户
     * @return 查询结果
     */
    PaginationResult<${clz.clzName}DTO> find${clz.clzName}List(Find${clz.clzName}ListInput input, User user);

    /**
     * 添加或更新 ${clz.comment}
     * @param input 要添加或更新的对象
     * @param user 用户
     * @return  添加或更新后的对象
     */
    ${clz.clzName}DTO addUpdate${clz.clzName}(${clz.clzName}Input input, User user);

    /**
     * 批量删除 ${clz.comment}
     * @param IdList 要删除的Id列表
     * @param user 用户
     * @return 成功删除的Id列表
     */
    List<Long> del${clz.clzName}ByIdList(List<Long> ${clz.clzName?uncap_first}IdList, User user);

}
