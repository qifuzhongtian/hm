*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
# 病情评估
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    病情评估_高血压    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    bloodPressure={"systolicPressure": 150, "diastolicPressure": 90}
#     ...    gender=0    dangerFactors=    deeperConfirms=    pastMedicalHistory=    targetOrganDamages=    personalHistory=
#     Should Be Equal As Strings    ${getRes['body']['conclusion']}    患者当前血压属于“1 级高血压(轻度)”，患者心血管预后危险分层为“低危”。##建议坚持健康生活方式，同时使用1 种降压药从较小剂量开始药物治疗。

# 药物治疗
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    药物治疗_高血压    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    classification=13
#     ...    sex=0
#     #log    ${getRes}
#     Should Be Equal As Strings    ${getRes['body']['drugResponseList'][0]['antihypertensiveDrugList'][0]['drugName']}    米诺地尔

# 患者教育
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    患者教育    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    chronicDiseaseId=8353C0AAE0
#     ...    sex=0
#     Should Be Equal As Strings    ${getRes['body']['catalogueList'][1]['title']}    家庭测量血压

# 慢病打开
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    慢病打开_高血压    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    chronicDiseaseId=
#     ...    sex=0    assistExamineDiabetesPojo=
#     Should Be Equal As Strings    ${getRes['body']['pastMedicalHistory'][0]['description']}    脑血管病
