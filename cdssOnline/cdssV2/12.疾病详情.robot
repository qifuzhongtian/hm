*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

*** Test Cases ***
12.1 疾病详情显示正常
    [Documentation]    断言:"titleId"
    ${getRes}    疾病详情    diseaseId=8457C0ACE01
    Should Be Equal As Strings    ${getRes['body']['catalogueList'][0]['titleId']}    83257


# 12.2 疾病详情diseaseId输入错误,详情显示失败
#     [Documentation]    断言:"titleId"
#     ${getRes}    疾病详情    diseaseId=8457C0ACE01333
#     Should Be Equal As Strings    ${getRes['head']['message']}    程序异常！


