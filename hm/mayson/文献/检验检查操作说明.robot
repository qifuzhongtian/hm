*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
# 检验检查操作说明
#     [Documentation]    断言:""
#     ${getRes}    检验检查操作说明    examId=11064    examType=2    customEnv=1
#     ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['docContentList']]
#     Should Contain    ${aj}    用法和用量

