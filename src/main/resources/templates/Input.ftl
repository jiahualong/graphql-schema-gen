package com.seaboxdata.drd2.api.input.biz;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class BizInput {
//业务事项id
private Long id;
//所属机构ID
private Long orgId;
//业务事项名称
private String name;
//业务事项描述
private String desc;
//事项类型
private String mattType;
//办件类型
private String type;
//实施机构id
private Long impleAgencyId;
//行使层级;
private String exeLevel;
//承诺办结时限  5 个工作日
private Integer promisTimeLimit;
//法定办结时限 5工作日
private Integer legalTimeLimit;
//是否收费
private Boolean isFree;
//到办事现场次数
private Integer visNum;
//是否网办
private Boolean isApplyOnline;
//是否支持预约办理
private Boolean isSupAppoint;
//事项层级: 个人_法人_企业_其它
private String shiXiangCengJi;
//服务对象
private String fuWuDuiXiang;
//咨询电话
private String consPhone;
//投诉电话
private String compPhone;
//办理形式
private String dealMethod;
//通办范围
private String dealRange;
//办理时间
private String dealTime;
//办理地点
private String dealAddr;
//申请条件_数量限制;
private Integer quantiRestr;
//受理条件
private String acceptCondtion;
//禁止性要求
private String forbidDemand;
//收费依据
private String priceValid;
//是否支持网上支付
private Boolean isSupPaymentOnline;
//流程图id
private String flowDiagFid;
//流程图名字
private String flowDiagName;
}
