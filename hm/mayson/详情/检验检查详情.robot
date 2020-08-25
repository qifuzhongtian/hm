*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
检验检查详情
    [Documentation]    断言:""
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ############检验检查详情接口自动化评测#############
    ${getRes}    检验检查详情    examId=615
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['catalogueList']]
    Should Contain    ${aj}    血浆载脂蛋白
