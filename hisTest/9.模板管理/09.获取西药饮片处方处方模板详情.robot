*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    保存西药成药处方模板    id=    tempName=${catenate}成药处方模板_个人    tempType=2    tempAuthority=1    linkId=    patentPrescriptionList=
...    AND    获取模板列表        currentPage=1    tempName=    tempType=2    tempAuthority=1    pageSize=20

Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名 类型  是否必须    说明
# id  Long    是   模板id
# tempAuthority   Int 是   处方类模板必填，模板权限类型: 1:个人处方模板     2：诊所处方模板

*** Test Cases ***
11.1 获取西药饮片处方处方模板详情-个人
    [Documentation]    断言:"存在处方id"
    ${getRes}    获取西药饮片处方处方模板详情    tempAuthority=1    id=${templateId}
    Should Be Equal As Strings    ${getRes['body']['id']}    ${templateId}


