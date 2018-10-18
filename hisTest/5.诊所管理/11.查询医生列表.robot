*** Settings ***
Suite Setup       登录接口
Suite Teardown    Delete All Sessions
Resource          ../his关键字.robot
Library           Collections
Library           RequestsLibrary
# laboratoryId	Integer	否

*** Test Cases ***
11.1 查询医生列表
    [Documentation]    断言:""
    ${getRes}    查询医生列表
    ${aj}    Evaluate    [aj['realName'] for aj in $getRes['body']['doctorList']]
    Should Contain    ${aj}    接口自动保存

    # ${getRes}    智能诊断2.3    symptom=发热,胃痛,腹胀,腹痛,高热    previousHistory=    personalHistory=
    # ...    allergyHistory=    familyHistory=
    # ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
    # ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
    # ...    presentHistory=
    # ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    # log    ${aj}
    # Should Contain    ${aj[:3]}    胆石病