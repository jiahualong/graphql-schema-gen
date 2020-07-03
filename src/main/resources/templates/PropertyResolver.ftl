package com.seaboxdata.drd2.resolver.biz;

import com.coxautodev.graphql.tools.GraphQLResolver;
import com.seaboxdata.drd2.api.controller.IBizCtl;
import com.seaboxdata.drd2.api.dto.biz.BizAccordLawDTO;
import com.seaboxdata.drd2.api.dto.biz.BizDeclaredFileDTO;
import com.seaboxdata.drd2.api.dto.biz.BizFaqDTO;
import com.seaboxdata.drd2.api.dto.biz.BizProcessFlowDTO;
import com.seaboxdata.drd2.vo.biz.*;
import com.seaboxdata.drd2.vo.biz.mapstruct.BizAccordLawVOMapStruct;
import com.seaboxdata.drd2.vo.biz.mapstruct.BizDeclaredFileVOMapStruct;
import com.seaboxdata.drd2.vo.biz.mapstruct.BizFaqVOMapStruct;
import com.seaboxdata.drd2.vo.biz.mapstruct.BizProcessFlowVOMapStruct;
import com.seaboxdata.drd2.vo.info.CollectInfoVO;
import com.seaboxdata.drd2.vo.info.ScoreInfoVO;
import com.seaboxdata.drd2.vo.res.ResVO;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/** 业务事项Property */
@Component
public class BizPropertyResolver implements GraphQLResolver<BizVO> {

    private IBizCtl bizCtl;

    public BizPropertyResolver(IBizCtl bizCtl) {
    this.bizCtl = bizCtl;
    }

    /** 业务事项-设立依据 */
    List<BizAccordLawVO> bizAccordLawList(BizVO bizVO) {
        List<BizAccordLawDTO> data = bizCtl.findBizAccordLawList(bizVO.getId());
            if (Objects.nonNull(data)) {
            return data.stream().map(BizAccordLawVOMapStruct.INSTANCE::fromDTO).collect(toList());
            } else {
            return Collections.emptyList();
            }
            }

            /** 业务事项-申报材料 */
            List<BizDeclaredFileVO> bizDeclaredFileList(BizVO bizVO) {
                List<BizDeclaredFileDTO> data = bizCtl.findBizDeclaredFileList(bizVO.getId());
                    if (Objects.nonNull(data)) {
                    return data.stream().map(BizDeclaredFileVOMapStruct.INSTANCE::fromDTO).collect(toList());
                    } else {
                    return Collections.emptyList();
                    }
                    }

                    /** 业务事项-常见问题 */
                    List<BizFaqVO> bizFaqList(BizVO bizVO) {
                        List<BizFaqDTO> data = bizCtl.findBizFaqList(bizVO.getId());
                            if (Objects.nonNull(data)) {
                            return data.stream().map(BizFaqVOMapStruct.INSTANCE::fromDTO).collect(toList());
                            } else {
                            return Collections.emptyList();
                            }
                            }

                            /** 业务事项-办理流程 */
                            List<BizProcessFlowVO> bizProcessFlowList(BizVO bizVO) {
                                List<BizProcessFlowDTO> data = bizCtl.findBizProcessFlowList(bizVO.getId());
                                    if (Objects.nonNull(data)) {
                                    return data.stream().map(BizProcessFlowVOMapStruct.INSTANCE::fromDTO).collect(toList());
                                    } else {
                                    return Collections.emptyList();
                                    }
                                    }

                                    /** 收藏及订阅信息 */
                                    CollectInfoVO collectInfo(BizVO bizVO) {
                                    return CollectInfoVO.builder().isCollect(true).isSubscribe(false).build();
                                    }

                                    /** 评分信息 */
                                    ScoreInfoVO scoreInfo(BizVO bizVO) {
                                    return ScoreInfoVO.builder().star(4).score(90).build();
                                    }

                                    /** 所包含的Res对象 */
                                    List<ResVO> resList(BizVO bizVO) {
                                        return Collections.emptyList();
                                        }

                                        /** 有无子项 */
                                        Boolean isHaveSubject(BizVO bizVO) {
                                        return false;
                                        }
                                        }
