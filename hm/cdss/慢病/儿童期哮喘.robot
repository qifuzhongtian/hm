*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String

*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
病情评估
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    病情评估_儿童哮喘    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=15    ageType=岁    chronicDiseaseId=875BC9A8E9
    ...    sex=0    riskFactorId=54
    Should Be Equal As Strings    ${getRes['body']['acuteAttack']}    患儿目前为轻度（只要存在某项严重程度的指标，即可归入该严重程度分级）

药物治疗
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    药物治疗    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=33    ageType=岁    chronic_disease_id=875BC9A8E9
    ...    sex=0    categoryId=21
    Should Be Equal As Strings    ${getRes['body']['medicineCategoryList'][0]['name']}    低剂量ICS

患者教育
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    患者教育    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=12    ageType=岁    chronicDiseaseId=875BC9A8E9
    ...    sex=0
    Should Be Equal As Strings    ${getRes['body']['catalogueList'][0]['title']}    危险因素控制

慢病打开
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    慢病打开    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    age=15    ageType=岁    chronicDiseaseId=875BC9A8E9
    ...    sex=0    assistExamineDiabetesPojo=
    Should Be Equal As Strings    ${getRes['body']['riskElementZoneList'][0]['name']}    急性发作严重度分级
