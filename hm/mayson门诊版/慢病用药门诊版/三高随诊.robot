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
#     ${getRes}    病情评估_糖尿病    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    chronicDiseaseId=8756C0A9E4
#     ...    sex=0    riskFactorId=21
#     Should Be Equal As Strings    ${getRes['body']['recommendDesc']}    伴有糖尿病酮症的患者建议转诊至上级医院进行治疗

# 慢病打开
#     [Setup]    Run Keywords    获取时间戳
#     ...    AND    获取随机数
#     ${getRes}    慢病打开_三高    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    chronicDiseaseId=100001
#     ...    sex=0    assistExamineDiabetesPojo=
#     Should Be Equal As Strings    ${getRes['body']['baseInfoComplication'][0]['name']}    缺血性脑血管病
