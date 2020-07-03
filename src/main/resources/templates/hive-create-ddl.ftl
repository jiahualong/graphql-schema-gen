CREATE TABLE IF NOT EXISTS '${tableName}' (
<#list columns as column>
    ${column.name!''} ${column.columnType!''} <#if !c.isNullAble> NOT NULL </#if> COMMET '${column.desc!''}' <#if column_has_next>,</#if>
</#list>
)
COMMENT '${tableComment!''}'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;
