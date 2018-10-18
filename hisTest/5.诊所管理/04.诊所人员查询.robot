*** Settings ***
Suite Setup       登录接口
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# page	Integer	是	当前页数

*** Test Cases ***
4.1 诊所人员查询
    [Documentation]    断言:"recordId=59356"
    ${getRes}    诊所人员查询    page=1
    ${aj}    Evaluate    [aj['realName'] for aj in $getRes['body']['doctorList']]
    Should Contain    ${aj}    接口自动保存


