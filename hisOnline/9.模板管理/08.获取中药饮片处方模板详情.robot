*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取模板列表        currentPage=1    tempName=    tempType=1    tempAuthority=1    pageSize=20
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# id  Long    是   模板id
# tempAuthority   Int 是   处方类模板必填，模板权限类型: 1:个人处方模板     2：诊所处方模板

*** Test Cases ***
8.1 获取中药饮片处方模板详情
    [Documentation]    断言:"存在处方id"
    ${getRes}    获取中药饮片处方模板详情    tempAuthority=1    id=${templateId}
    Should Be Equal As Strings    ${getRes['body']['id']}    ${templateId}

