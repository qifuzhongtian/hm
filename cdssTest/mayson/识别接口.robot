*** Settings ***
Suite Teardown    Delete All Sessions
# Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           ExcelLibrary

*** Test Cases ***
3.4 for_list_excel
    # Open Excel    /Users/yinbo/Downloads/symptom宣武.xls
    Open Excel    userdata.xls
    : FOR    ${i}    IN RANGE    806
    \    ${symptom}    Get sheet values    symptom页    1
    \    ${assert}    Get sheet values    assert页    1
    \    #${sy}    get from list    ${symptom[1]}    1
    \    #log    ${sy${i}}
    \    # : FOR    ${i}    IN RANGE    0    9
    \    ${getRes}    识别接口    symptom=${symptom[${i}][1]}    bodyTempr=    age=
    \    ...    ageType=岁    highBldPress=    lowBldPress=    pregnancyStatus=0
    \    ${aj}    Evaluate    [aj['word'] for aj in $getRes['body']['recognizeResultList']]
    \    Should Contain    ${aj}    ${assert[${i}][1]}
