*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
15.1 相关疾病
    [Documentation]    断言error:"diseaseName=流行性感冒"
    # 相关疾病    ['body'][0]['diseaseName']    流行性感冒    diseaseId=8457C0ACE01
    ${getRes}    相关疾病    diseaseId=8457C0ACE01
    Should Be Equal As Strings    ${getRes['body'][0]['diseaseName']}    流行性感冒

15.2 相关疾病
    [Documentation]    断言error:"diseaseName=急性咽炎"
    # 相关疾病    ['body'][0]['diseaseName']    流行性感冒    diseaseId=8457C0ACE01
    ${getRes}    相关疾病    diseaseId=啊啊啊啊
    Should Be Equal As Strings    ${getRes['head']['message']}    程序异常！


