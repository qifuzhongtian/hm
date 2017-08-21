*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
# ...    AND    获取模板列表        currentPage=1    tempName=    tempType=6    tempAuthority=1    pageSize=20
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String
##
*** Variables ***
# 字段名	类型	是否必须	说明
# id	Long	否	模板id，非必填，如果有id则更新，没有则新增
# tempName	String	是	医嘱名称
# tempDesc	String	否	医嘱内容


*** Test Cases ***
13.1 保存医嘱模板
    [Documentation]    断言:"保存医嘱模板成功 error=0"
    # ${secs}    Get Time    epoch
    # ${tempName}    Catenate    SEPARATOR=    ${secs}    医嘱模板
    ${getRes}    保存医嘱模板    id=    tempName=${secs}常用医嘱    tempDesc=多喝点水!!
    Should Be Equal As Strings    ${getRes['head']['error']}    0

# 13.2 编辑医嘱
#     [Documentation]    断言:"编辑医嘱模板成功 error=0"
#     # ${secs}    Get Time    epoch
#     # ${tempName}    Catenate    SEPARATOR=    ${secs}    医嘱模板
#     ${getRes}    保存医嘱模板    id=${templateId}    tempName=${secs}常用医嘱改    tempDesc=自动编辑医嘱
#     Should Be Equal As Strings    ${getRes['head']['error']}    0

