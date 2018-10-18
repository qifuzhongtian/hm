*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# page	Integer	否

*** Test Cases ***
5.1 检查查询,有examName
    [Documentation]    断言:""
    ${getRes}    检查查询    examName=接口发检查治疗项    page=1
    # Should Be Equal As Strings    ${getRes['body']['examList'][0]['examName']}    血糖检查
    Should Contain    ${getRes['body']['examList'][0]['examName']}    检查治疗项



# 5.2 检查查询,无examName
#     [Documentation]    断言:""
#     ${getRes}    检查查询    examName=    page=1
#     Should Be Equal As Strings    ${getRes['body']['examList'][0]['examName']}    接口自动检查1


