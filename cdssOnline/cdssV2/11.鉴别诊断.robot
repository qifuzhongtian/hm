*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
11.1 鉴别诊断
    [Documentation]    断言:"diseaseName=过敏性鼻炎"
    ${getRes}    鉴别诊断    diseaseId=8457C0ACE01
    # 鉴别诊断    ['body'][0]['diseaseName']    过敏性鼻炎    diseaseId=8457C0ACE01
    Should Be Equal As Strings    ${getRes['body'][0]['diseaseName']}    变应性鼻炎

