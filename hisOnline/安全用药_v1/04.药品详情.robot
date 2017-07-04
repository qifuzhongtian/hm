*** Settings ***
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# drugId String 是 药品ID


*** Test Cases ***
4.1药品详情
    [Documentation]    断言error:"docName=曲克芦丁注射剂"
    ${getRes}    药品详情    drugId=1CDF42A1CB
    Should Be Equal As Strings    ${getRes['body']['docName']}    曲克芦丁注射剂


