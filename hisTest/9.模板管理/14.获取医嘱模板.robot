*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    保存医嘱模板    id=    tempName=${secs}常用医嘱啊    tempDesc=多喝点水!!
...    AND    获取模板列表        currentPage=1    tempName=    tempType=6    tempAuthority=1    pageSize=20

Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# 字段名	类型	是否必须	说明
# id	Long	否	模板id，非必填，如果有id则更新，没有则新增
# tempName	String	是	医嘱名称
# tempDesc	String	否	医嘱内容


*** Test Cases ***
14.1 获取医嘱模板
    [Documentation]    断言:"保存成功 error=0"
    # ${secs}    Get Time    epoch
    # ${tempName}    Catenate    SEPARATOR=    ${secs}    医嘱模板
    ${getRes}    获取医嘱模板    id=${templateId}
    Should Be Equal As Strings    ${getRes['body']['id']}    ${templateId}

