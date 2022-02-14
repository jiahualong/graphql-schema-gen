# -------------------------------------------
#
# ${program} - ${clz.comment}
#
# @author ${author}
#
# -------------------------------------------
extend type Query{
    # get${clz.comment}
    get${clz.clzName}ById(id: ID!, appId: ID!): Get${clz.clzName}ByIdResult
    # list${clz.comment}
    list${clz.clzName}(appId: ID!): List${clz.clzName}Result!
    #page${clz.comment}
    page${clz.clzName}(input: Page${clz.clzName}Input!): Page${clz.clzName}Result!
}

extend type Mutation{
    # 添加或更新${clz.comment}
    save${clz.clzName}(input: Save${clz.clzName}Input!): ResultId
    # 删除${clz.comment}
    delete${clz.clzName}ByIds(${clz.clzName?uncap_first}IdList: [ID!]!, appId: ID!): ResultIdList
}

# -----------------type--------------------------

# ${clz.comment} TYPE
type ${clz.clzName} {
<#list proVOList as pro >
    # ${pro.comm}
    ${pro.clzProp}: ${pro.graphqlType}
</#list>
}

# -----------------input--------------------------

# 添加或更新${clz.clzName}Input
input  Save${clz.clzName}Input {
<#list propInputList as pro >
    # ${pro.comm}
    ${pro.clzProp}: ${pro.graphqlType}
</#list>
}

# 分页查询${clz.clzName}条件Input
input Page${clz.clzName}Input {
    # 应用编号
    appId: ID!
    # 关键字
    keyWord: String
    # 开始时间
    lastOperateBeginTime: LocalDateTime
    # 结束时间
    lastOperateEndTime: LocalDateTime
    # 跳过前offset条数据
    offset : Int!
    # 读取limit条数据 < 100
    limit : Int!
    # 排序字段
    orderBy : [OrderItem]
}

# -----------------result--------------------------

# get${clz.comment}ID查询
type Get${clz.clzName}ByIdResult {
    code: Int
    msg: String
    data: ${clz.clzName}
}

# list${clz.comment}查询
type List${clz.clzName}Result {
    code: Int
    msg: String
    data: [${clz.clzName}]
}

# page${clz.comment}结果包装
type Page${clz.clzName}Result {
    code: Int
    msg: String
    data: Page${clz.clzName}DataResult
}

# page${clz.comment}结果
type Page${clz.clzName}DataResult {
    # 总数
    total: Int
    # 跳过前offset条数据
    offset : Int
    # 读取limit条数据
    limit : Int
    # 数据
    data: [${clz.clzName}]
}