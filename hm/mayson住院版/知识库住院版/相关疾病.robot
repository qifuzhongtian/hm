*** Settings ***
Suite Teardown    Delete All Sessions    # 字段名 类型 是否必须 说明    # diseaseId String 是 疾病ID
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
相关疾病
    [Documentation]    断言error:"diseaseName=急性咽炎"
    # 相关疾病    ['body'][0]['diseaseName']    流行性感冒    diseaseId=8457C0ACE01
    ${getRes}    相关疾病    diseaseId=8457C0ACE01
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']]
    Should Contain    ${aj}    流行性感冒
