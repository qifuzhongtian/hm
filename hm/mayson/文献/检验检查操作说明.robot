*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
检验检查操作说明
    [Documentation]    断言:"超声检查"
    ${getRes}    检验检查操作说明    examId=110644    examType=2    customEnv=1
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['articles'][0]['catalogueList']]
    Should Contain    ${aj}    超声检查



# http://10.117.64.153:8080/athena/v_1_0/article/page/exam?examId=110644&examType=2&customEnv=1