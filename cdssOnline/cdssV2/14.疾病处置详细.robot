*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Suite Teardown    Delete All Sessions
*** Test Cases ***
14.1 疾病处置详细
    [Documentation]    断言error:"title=处置建议"
    # 疾病处置详细    ['body'][0]['children'][0]['acId']    7368    diseaseId=8457C0ACE01
    ${getRes}    疾病处置详细    diseaseId=8457C0ACE01
    ${aj}    Evaluate    [aj['title'] for aj in $getRes['body']['treatmentList']]
    Should Contain    ${aj}     处置建议
    # 14.1 疾病处置详细
    #    [Documentation]    断言error:"acId=3868"
    #    # 疾病处置详细    ['body'][0]['children'][0]['acId']    7368    diseaseId=8457C0ACE01
    #    ${getRes}    疾病处置详细    diseaseId=啊啊啊啊
    #    Should Be Equal As Strings    ${getRes['head']['message']}    程序异常！
