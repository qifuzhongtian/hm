*** Settings ***
# Suite Setup    Run Keywords    登录接口
# ...    AND    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名   类型  是否必须    说明
# userGuid    String  是   患者唯一编号
# serialNumber    String  是   住院病历唯一编号
# patientInfo Object  是   患者信息
# ----gender  Integer 否   性别0女，1男,  2 其他
# ----age double  是   年龄
# ----ageType String  是   岁、月、天
# ----maritalStatus   Integer 否   婚姻状况  0：未婚 ，1: 已婚， 2:其他
# ----pregnancyStatus Integer 否   妊娠状况  1: 怀孕  0：未怀孕
# ----bodyTempr   Double  否   体温
# ----heartRate   Integer 否   心率
# ----lowBldPress Double  否   舒张压-低压
# ----highBldPress    Double  否   收缩压-高压
*** Variables ***

*** Test Cases ***

###############
mayson用药推荐
    [Documentation]    断言:"药品名称"
    # ${assert}    Create List    转诊    药源性QT间期延长防治    高位胸左侧交感神经节切断术
    # ${Assessment}    Set Variable    QT间期延长
    ${assert}    Create List    地西泮片    地西泮膜    复方地西泮片    氯硝西泮片    阿普唑仑片    阿普唑仑胶囊    艾司唑仑片    单盐酸氟西泮胶囊    氯氮卓片    奥沙西泮片    三唑仑片    酒石酸唑吡坦片    酒石酸唑吡坦分散片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    pageSource=    patientInfo={"gender":"1","age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"妊娠,晚期恶性肿瘤 以“脑出血，急性胸痛,长期卧床，一侧肢体麻木”为主诉入院。 1年前无明显诱因出现右耳听力下降，伴间歇性耳鸣。体格检查：T：36.2℃，P：78次/分，R：16次/分，BP：133/74mmHg。一般状态可，心肺听诊无异常，肝脾肋下未触及，四肢活动自如。专科查体：右侧颞下颌关节肿胀，触之疼痛。右耳鼓室内似有积液。"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"失眠"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}    labTestList=    examinationList=    newTestList=    operationRecord=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
