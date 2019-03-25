*** Settings ***
Suite Setup    Run Keywords    登录接口
...    AND    获取时间戳
...    AND    保存医嘱模板    id=    tempName=${secs}接口自动发    tempDesc=多喝点水!!
...    AND    获取模板列表    currentPage=1    tempName=    tempType=6    tempAuthority=1    pageSize=20
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***
# @{tempIds}        ${templateId}

*** Test Cases ***
4.1 删除模板
    [Documentation]    断言:"删除成功 error=0"
    # log    ${tempIds}
    ${tempIds}    Create List    ${templateId}
    log    ${tempIds}
    ${getRes}    删除模板    tempIds=${tempIds}    tempAuthority=    templateId=
    Should Be Equal As Strings    ${getRes['head']['error']}    0


