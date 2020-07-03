package resolver;

import com.coxautodev.graphql.tools.GraphQLResolver;
import com.seaboxdata.drd2.api.controller.I${clz.clzName}Ctl;
import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}AccordLawDTO;
import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}DeclaredFileDTO;
import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}FaqDTO;
import com.seaboxdata.drd2.api.dto.${clz.clzName?uncap_first}.${clz.clzName}ProcessFlowDTO;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.*;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.mapstruct.${clz.clzName}AccordLawVOMapStruct;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.mapstruct.${clz.clzName}DeclaredFileVOMapStruct;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.mapstruct.${clz.clzName}FaqVOMapStruct;
import com.seaboxdata.drd2.vo.${clz.clzName?uncap_first}.mapstruct.${clz.clzName}ProcessFlowVOMapStruct;
import com.seaboxdata.drd2.vo.info.CollectInfoVO;
import com.seaboxdata.drd2.vo.info.ScoreInfoVO;
import com.seaboxdata.drd2.vo.res.ResVO;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
 * ${clz.clzName} GraphQL Property 实现
 *
 * @program: ${program}
 * @description:${clz.comment}
 * @author: ${author}
 * @create: ${create}
 */
@Component
public class ${clz.clzName}PropertyResolver implements GraphQLResolver<${clz.clzName}VO> {

    private I${clz.clzName}Ctl ${clz.clzName?uncap_first}Ctl;

    public ${clz.clzName}PropertyResolver(I${clz.clzName}Ctl ${clz.clzName?uncap_first}Ctl) {
        this.${clz.clzName?uncap_first}Ctl = ${clz.clzName?uncap_first}Ctl;
    }
}
