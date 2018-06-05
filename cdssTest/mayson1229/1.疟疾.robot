*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***

*** Test Cases ***
###############################################推荐检查####################################################
#######201712291            怀疑疟疾&发热         外周血涂片   安排检查以明确疟原虫的存在并评估疾病的严重程度和并发症情况。厚和薄血涂片，中到重症患者在最初24小时内每8小时检查一次，持续发热的轻症患者每天检查一次，共3天 确诊检查

推荐检查2行-1 主要条件:怀疑疟疾&发热,推荐检查包含:怀疑疟疾&发热
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    怀疑疟疾 发热
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"","age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    怀疑疟疾&发热



