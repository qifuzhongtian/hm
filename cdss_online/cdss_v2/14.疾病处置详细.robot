*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions

# 字段名 类型 是否必须 说明
# diseaseId String 是 疾病ID


*** Test Cases ***
14.1 疾病处置详细
    [Documentation]    断言error:"acId=3868"
    # 疾病处置详细    ['body'][0]['children'][0]['acId']    7368    diseaseId=8457C0ACE01
    ${getRes}    疾病处置详细    diseaseId=8457C0ACE01
    Should Be Equal As Strings    ${getRes['body'][0]['children'][0]['acId']}    7368


14.1 疾病处置详细
    [Documentation]    断言error:"acId=3868"
    # 疾病处置详细    ['body'][0]['children'][0]['acId']    7368    diseaseId=8457C0ACE01
    ${getRes}    疾病处置详细    diseaseId=啊啊啊啊
    Should Be Equal As Strings    ${getRes['head']['message']}    程序异常！



