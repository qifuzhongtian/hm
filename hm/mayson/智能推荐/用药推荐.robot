*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Run Keywords    登录接口    # ...
...               # AND    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String    # 字段名    类型    是否必须    说明    # userGuid    String
...               # 是    患者唯一编号    # serialNumber    String    是    住院病历唯一编号    # patientInfo Object
...               # 是    患者信息    # ----gender    Integer 否    性别0女，1男,    2 其他    # ----age double
...               # 是    年龄    # ----ageType String    是    岁、月、天    # ----maritalStatus    Integer 否
...               # 婚姻状况    0：未婚 ，1: 已婚， 2:其他    # ----pregnancyStatus Integer 否    妊娠状况    1: 怀孕    0：未怀孕    # ----bodyTempr
...               # Double    否    体温    # ----heartRate    Integer 否    心率    # ----lowBldPress Double
...               # 否    舒张压-低压    # ----highBldPress    Double    否    收缩压-高压

*** Variables ***

*** Test Cases ***
mayson用药推荐
    [Documentation]    断言:"药品名称"
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    doctorGuid=0210497
    ...    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=儿科    pageSource=2    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"间断胸闷、头晕2月，加重1周。患者约2月前（2018年3月）感胸口憋闷，症状断续出现，每次持续约10分钟，应力及长距离步行时症状加重，休息后可缓解，患者当时未在意。2018年4月24日突感头晕，胸闷，就诊于广安门医院，行ECG、CTA，提示冠脉粥样硬化，LAD近中段管腔重度狭窄，建议治疗，当时患者未治疗，自行离诊。5月1日患者复感头晕、胸闷，于我院急诊就诊，考虑急性冠脉综合征，予异舒吉20mg入0.9%氯化钠注射液250ml静脉滴注等治疗，症状较前有所缓解。急诊医生患者建议住院治疗，遂于2018年5月2日收入我科。 。 目前正在治疗的疾病及用药：。急性冠脉综合征单硝酸异山梨酯片50mg/日；高血压3级，左旋氨氯地平片10mg/日；2型糖尿病，拜糖平150mg/日；高脂血症，辛伐他汀片10mg/日；"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"冠状动脉粥样硬化性心脏病。不稳定性心绞痛。颈椎病术后。高血压"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=
    ...    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    ###############
    # ${assert}    Create List    转诊    药源性QT间期延长防治    高位胸左侧交感神经节切断术
    # ${Assessment}    Set Variable    QT间期延长
    ${assert}    Create List    阿司匹林肠溶片
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][4]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}    ${assert}
    Lists should Be Equal    ${aj}    ${assert}
