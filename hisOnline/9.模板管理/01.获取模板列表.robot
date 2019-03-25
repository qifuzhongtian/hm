*** Settings ***
Suite Setup    Run Keywords       登录接口
...    AND    获取时间戳
...    AND    保存中药饮片处方模板    id=    tempName=${catenate}饮片处方模板_个人    tempType=1    tempAuthority=1    linkId=20    chinesePrescriptionList=
...    AND    保存中药饮片处方模板    id=    tempName=${catenate}饮片处方模板_诊所    tempType=1    tempAuthority=2    linkId=20    chinesePrescriptionList=
...    AND    保存医嘱模板    id=    tempName=${secs}常用医嘱    tempDesc=多喝点水!!
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# 字段名	类型	是否必须	说明
# currentPage	int	否	页码，翻页时使用，默认从1开始
# tempName	String	否	模板名称
# tempType	Int	是	模板类型： 1.成药处方模板 2西药处方模板  3:处方模板   5 ：病历模板 暂时没用    6：医嘱模板
# tempAuthority	Int	否	处方类模板必填，模板权限类型: 1:个人处方模板     2：诊所处方模板

# pageSize	int	否	每页显示数


*** Test Cases ***
1.1 获取处方模板列表-个人处方模板
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    获取模板列表    currentPage=1    tempName=    tempType=3
    ...    tempAuthority=1    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0

1.2 获取处方模板列表-诊所处方模板
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    获取模板列表    currentPage=1    tempName=    tempType=3
    ...    tempAuthority=2    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0


# 1.4 获取病历模板列表
#     [Documentation]    断言:"保存成功 error=0"
#     ${getRes}    获取模板列表    currentPage=1    tempName=    tempType=5
#     ...    tempAuthority=    pageSize=20
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

1.5 获取医嘱模板列表
    [Documentation]    断言:"保存成功 error=0"
    ${getRes}    获取模板列表    currentPage=1    tempName=    tempType=6
    ...    tempAuthority=    pageSize=20
    Should Be Equal As Strings    ${getRes['head']['error']}    0

