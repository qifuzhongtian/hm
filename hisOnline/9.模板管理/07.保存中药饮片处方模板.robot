*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# 字段名 类型          是否必须    说明
# id              Long    否    模板id，非必填，如果有id则更新，没有则新增
# tempName        String    是    处方名称
# tempType        Integer 是    中药处方类型： 1
# tempAuthority    Int 是    处方类模板必填，模板权限类型: 1:个人处方模板    2：诊所处方模板
# linkId          Long    否    处方ID
# chinesePrescriptionList List    否    中药处方列表
# totalDosage Long    剂量值
# dailyDosage Long    每日剂量
# frequency       String    用药频率
# usage           String    用法
# requirement String    服用要求
# prescription    Long    处方编号    --新增时为空
# decoctionPiecesList List    饮片集合
#                 drugId    Long    药物ID
#                 drugName    String    饮片名称
#                 value    Double    单剂量值
#                 unit    String    单位
#                 comment String    备注
#                 dataSource    Long    药品来源 1,惠每 0,诊所    5：手动输入

*** Test Cases ***
7.1 保存中药饮片处方模板-个人处方
    [Documentation]    断言:"保存成功 error=0"
    # ${secs}    Get Time    epoch
    # log    ${secs}
    # ${tempName}    Catenate    SEPARATOR=    ${secs}    中药饮片处方模板
    # log    ${tempName}
    ${getRes}    保存中药饮片处方模板    id=    tempName=${catenate}饮片处方模板_个人    tempType=1    tempAuthority=1    linkId=20
    ...    chinesePrescriptionList=
    Should Be Equal As Strings    ${getRes['head']['error']}    0


# 保存中药饮片处方模板
#     [Arguments]    ${id}    ${tempName}    ${tempType}    ${tempAuthority}    ${linkId}    ${chinesePrescriptionList}
#     # ${dict}    Create Dictionary    Content-Type=application/json    Huimei_id=${Huimei_id}
#     # Create Session    api    ${base_url}    ${dict}
#     ${chinesePrescriptionList}    evaluate    [{"dailyDosage":"1","decoctionPiecesList":[{"drugId":"148321","drugName":"淡竹叶","value":"10","unit":"g","comment":"后下","dataSource":"0","specification":"1.0g/g*1/g"},{"drugId":"148319","drugName":"葛根","value":"11","unit":"g","comment":"先煎","dataSource":"0","specification":"1.0g/g*1/g"}],"frequency":"1日1次(qd)","prescription":"","requirement":"水煎400ml；分早晚两次饭前温服","totalDosage":"1","usage":"口服"}]
#     ${data}    Create Dictionary    id=${id}    tempName=${tempName}    tempType=${tempType}    tempAuthority=${tempAuthority}    linkId=${linkId}
#     ...    chinesePrescriptionList=${chinesePrescriptionList}
#     ${addr}    Post Request    api    his/template/saveHerbalTemplate    data=${data}
#     ${responsedata}    To Json    ${addr.content}
#     # Should Be Equal As Strings    ${responsedata['body']['suspectedDiseases'][0]['id']}    ${msg}
#     # Should Be Equal As Strings    ${responsedata${slice}}    ${msg}
#     # Delete All Sessions
#     [Return]    ${responsedata}
