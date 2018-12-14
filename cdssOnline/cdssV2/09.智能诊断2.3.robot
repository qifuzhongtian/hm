*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

*** Variables ***
# ${assert}


*** Test Cases ***


# 2.1智能诊断接口_只填症状
#     [Documentation]    断言:"慢性浅表性胃炎"
#     ${getRes}    智能诊断2.3    symptom=因便秘1年余就诊，主诉大便由平常每日1次渐至每周1次，且伴有体重增加（约10kg），纳差，腹胀，易疲劳等症，病人曾在多家医院诊治，被诊断为慢性结肠炎，功能性消化不良等，但治疗未见好转    previousHistory=    personalHistory=
#     ...    allergyHistory=    familyHistory=
#     ...    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=
#     ...    examInfo=    heartRate=    age=    ageType=    confirmDiagnosis=    confirmDiagnosisMap=
#     ...    presentHistory=
#     ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
#     log    ${aj}
#     Should Contain    ${aj[:10]}    慢性浅表性胃炎





