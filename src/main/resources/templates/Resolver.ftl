package resolver;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import com.seaboxdata.authentication.api.vo.OauthLoginUserVO;
import com.seaboxdata.commons.exception.ServiceException;
import com.seaboxdata.commons.query.PaginationResult;
import com.seaboxdata.haida.comm.response.ResultList;
import com.seaboxdata.haida.comm.response.ResultPage;
import com.seaboxdata.haida.comm.response.PaginationResultHelper;
import com.seaboxdata.haida.comm.response.Result;
import com.seaboxdata.haida.comm.utils.UserInfoUtil;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
 * @Desc ${clz.clzName} GraphQL 实现
 * @Author ${author}
 * @Date ${create}
 */
@Slf4j
@Service
public class ${clz.clzName}Resolver implements GraphQLQueryResolver, GraphQLMutationResolver {
    private final I${clz.clzName}Service ${clz.clzName?uncap_first}Service;

    public ${clz.clzName}Resolver(I${clz.clzName}Service ${clz.clzName?uncap_first}Service) {
        this.${clz.clzName?uncap_first}Service = ${clz.clzName?uncap_first}Service;
    }

    /**
     * 通过ID查询 ${clz.comment}记录
     *
     * @param appId 当前应用ID
     * @param id    ID
     * @return ${clz.comment}记录
     */
    Result<${clz.clzName}VO> get${clz.clzName}ById(@NotNull Long id, @NotNull Long appId) {
        try {
            OauthLoginUserVO loginUser = UserInfoUtil.getLoginUser();
            if (Objects.isNull(loginUser)) {
                return Result.tokenError();
            }
            ${clz.clzName}DTO dto = ${clz.clzName?uncap_first}Service.get${clz.clzName}ById(id, appId, loginUser.getUserId(), loginUser.getTenantId());
            return Objects.nonNull(dto)
                    ? Result.success(${clz.clzName}Convert.INSTANCE.fromDTOToVO(dto))
                    : Result.error("查询失败");
        } catch (ServiceException se) {
            return Result.error(se.getMessage());
        } catch (Exception e) {
            return Result.programError(e.getMessage());
        }
    }

    /**
    * list获取一组${clz.comment}记录
    *
    * @param appId 应用ID
    * @return 分类树列表
    */
    public ResultList<${clz.clzName}VO> list${clz.clzName}(@NotNull Long appId) {
        try {
            OauthLoginUserVO loginUser = UserInfoUtil.getLoginUser();
                if (Objects.isNull(loginUser)) {
                    return ResultList.tokenError();
                }
        List<${clz.clzName}DTO> dtoList = ${clz.clzName?uncap_first}Service.list${clz.clzName}(appId, loginUser.getUserId(), loginUser.getTenantId());
            return Objects.nonNull(dtoList)
                    ? ResultList.success(dtoList.stream().map(${clz.clzName}Convert.INSTANCE::fromDTOToVo).collect(toList()))
                    : ResultList.error("查询失败");
        } catch (ServiceException se) {
            return ResultList.error(se.getMessage());
        } catch (Exception e) {
            return ResultList.programError(e.getMessage());
        }
    }

    /**
     * page分页查询${clz.comment}记录
     *
     * @param input 搜索条件
     * @return 搜索结果
     */
     public ResultPage<${clz.clzName}VO> page${clz.clzName}(@NotNull Page${clz.clzName}Input input) {
        try {
            OauthLoginUserVO loginUser = UserInfoUtil.getLoginUser();
            if (Objects.isNull(loginUser)) {
                return ResultPage.tokenError();
            }
            //获取查询结果
            PaginationResult<${clz.clzName}DTO> result = ${clz.clzName?uncap_first}Service.page${clz.clzName}(input, loginUser.getUserId(), loginUser.getTenantId());
            //查询结果转为VO对象并返回
            return ResultPage.success(PaginationResultHelper.pageDTOToVO(result, result.getData().stream().map(${clz.clzName}Convert.INSTANCE::fromDTOToVo).collect(toList())));
        } catch (ServiceException se) {
            return ResultPage.error(se.getMessage());
        } catch (Exception e) {
            return ResultPage.programError(e.getMessage());
        }
    }

    /**
     * 添加或更新${clz.comment}记录
     *
     * @param input ${clz.comment}Input
     * @return ID
     */
     Result<Long> save${clz.clzName}(@NotNull Save${clz.clzName}Input input) {
        try {
            OauthLoginUserVO loginUser = UserInfoUtil.getLoginUser();
            if (Objects.isNull(loginUser)) {
                return Result.tokenError();
            }
            ${clz.clzName}DTO dto = ${clz.clzName?uncap_first}Service.save(${clz.clzName}Convert.INSTANCE.fromInputToDTO(input), loginUser.getUserId(), loginUser.getTenantId());
            return Objects.nonNull(dto)
                    ? Result.success(dto.getId())
                    : Result.error("保存失败");
        } catch (ServiceException se) {
            return Result.error(se.getMessage());
        } catch (Exception e) {
            return Result.programError(e.getMessage());
        }
    }

    /**
     * 通过编号批量删除${clz.comment}记录
     *
     * @param ${clz.clzName?uncap_first}IdList ID列表
     * @param appId                       应用id
     * @return 成功删除的id列表
     */
    ResultList<Long> delete${clz.clzName}ByIds(@NotNull List<Long> ${clz.clzName?uncap_first}IdList, @NotNull Long appId) {
        try {
            OauthLoginUserVO loginUser = UserInfoUtil.getLoginUser();
        if (Objects.isNull(loginUser)) {
            return ResultList.tokenError();
        }
        List<Long> idList = ${clz.clzName?uncap_first}Service.delete${clz.clzName}ByIds(${clz.clzName?uncap_first}IdList, appId, loginUser.getUserId(), loginUser.getTenantId());
        return Objects.nonNull(idList)
                ? ResultList.success(idList)
                : ResultList.error("删除失败");
        } catch (ServiceException se) {
            return ResultList.error(se.getMessage());
        } catch (Exception e) {
            return ResultList.programError(e.getMessage());
        }
    }
}