package com.seaboxdata.drd2.resolver.biz;

import com.coxautodev.graphql.tools.GraphQLMutationResolver;
import com.coxautodev.graphql.tools.GraphQLQueryResolver;
import com.seaboxdata.drd2.api.controller.IBizCtl;
import com.seaboxdata.drd2.api.dto.biz.*;
import com.seaboxdata.drd2.api.dto.page.PaginationResult;
import com.seaboxdata.drd2.api.input.biz.*;
import com.seaboxdata.drd2.vo.biz.*;
import com.seaboxdata.drd2.vo.biz.mapstruct.*;
import com.seaboxdata.drd2.vo.biz.output.FindBizListOutput;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Objects;

/** 业务事项 */
@Component
public class BizResolver implements GraphQLQueryResolver, GraphQLMutationResolver {

private IBizCtl bizCtl;

public BizResolver(IBizCtl bizCtl) {
this.bizCtl = bizCtl;
}

/** 通过业务事项ID获取业务事项 */
BizVO findBizById(Long id) {
BizDTO bizDTO = bizCtl.findBizById(id);
return Objects.nonNull(bizDTO) ? BizVOMapStruct.INSTANCE.fromDTO(bizDTO) : BizVO.empty();
}

/** 通过组织ID获取业务事项列表 */
FindBizListOutput findBizList(FindBizListInput input) {
input = Objects.nonNull(input) ? input : FindBizListInput.empty();
PaginationResult<BizDTO> output = bizCtl.findBizList(input);
    return FindBizListOutput.fromDTO(output);
    }

    /**  --- 业务事项主体 --- */
    /** 添加或更新业务事项(主体)(周边通过其它add方法添加) */
    BizVO addUpdateBiz(BizInput input) {
    BizDTO bizDTO = bizCtl.addUpdateBiz(input);
    return Objects.nonNull(bizDTO) ? BizVOMapStruct.INSTANCE.fromDTO(bizDTO) : BizVO.empty();
    }

    /** 删除业务事项(主体+周边) */
    List<Long> delBiz(List<Long> bizIdList) {
            return bizCtl.delBizByIdList(bizIdList);
            }

            /** --- 业务事项-设立依据 --- */
            BizAccordLawVO addUpdateBizAccordLaw(BizAccordLawInput input) {
            BizAccordLawDTO bizAccordLawDTO = bizCtl.addUpdateBizAccordLaw(input);
            return Objects.nonNull(bizAccordLawDTO) ? BizAccordLawVOMapStruct.INSTANCE.fromDTO(bizAccordLawDTO) : BizAccordLawVO.empty();
            }

            List<Long> delBizAccordLaw(List<Long> bizAccordLawIdList) {
                    return bizCtl.delBizAccordLaw(bizAccordLawIdList);
                    }

                    /** --- 业务事项-申报材料 --- */
                    BizDeclaredFileVO addUpdateBizDeclaredFile(BizDeclaredFileInput input) {
                    BizDeclaredFileDTO bizDeclaredFileDTO = bizCtl.addUpdateBizDeclaredFile(input);
                    return Objects.nonNull(bizDeclaredFileDTO) ? BizDeclaredFileVOMapStruct.INSTANCE.fromDTO(bizDeclaredFileDTO) : BizDeclaredFileVO.empty();
                    }

                    public List<Long> delBizDeclaredFile(List<Long> bizDeclaredFileIdList) {
                            return bizCtl.delBizDeclaredFile(bizDeclaredFileIdList);
                            }

                            /** --- 业务事项-常见问题 --- */
                            BizFaqVO addUpdateBizFaq(BizFaqInput input) {
                            BizFaqDTO bizFaqDTO = bizCtl.addUpdateBizFaq(input);
                            return Objects.nonNull(bizFaqDTO) ? BizFaqVOMapStruct.INSTANCE.fromDTO(bizFaqDTO) : BizFaqVO.empty();
                            }

                            List<Long> delBizFaq(List<Long> bizFaqIdList) {
                                    return bizCtl.delBizFaq(bizFaqIdList);
                                    }

                                    /** --- 业务事项-办理流程 --- */

                                    BizProcessFlowVO addUpdateBizProcessFlow(BizProcessFlowInput input) {
                                    BizProcessFlowDTO bizProcessFlowDTO = bizCtl.addUpdateBizProcessFlow(input);
                                    return Objects.nonNull(bizProcessFlowDTO) ? BizProcessFlowVOMapStruct.INSTANCE.fromDTO(bizProcessFlowDTO) : BizProcessFlowVO.empty();
                                    }

                                    List<Long> delBizProcessFlow(List<Long> bizProcessFlowIdList) {
                                            return bizCtl.delBizProcessFlow(bizProcessFlowIdList);
                                            }
                                            }
