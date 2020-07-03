# -------------------------------------------
#
#   政务大数据平台 - 资源目录
#
#   ${clz.comment}
#
# -------------------------------------------
extend type Query{
    # 查询 ${clz.comment}
    find${clz.clzName}List(input: Find${clz.clzName}ListInput!): Find${clz.clzName}ListOutput!
}

extend type Mutation{

    # 添加或更新 ${clz.comment}
    addUpdate${clz.clzName}(input: ${clz.clzName}Input!): ${clz.clzName}

    # 删除 ${clz.comment}
    del${clz.clzName}(${clz.clzName?uncap_first}Id: [ID!]!): [ID]
}

# -----------------type--------------------------

# ${clz.comment}
type ${clz.clzName} {
<#list proVOList as pro >
    # ${pro.comm}
    ${pro.clzProp}: ${pro.graphqlType}
</#list>
}

# -----------------input--------------------------

# 职责 Input
input  ${clz.clzName}Input {
<#list propInputList as pro >
    # ${pro.comm}
    ${pro.clzProp}: ${pro.graphqlType}
</#list>
}

# 查询条件Input
input Find${clz.clzName}ListInput {
    orgId: ID!
    pageNum: Int
    size: Int
}

# -----------------output--------------------------
# 查询返回Output
type Find${clz.clzName}ListOutput {
    data:[${clz.clzName}]
    pageNum: Int
    size: Int
    total: Int
}
