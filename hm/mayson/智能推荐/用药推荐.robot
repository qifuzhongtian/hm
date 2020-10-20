*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String


*** Variables ***

*** Test Cases ***
mayson用药推荐
    [Documentation]    cdss/mayson/v_2_0/intelligent_recommendation,断言:"抗血小板治疗药品名称"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    doctorGuid=0210497
    ...    doctorName=s测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    pageSource=2    requestSource=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"间断胸闷、头晕2月，加重1周。患者约2月前（2018年3月）感胸口憋闷，症状断续出现，每次持续约10分钟，应力及长距离步行时症状加重，休息后可缓解，患者当时未在意。2018年4月24日突感头晕，胸闷，就诊于广安门医院，行ECG、CTA，提示冠脉粥样硬化，LAD近中段管腔重度狭窄，建议治疗，当时患者未治疗，自行离诊。5月1日患者复感头晕、胸闷，于我院急诊就诊，考虑急性冠脉综合征，予异舒吉20mg入0.9%氯化钠注射液250ml静脉滴注等治疗，症状较前有所缓解。急诊医生患者建议住院治疗，遂于2018年5月2日收入我科。 。 目前正在治疗的疾病及用药：。急性冠脉综合征单硝酸异山梨酯片50mg/日；高血压3级，左旋氨氯地平片10mg/日；2型糖尿病，拜糖平150mg/日；高脂血症，辛伐他汀片10mg/日；"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"冠状动脉粥样硬化性心脏病。不稳定性心绞痛。颈椎病术后。高血压"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ###############
    ${assert}    Create List    阿司匹林肠溶片
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # ${aj}    Evaluate    [aj['matchMedications'] for aj in $getRes['body']['therapeuticPlanList']]
    # List should contain sub list    ${aj}    ${assert}
    # Lists should Be Equal    ${aj}    ${assert}
    Should contain    $getRes['body']['therapeuticPlanList']    therapeuticPlanList
