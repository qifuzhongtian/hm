*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
专病数据集识别
    [Documentation]    :9089/get_standard_dataset
    ${getRes}    专病数据集识别    diseaseFlag=脑梗死数据集    masterProfile={"diseases":[{"customerId":1001,"definiteDate":"2020-06-30 11:42:20","dictionaryAttributeId":86,"diseaseDate":"2020-06-30 11:42:20","diseaseId":161,"diseaseName":"脑梗死","existState":1,"id":220146186680668173,"nodeId":3465,"nodeType":5,"objectId":161,"orderDate":"2020-06-30 11:42:20","profilePartType":2,"progressId":18146332,"rankId":0,"recordDate":"2020-06-30 11:42:20"}],"patientVisitInfo":{"admissionDate":"2020-06-30 11:22:00","customerId":1001,"department":"呼吸科","id":220146186584199168,"patientAge":240.0,"patientAgeType":"月","patientGender":0,"patientGuid":"1592288396440","patientName":"脑梗死数据集测试","recordId":4490659,"serialNumber":"1593487322679"},"progresses":[]}
    ${aj}    Evaluate    [aj['patientGender'] for aj in $getRes['body']['basicInfo']]
    Should Contain    ${aj}    ${0}
