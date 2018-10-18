*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# # 字段名 类型  是否必须    说明
# # userGuid    String  是   患者唯一编号
# # serialNumber    String  是   住院病历唯一编号
# # pageSource  Integer 是   页面来源
# #             病案首页：1
# #             病程页面：2
# #             检验医嘱页面：3
# #             处方医嘱页面：4
# # patientInfo Object  是   患者信息
# # ----gender  Integer 否   性别0女，1男,  2 其他
# # ----age double  是   年龄
# # ----ageType String  是   岁、月、天
# # ----maritalStatus   Integer 否   婚姻状况  0：未婚 ，1: 已婚， 2:其他
# # ----pregnancyStatus Integer 否   妊娠状况  1: 怀孕  0：未怀孕
# # ----bodyTempr   Double  否   体温
# # ----heartRate   Integer 否   心率
# # ----lowBldPress Double  否   舒张压-低压
# # ----highBldPress    Double  否   收缩压-高压
# # definiteDiagnosis   List[Object]    是   已明确诊断(每次提交全量诊断)
# # ----id  String  是   诊断ID
# # ----name    String  是   诊断名称
# # progressNoteList    List[Object]    否   病程记录列表（新增或有变更的病程记录）
# # ----progressGuid    String  是   病程唯一标识
# # ----progressType    Integer 是   病程类型
# #             门诊病历：0
# #             入院记录：1
# #             首次病程：2
# #             日常病程：3
# #             查房记录：4
# #             手术前记录：5
# #             手术后小结：6
# #             讨论小结：7
# #             阶段小结：8
# #             会诊记录：9
# #             出院小结：10
# #             其他记录：11
# # ----progressMessage String  是   病程文本信息
# # ----doctorGuid  String  否   医生编号（当次记录提交人）
# # ----recordTime  String  否   记录时间
# # deleteProgressNoteList  List[Object]    否   删除的病程记录列表（被删除的病程记录）
# # ----progressGuid    String  是   被删除的病程唯一标识
# # ----progressType    Integer 是   病程类型
# #             门诊病历：0
# #             入院记录：1
# #             首次病程：2
# #             日常病程：3
# #             查房记录：4
# #             手术前记录：5
# #             手术后小结：6
# #             讨论小结：7
# #             阶段小结：8
# #             会诊记录：9
# #             出院小结：10
# #             其他记录：11
# # ----doctorGuid  String  否   医生编号（当次记录提交人）
# # ----recordTime  String  否   删除时间
# # labTestList List[Object]    否   检验
# # ----labTestNumber   String  是   检验编号
# # ----labTestName String  否   检验单名称
# # ----labTestSample   String  否   检验样本
# # ----labTestItems    List[Object]    是   检验结果列表
# # --------labTestItemName String  否   检验结果中文名称
# # --------labTestItemEnName   String  否   检验结果英文名称
# # --------labTestResult   String  否   检验结果的值
# # --------labTestValueUnit    String  否   检验值单位
# # --------labTestValueChange  String  否   检验值变化
# #             正常：N
# #             偏高：H
# #             偏低：L
# # --------labTestMethod   String  否   检验方法
# # --------normalRange String  否   参考区间
# # examinationList List[Object]    否   检查单
# # ----examinationNumber   String  是   检查单编号
# # ----examinationName String  否   检查单名称
# # ----examinationResult   String  否   检查结果
# # ----examinationDesc String  否   检查描述
# # prescriptions   List[Object]    否   处方集合
# # ----prescriptionNumber  String  是   处方编号
# # ----drugList    List[Object]    是   药品集合
# # --------drugId  String  是   药品Id
# # --------drugName    String  是   药品名称
# # --------dosage  String  否   每次给药剂量
# # --------frequency   String  否   频率
# # --------dosageForm  String  否   剂型
# # --------pathway String  否   用药途径
# # --------specification   String  否   药品规格

*** Variables ***

*** Test Cases ***

推荐检查2行-1 急性胸痛,推荐检查包含:静息12导联心电图
    [Documentation]    急性胸痛,断言:"推荐检查examination=静息12导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息12导联心电图

推荐检查2行-2 胸痛,推荐检查包含:静息12导联心电图
    [Documentation]    胸痛,断言:"推荐检查examination=静息12导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息12导联心电图

推荐检查2行-3 濒死感,推荐检查包含:静息12导联心电图
    [Documentation]    濒死感,断言:"推荐检查examination=静息12导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 濒死感 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息12导联心电图

推荐检查2行-4 胸部撕裂样痛,推荐检查包含:静息12导联心电图
    [Documentation]    胸部撕裂样痛,断言:"推荐检查examination=静息12导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛｜胸痛｜胸部撕裂样痛｜胸部撕裂样痛｜背部撕裂样痛｜呼吸困难</BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 胸部撕裂样痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息12导联心电图

推荐检查2行-5 背部撕裂样痛,推荐检查包含:静息12导联心电图
    [Documentation]    背部撕裂样痛,断言:"推荐检查examination=静息12导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛｜胸痛｜背部撕裂样痛｜背部撕裂样痛｜背部撕裂样痛｜呼吸困难</BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 背部撕裂样痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息12导联心电图

推荐检查2行-6 呼吸困难,推荐检查包含:静息12导联心电图
    [Documentation]    呼吸困难,断言:"推荐检查examination=静息12导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛｜胸痛｜呼吸困难｜呼吸困难｜呼吸困难｜呼吸困难</BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 呼吸困难 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息12导联心电图

推荐检查3行-1 急性胸痛,推荐检查包含:静息18导联心电图
    [Documentation]    急性胸痛,断言:"推荐检查examination=静息18导联心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    静息18导联心电图

推荐检查4行-1 急性胸痛,推荐检查包含:肌钙蛋白
    [Documentation]    急性胸痛,断言:"推荐检查examination=肌钙蛋白"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肌钙蛋白

推荐检查5行-1 急性胸痛,推荐检查包含:心肌酶
    [Documentation]    急性胸痛,断言:"推荐检查examination=心肌酶"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    心肌酶

推荐检查6行-1 胸部撕裂样痛,推荐检查包含:主动脉CTA
    [Documentation]    胸部撕裂样痛,断言:"推荐检查examination=主动脉CTA"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 胸部撕裂样痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    主动脉CTA


推荐检查7行 急性胸痛,推荐检查包含:肺动脉CTA
    [Documentation]    急性胸痛,断言:"推荐检查examination=肺动脉CTA"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肺动脉CTA


推荐检查10行 急性胸痛,推荐检查包含:D-二聚体
    [Documentation]    急性胸痛,断言:"推荐检查examination=D-二聚体"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    D-二聚体



推荐检查14行 急性胸痛,推荐检查包含:血常规
    [Documentation]    急性胸痛,断言:"推荐检查examination=血常规"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规

推荐检查15行 急性胸痛,推荐检查包含:血电解质
    [Documentation]    急性胸痛,断言:"推荐检查examination=血电解质"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血电解质

推荐检查16行 急性胸痛,推荐检查包含:肝功能
    [Documentation]    急性胸痛,断言:"推荐检查examination=肝功能"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肝功能

推荐检查17行 急性胸痛,推荐检查包含:肾功能
    [Documentation]    急性胸痛,断言:"推荐检查examination=肾功能"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肾功能

# 推荐检查17行 急性胸痛,推荐检查包含:肾功能
#     [Documentation]    急性胸痛,断言:"推荐检查examination=肾功能"
#     #执行删除操作
#     # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    # [Setup]    Run Keywords    获取时间戳
    # ...    AND    获取随机数
#     ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#     ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ...    definiteDiagnosis=
#     ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
#     ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#     ...    labTestList=
#     ...    examinationList=
#     ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
#     Should Contain    ${aj}    肾功能

推荐检查18行 急性胸痛+血糖异常,推荐检查包含:血糖
    [Documentation]    急性胸痛,断言:"推荐检查examination=血糖"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 血糖异常</BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血糖

推荐检查19行 急性胸痛+血脂异常,推荐检查包含:血脂
    [Documentation]    急性胸痛,断言:"推荐检查examination=血脂"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 血脂异常</BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血脂

推荐检查20行 急性胸痛,推荐检查包含:凝血功能
    [Documentation]    急性胸痛,断言:"推荐检查examination=凝血功能"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛</BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    凝血功能
#######心肌梗死｜非ST段抬高型心肌梗死｜ST段抬高型心肌梗死  水肿｜心悸｜心律失常      24小时动态心电图       评估心律失常、心肌缺血发作情况 并发症检查   21
推荐检查22行 心肌梗死｜非ST段抬高型心肌梗死｜ST段抬高型心肌梗死+次要条件:水肿｜心悸｜心律失常,推荐检查包含:24小时动态心电图
    [Documentation]    急性胸痛,断言:"推荐检查examination=24小时动态心电图"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 心肌梗死 非ST段抬高型心肌梗死 ST段抬高型心肌梗死 水肿 心悸 心律失常 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    24小时动态心电图

######心肌梗死｜非ST段抬高型心肌梗死｜ST段抬高型心肌梗死           BNP     评估心力衰竭风险    并发症检查   22
推荐检查23行 心肌梗死｜非ST段抬高型心肌梗死｜ST段抬高型心肌梗死,推荐检查包含: BNP
    [Documentation]    急性胸痛,断言:"推荐检查examination= BNP"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 心肌梗死 非ST段抬高型心肌梗死 ST段抬高型心肌梗死 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}     BNP
######心肌梗死｜非ST段抬高型心肌梗死｜ST段抬高型心肌梗死           NT-proBNP       评估心力衰竭风险    并发症检查   23
推荐检查24行 心肌梗死｜非ST段抬高型心肌梗死｜ST段抬高型心肌梗死,推荐检查包含:NT-proBNP
    [Documentation]    急性胸痛,断言:"推荐检查examination=  NT-proBNP"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 心肌梗死 非ST段抬高型心肌梗死 ST段抬高型心肌梗死 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}     NT-proBNP



##########################################检查解读################################
##急性胸痛    肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段抬高  急性ST段抬高型心肌梗死    推荐确诊急性ST段抬高型心肌梗死
检查解读2行-1 病历内容:急性胸痛+检查结果:心肌肌钙蛋白T(升高):0.14ug/L,推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L ST段抬高 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死

检查解读2行-2 病历内容:急性胸痛+检查结果:cTnI:升高:0.2ug/L , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+ 检查结果:肌钙蛋白升高｜cTnI升高(<0.2)｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L ST段抬高 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死

检查解读2行-3 病历内容:急性胸痛+检查结果:cTnT升高:0.14ug/L , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L ST段抬高 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死

检查解读2行-4 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnT升高｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L ST段抬高 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死



######急性胸痛   CK-MB升高超过参考值2倍&ST段抬高    急性ST段抬高型心肌梗死    推荐确诊急性ST段抬高型心肌梗死

检查解读3行-1 病历内容:急性胸痛+检查结果:CK-MB升高(超过参考值2倍) :10% &ST段抬高 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛｜胸痛｜濒死感｜胸部撕裂样痛｜背部撕裂样痛｜ 呼吸困难+检查结果:CK-MB升高超过参考值2倍&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 CK-MB:10% ST段抬高 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死


检查解读3行-2 病历内容:急性胸痛+检查结果:肌酸激酶同工酶（CK-MB） 升高(超过参考值2倍) :10% &ST段抬高 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛｜胸痛｜濒死感｜胸部撕裂样痛｜背部撕裂样痛｜ 呼吸困难+检查结果:CK-MB升高超过参考值2倍&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 肌酸激酶同工酶（CK-MB):10% ST段抬高 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死


####急性胸痛  肌钙蛋白升高｜cTnI升高｜cTnT升高    急性心肌梗死  疑似ACS，不能因为等待心肌损伤标志物结果而影响及时诊断,甚至延误治疗。建议每15~30分钟重复心电图1次,一旦发现ST-T动态变化,则立即做出ACS诊断。

检查解读4行-1 急性胸痛 心肌肌钙蛋白T(升高):0.14ug/L,推荐诊断包含:急性心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 心肌肌钙蛋白T:0.14ug/L </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死


检查解读4行-2 急性胸痛 cTnI:升高:0.2ug/L , 推荐诊断包含:急性心肌梗死
    [Documentation]    急性胸痛+ 检查结果:肌钙蛋白升高｜cTnI升高(<0.2)｜cTnT升高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死

检查解读4行-3 急性胸痛 cTnT升高:0.14ug/L , 推荐诊断包含:急性心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid":"22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死

检查解读4行-4 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnT升高｜cTnT升高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死

#########急性胸痛 肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段不抬高&CK-MB升高超过参考值2倍  急性非ST段抬高型心肌梗死   推荐确诊急性非ST段抬高型心肌梗死

检查解读5行-1 急性胸痛 心肌肌钙蛋白T(升高):0.14ug/L+ST段不抬高+CK-MB升高超过参考值2倍,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L ST段不抬高 CK-MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读5行-2 病历内容:急性胸痛+检查结果:cTnI:升高:0.2ug/L +ST段不抬高+CK-MB升高超过参考值2倍 CK-MB:10%, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+ 检查结果:肌钙蛋白升高｜cTnI升高(<0.2)｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L ST段不抬高 CK-MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读5行-3 病历内容:急性胸痛+检查结果:cTnT升高:0.14ug/L +ST段不抬高+CK-MB升高超过参考值2倍 CK-MB:10%, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L ST段不抬高 CK-MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读5行-4 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +ST段不抬高+CK-MB升高超过参考值2倍 CK-MB:10% , 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnT升高｜cTnT升高&ST段抬高,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L ST段不抬高 CK-MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死




#########急性胸痛 肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段压低｜T波低平｜T波倒置    急性非ST段抬高型心肌梗死    推荐确诊急性非ST段抬高型心肌梗死

检查解读6行-1 急性胸痛+检查结果: 心肌肌钙蛋白T(升高):0.14ug/L+ST段压低 ,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-2 急性胸痛+检查结果:cTnI:升高:0.2ug/L+ST段压低, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-3 急性胸痛+检查结果:cTnT升高:0.14ug/L +ST段压低, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-4 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +ST段压低 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读6行-5 急性胸痛+检查结果: 心肌肌钙蛋白T(升高):0.14ug/L+T波低平 ,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&T波低平｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-6 急性胸痛+检查结果:cTnI:升高:0.2ug/L+T波低平, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&T波低平｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-7 急性胸痛+检查结果:cTnT升高:0.14ug/L +T波低平, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&T波低平｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-8 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +T波低平 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&T波低平｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读6行-9 急性胸痛+检查结果: 心肌肌钙蛋白T(升高):0.14ug/L+T波倒置 ,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读6行-10 急性胸痛+检查结果:cTnI:升高:0.2ug/L+T波倒置, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-11 急性胸痛+检查结果:cTnT升高:0.14ug/L +T波倒置, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读6行-12 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +T波倒置 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段压低｜T波低平｜T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


######检查解读6 急性胸痛  肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段不抬高&非ST段压低｜非T波低平｜非T波倒置  急性非ST段抬高型心肌梗死   疑似NSTE-ACS，不能因为等待心肌损伤标志物结果而影响及时诊断,甚至延误治疗。建议每15~30分钟重复心电图1次,一旦发现ST-T动态变化,则立即做出ACS诊断。

检查解读7行-1 急性胸痛+ 心肌肌钙蛋白T(升高):0.14ug/L+ ST段不抬高+非ST段压低 ,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段不抬高+非ST段压低 ,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L ST段不抬高 非ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读7行-2 急性胸痛+检查结果:cTnI:升高:0.2ug/L+ST段不抬高+非ST段压低, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高+ST段不抬高 非ST段压低,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L ST段不抬高 非ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读7行-3 急性胸痛+检查结果:cTnT升高:0.14ug/L +ST段不抬高 非ST段压低, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段不抬高 非ST段压低,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L ST段不抬高 非ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读7行-4 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +ST段不抬高 非ST段压低 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高+ ST段不抬高 非ST段压低,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L ST段不抬高 非ST段压低 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读7行-5 急性胸痛+ 心肌肌钙蛋白T(升高):0.14ug/L+ ST段不抬高+非T波低平 ,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段不抬高+非T波低平 ,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L ST段不抬高 非T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读7行-6 急性胸痛+检查结果:cTnI:升高:0.2ug/L+ST段不抬高+非T波低平, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高+ST段不抬高 非T波低平,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L ST段不抬高 非T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读7行-7 急性胸痛+检查结果:cTnT升高:0.14ug/L +ST段不抬高 非T波低平, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段不抬高 非T波低平,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L ST段不抬高 非T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读7行-8 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +ST段不抬高 非T波低平 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高+ ST段不抬高 非T波低平,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L ST段不抬高 非T波低平 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读7行-9 急性胸痛+ 心肌肌钙蛋白T(升高):0.14ug/L+ ST段不抬高+非T波倒置 ,推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高& ST段不抬高+非T波倒置 ,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白T:0.14ug/L ST段不抬高 非T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


检查解读7行-10 急性胸痛+检查结果:cTnI:升高:0.2ug/L+ST段不抬高+非T波倒置, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高+ST段不抬高 非T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnI:0.2ug/L ST段不抬高 非T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读7行-11 急性胸痛+检查结果:cTnT升高:0.14ug/L +ST段不抬高 非T波倒置, 推荐诊断包含:急性非ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高&ST段不抬高 非T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 cTnT:0.14ug/L ST段不抬高 非T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死

检查解读7行-12 病历内容:急性胸痛+检查结果:心肌肌钙蛋白I:0.14ug/L +ST段不抬高 非T波倒置 , 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]    急性胸痛+检查结果:肌钙蛋白升高｜cTnI升高｜cTnT升高+ ST段不抬高 非T波倒置,断言:"diagnosticSuggest=急性非ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 心肌肌钙蛋白I:0.2ug/L ST段不抬高 非T波倒置 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性非ST段抬高型心肌梗死


#######检查解读7 推荐检查:胸骨左缘收缩期杂音    室间隔穿孔  提示需高度警惕并发室间隔穿孔
检查解读8行-1 推荐检查:胸骨左缘收缩期杂音, 推荐诊断包含:室间隔穿孔
    [Documentation]    推荐检查:胸骨左缘收缩期杂音,断言:"diagnosticSuggest=室间隔穿孔"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 胸骨左缘收缩期杂音 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     室间隔穿孔




#########检查解读8 提示存在心源性休克、心力衰竭     推荐结果:心力衰竭   提示存在心源性休克、心力衰竭

检查解读9行-1 面色苍白+湿啰音+颈静脉怒张 , 推荐诊断包含:心力衰竭
    [Documentation]    推荐检查:面色苍白 湿啰音 颈静脉怒张,断言:"diagnosticSuggest=心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 面色苍白 湿啰音 颈静脉怒张 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心力衰竭

检查解读9行-2 皮肤湿冷+湿啰音+颈静脉怒张 , 推荐诊断包含:心力衰竭
    [Documentation]    推荐检查:面色苍白 湿啰音 颈静脉怒张,断言:"diagnosticSuggest=心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 皮肤湿冷 湿啰音 颈静脉怒张 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心力衰竭

检查解读9行-3 发绀+湿啰音+颈静脉怒张 , 推荐诊断包含:心力衰竭
    [Documentation]    推荐检查:发绀 湿啰音 颈静脉怒张,断言:"diagnosticSuggest=心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 发绀 湿啰音 颈静脉怒张 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心力衰竭

检查解读9行-4 低血压+湿啰音+颈静脉怒张 , 推荐诊断包含:心力衰竭
    [Documentation]    推荐检查:低血压 湿啰音 颈静脉怒张,断言:"diagnosticSuggest=心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 低血压 湿啰音 颈静脉怒张 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心力衰竭



#########检查解读9 奔马律    急性心力衰竭  提示存在急性心力衰竭

检查解读10行-1 奔马律, 推荐诊断包含:急性心力衰竭
    [Documentation]    推荐检查:发绀 湿啰音 颈静脉怒张,断言:"diagnosticSuggest=急性心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 奔马律 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心力衰竭


#########检查解读10 心律不齐｜房室传导阻滞｜心动过速｜心动过缓   心律失常    提示存在心律失常，AMI者出现心律失常应特别警惕发生室性心动过速和心室颤动或心脏停搏
检查解读11行-1 心律不齐,推荐诊断包含:心律失常
    [Documentation]    心律不齐  推荐检查:心律失常   ,断言:"diagnosticSuggest=急性心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 心律不齐 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心律失常

检查解读11行-2 房室传导阻滞,推荐诊断包含:心律失常
    [Documentation]    房室传导阻滞  推荐检查:心律失常   ,断言:"diagnosticSuggest=急性心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 房室传导阻滞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心律失常

检查解读11行-3 心动过速,推荐诊断包含:心律失常
    [Documentation]    心动过速  推荐检查:心律失常   ,断言:"diagnosticSuggest=急性心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 心动过速 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心律失常

检查解读11行-4 心动过缓,推荐诊断包含:心律失常
    [Documentation]    心动过缓  推荐检查:心律失常   ,断言:"diagnosticSuggest=急性心力衰竭"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 删除 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 心动过缓 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     心律失常




####检查解读12 急性胸痛   一过性ST段抬高&肌钙蛋白阴性｜cTnI阴性｜cTnT阴性｜CK－MB升高   变异性心绞痛  提示存在变异性心绞痛
检查解读12行-1 急性胸痛+一过性ST段抬高+肌钙蛋白阴性 , 推荐诊断包含:变异性心绞痛
    [Documentation]    急性胸痛+检查结果: 一过性ST段抬高+肌钙蛋白阴性,断言:"diagnosticSuggest=变异性心绞痛"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 一过性ST段抬高 肌钙蛋白阴性 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     变异性心绞痛

检查解读12行-2 急性胸痛+一过性ST段抬高+cTnI阴性 , 推荐诊断包含:变异性心绞痛
    [Documentation]    急性胸痛+检查结果: 一过性ST段抬高+cTnI阴性,断言:"diagnosticSuggest=变异性心绞痛"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 一过性ST段抬高 cTnI阴性 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     变异性心绞痛

检查解读12行-3 急性胸痛+一过性ST段抬高+cTnT阴性 , 推荐诊断包含:变异性心绞痛
    [Documentation]    急性胸痛+检查结果: 一过性ST段抬高+cTnT阴性,断言:"diagnosticSuggest=变异性心绞痛"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText>急性胸痛 一过性ST段抬高 cTnT阴性 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     变异性心绞痛


检查解读12行-4 急性胸痛+一过性ST段抬高+CK－MB升高<5% , 推荐诊断包含:变异性心绞痛
    [Documentation]    急性胸痛+检查结果: 一过性ST段抬高+CK－MB升高<5%,断言:"diagnosticSuggest=变异性心绞痛"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText >急性胸痛 一过性ST段抬高 CK－MB升高:4% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     变异性心绞痛


#######检查解读13 新出现的左束支传导阻滞   急性ST段抬高型心肌梗死    新出现的左束支传导阻滞提示存在STEMI
检查解读13行-1 新出现的左束支传导阻滞, 推荐诊断包含:急性ST段抬高型心肌梗死
    [Documentation]     推荐检查:新出现的左束支传导阻滞,断言:"diagnosticSuggest=急性ST段抬高型心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"0","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 新出现的左束支传导阻滞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性ST段抬高型心肌梗死






#####检查解读19    急性胸痛   T波改变&肌钙蛋白阴性&CK－MB升高（不超过正常上限2倍）  不稳定心绞痛  提示不稳定心绞痛（UA）发作，有发生心肌损伤UA演变为NSTEMI可能，动态观察胸痛演变及心电图和肌钙蛋白心肌酶学变化
检查解读14行 急性胸痛 T波改变+肌钙蛋白阴性+CK－MB升高（不超过正常上限2倍, 推荐诊断包含:不稳定心绞痛
    [Documentation]     急性胸痛 T波改变+肌钙蛋白阴性+CK－MB升高,断言:"diagnosticSuggest=不稳定心绞痛"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 肌钙蛋白阴性 CK－MB:4% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Not Contain    ${aj}     不稳定心绞痛

#####检查解读20 急性胸痛    T波改变&肌钙蛋白阳性｜cTnI阳性｜cTnT阳性&CK－MB升高超过正常上限2倍   急性心肌梗死  提示急性心肌梗死，依据T波改变中ST段有无抬高分为NSTEMI和STEMI选择血运重建方式，采用药物抗凝溶栓治疗者3～24小时内行冠状动脉造影（CAB）判断溶栓效果
检查解读15行-1 急性胸痛 T波改变+肌钙蛋白阳性+CK－MB升高 超过正常上限2倍, 推荐诊断包含:急性心肌梗死
    [Documentation]     急性胸痛 T波改变+cTnI阳性+CK－MB升高 超过正常上限2倍,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 肌钙蛋白阳性 CK－MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死


检查解读15行-2 急性胸痛 T波改变+cTnI阳性+CK－MB升高 超过正常上限2倍, 推荐诊断包含:急性心肌梗死
    [Documentation]     急性胸痛 T波改变+cTnI阳性+CK－MB升高 超过正常上限2倍,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 cTnI阳性 CK－MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死

检查解读15行-3 急性胸痛 T波改变+cTnT阳性+CK－MB升高 超过正常上限2倍, 推荐诊断包含:急性心肌梗死
    [Documentation]     急性胸痛 T波改变+cTnI阴性+CK－MB正常,断言:"diagnosticSuggest=急性心肌梗死"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 cTnT阳性 CK－MB:10% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     急性心肌梗死

#####检查解读21 急性胸痛  T波改变&肌钙蛋白阴性｜cTnI阴性｜cTnT阴性&CK－MB正常   冠状动脉粥样硬化性心脏病    提示冠状动脉粥样硬化性心脏病，注意心绞痛发作情况，胸痛持续者15分钟复查心电图，4～6小时内复查肌钙蛋白及心肌酶学
检查解读16行-1 急性胸痛 T波改变+肌钙蛋白阴性+CK－MB正常, 推荐诊断包含:冠状动脉粥样硬化性心脏病
    [Documentation]     急性胸痛 T波改变+cTnI阴性+CK－MB正常,断言:"diagnosticSuggest=冠状动脉粥样硬化性心脏病"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 肌钙蛋白阴性 CK－MB:4% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     冠状动脉粥样硬化性心脏病


检查解读16行-2 急性胸痛 T波改变+cTnI阴性+CK－MB正常, 推荐诊断包含:冠状动脉粥样硬化性心脏病
    [Documentation]     急性胸痛 T波改变+cTnI阴性+CK－MB正常,断言:"diagnosticSuggest=冠状动脉粥样硬化性心脏病"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 cTnI阴性 CK－MB:4% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     冠状动脉粥样硬化性心脏病

检查解读16行-3 急性胸痛 T波改变+cTnT阴性+CK－MB正常, 推荐诊断包含:冠状动脉粥样硬化性心脏病
    [Documentation]     急性胸痛 T波改变+cTnT阴性+CK－MB正常,断言:"diagnosticSuggest=冠状动脉粥样硬化性心脏病"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 T波改变 cTnT阴性 CK－MB:4% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    Should Contain    ${aj}     冠状动脉粥样硬化性心脏病



# #######################################推荐评分表##########################################################
###急性非ST段抬高型心肌梗死 GRACE评分 ACS患者入院时、住院期间、出院时、随访期间应多次进行GRACE评分，尤其是出现病情变化时及时升级治疗策略
推荐评分表1行 急性非ST段抬高型心肌梗死, 推出评分表:GRACE评分
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=GRACE评分"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     GRACE评分

###急性ST段抬高型心肌梗死    出血危险分层  PCI术前常规采用CRUSADE评分预测出血风险
推荐评分表2行 急性ST段抬高型心肌梗死, 推出评分表:出血危险分层
    [Documentation]     病历内容:急性ST段抬高型心肌梗死,断言:"diagnosticSuggest=出血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗死 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     出血危险分层

####急性非ST段抬高型心肌梗死   出血危险分层  PCI术前常规采用CRUSADE评分预测出血风险
推荐评分表3行 急性非ST段抬高型心肌梗死, 推出评分表:出血危险分层
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=出血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     出血危险分层

####急性非ST段抬高型心肌梗死&GRACE评分＝<140｜GRACE评分中危｜GRACE评分低危 缺血危险分层
推荐评分表4行-1 急性非ST段抬高型心肌梗死+GRACE评分＝140, 推出评分表:缺血危险分层
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=缺血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 GRACE评分=140 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     缺血危险分层

推荐评分表4行-2 急性非ST段抬高型心肌梗死+GRACE评分＝139, 推出评分表:缺血危险分层
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=缺血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 GRACE评分＝139 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     缺血危险分层

推荐评分表4行-3 急性非ST段抬高型心肌梗死+GRACE评分＝141, 未推出评分表:缺血危险分层
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=缺血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 GRACE评分＝141 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Not Contain    ${aj}     缺血危险分层

推荐评分表4行-4 急性非ST段抬高型心肌梗死+GRACE评分中危, 推出评分表:缺血危险分层
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=缺血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 GRACE评分中危 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     缺血危险分层


推荐评分表4行-5 急性非ST段抬高型心肌梗死+GRACE评分低危, 推出评分表:缺血危险分层
    [Documentation]     病历内容:急性非ST段抬高型心肌梗死,断言:"diagnosticSuggest=缺血危险分层"
    #执行删除操作
    # [Setup]    智能推荐_xml        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText></BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"22","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗死 GRACE评分低危 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     缺血危险分层



######################################推荐治疗方案##########################################################
#######急性ST段抬高型心肌梗死   非出血高危   否定条件:出血高危｜胸痛>=24小时   溶栓治疗    进行出血风险评估，确定为非高危，预计首次医疗接触（FMC）至PCI的时间延迟>120分钟，对有适应证者应于30分钟内尽早启动溶栓治疗  紧急
推荐治疗方案2行-1 急性ST段抬高型心肌梗死+非出血高危, 推荐血运重建方案:溶栓治疗
    [Documentation]    急性ST段抬高型心肌梗死+非出血高危,断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死 </InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 非出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     溶栓治疗

推荐治疗方案2行-2 急性ST段抬高型心肌梗死+否定条件:出血高危,不会推荐血运重建方案:溶栓治疗
    [Documentation]    急性ST段抬高型心肌梗死+否定条件:出血高危,断言:"planName!=溶栓治疗"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死 </InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     溶栓治疗

推荐治疗方案2行-3 急性ST段抬高型心肌梗死+否定条件:胸痛23小时:出血高危,会推荐血运重建方案:溶栓治疗
    [Documentation]    急性ST段抬高型心肌梗死+否定条件:胸痛23小时:出血高危,断言:"planName=溶栓治疗"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死 </InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 胸痛23小时 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     溶栓治疗

推荐治疗方案2行-4 急性ST段抬高型心肌梗死+否定条件:胸痛24小时:出血高危,不会推荐血运重建方案:溶栓治疗
    [Documentation]    急性ST段抬高型心肌梗死+否定条件:胸痛24小时:出血高危,断言:"planName!=溶栓治疗"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死 </InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 胸痛24小时 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     溶栓治疗



##########2.急性ST段抬高型心肌梗死     否定条件  胸痛>=12小时    PCI手术   有PCI条件机构尽量缩短首次医疗接触（FMC）至PCI的时间<90分钟，请有资质的医生到有PCI设备的医院行直接PCI要求FMC至PCI的时间<120分钟；有紧急PCI指征，建议就地抢救，FMC至PCI的时间放宽到12小时 紧急
推荐治疗方案3行-1 急性ST段抬高型心肌梗死,推荐血运重建方案:PCI手术
    [Documentation]    急性ST段抬高型心肌梗死,断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案3行-2 急性ST段抬高型心肌梗死+否定条件:胸痛11小时,会推荐血运重建方案:PCI手术
    [Documentation]    急性ST段抬高型心肌梗死+否定条件:胸痛11小时,断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 胸痛11小时 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术


推荐治疗方案3行-3 急性ST段抬高型心肌梗死+否定条件:胸痛12小时,不会推荐血运重建方案:PCI手术
    [Documentation]    急性ST段抬高型心肌梗死+否定条件:胸痛12小时,断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 胸痛12小时 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

####推荐治疗方案3 急性ST段抬高型心肌梗死 出血高危        保守策略    进行出血风险评估，确认为高危，属于溶栓禁忌
推荐治疗方案4行-1 急性ST段抬高型心肌梗死+出血高危,推荐血运重建方案:保守策略
    [Documentation]    急性ST段抬高型心肌梗死+出血高危,断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗死 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略



####推荐治疗方案4 急性非ST段抬高型心肌梗死&GRACE评分极高危｜缺血极高危      胸痛>=72小时    PCI手术   极高危NSTE－ACS推荐进行紧急冠状动脉造影（<2小时），紧急PCI治疗   紧急
推荐治疗方案5行-1 急性非ST段抬高型心肌梗死+GRACE评分极高危,推荐血运重建方案:PCI手术
    [Documentation]    急性非ST段抬高型心肌梗死+GRACE评分极高危,断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案5行-2 急性非ST段抬高型心肌梗死+缺血极高危,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案5行-3 急性非ST段抬高型心肌梗死+GRACE评分极高危+否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分极高危 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案5行-4 急性非ST段抬高型心肌梗死+GRACE评分极高危+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分极高危 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案5行-5 急性非ST段抬高型心肌梗死+缺血极高危+否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案5行-6 急性非ST段抬高型心肌梗死+缺血极高危+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=急性ST段抬高型心肌梗死"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

########推荐治疗方案5 急性非ST段抬高型心肌梗死&GRACE评分>140&血流动力学不稳定｜心源性休克｜严重心律失常｜心脏骤停｜难治性心绞痛   否定条件:胸痛>=72小时    PCI手术   极高危NSTE－ACS推荐进行紧急冠状动脉造影（<2小时），紧急PCI治疗   紧急
推荐治疗方案6行-0 急性非ST段抬高型心肌梗死+GRACE评分140+血流动力学不稳定,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName!=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分:140 血流动力学不稳定 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术


推荐治疗方案6行-1 急性非ST段抬高型心肌梗死+GRACE评分141+血流动力学不稳定,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 血流动力学不稳定 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术


推荐治疗方案6行-2 急性非ST段抬高型心肌梗死+GRACE评分141+心源性休克,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心源性休克 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案6行-3 急性非ST段抬高型心肌梗死+GRACE评分141+严重心律失常,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 严重心律失常 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案6行-4 急性非ST段抬高型心肌梗死+GRACE评分141+心脏骤停,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心脏骤停 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案6行-5 急性非ST段抬高型心肌梗死+GRACE评分141+难治性心绞痛,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 难治性心绞痛 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术


##
推荐治疗方案6行-7 急性非ST段抬高型心肌梗死+GRACE评分141+血流动力学不稳定+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 血流动力学不稳定 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案6行-8 急性非ST段抬高型心肌梗死+GRACE评分141+心源性休克++否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心源性休克 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案6行-9 急性非ST段抬高型心肌梗死+GRACE评分141+严重心律失常+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 严重心律失常 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案6行-10 急性非ST段抬高型心肌梗死+GRACE评分141+心脏骤停+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心脏骤停 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案6行-11 急性非ST段抬高型心肌梗死+GRACE评分141+难治性心绞痛+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 难治性心绞痛 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术


#

推荐治疗方案6行-12 急性非ST段抬高型心肌梗死+GRACE评分141+血流动力学不稳定+否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 血流动力学不稳定 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案6行-13 急性非ST段抬高型心肌梗死+GRACE评分141+心源性休克++否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心源性休克 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术
推荐治疗方案6行-14 急性非ST段抬高型心肌梗死+GRACE评分141+严重心律失常++否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 严重心律失常 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术
推荐治疗方案6行-15 急性非ST段抬高型心肌梗死+GRACE评分141+心脏骤停+否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心脏骤停 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案6行-16 急性非ST段抬高型心肌梗死+GRACE评分141+难治性心绞痛+否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 难治性心绞痛 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

####推荐治疗方案6  6.急性非ST段抬高型心肌梗死&缺血极高危     否定条件:胸痛>=72小时    PCI手术   极高危NSTE－ACS推荐进行紧急冠状动脉造影（<2小时），紧急PCI治疗   紧急
推荐治疗方案7行-1 急性非ST段抬高型心肌梗死+缺血极高危,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案7行-2 急性非ST段抬高型心肌梗死+缺血极高危 否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案7行-3 急性非ST段抬高型心肌梗死+缺血极高危 否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术


####推荐治疗方案7 急性非ST段抬高型心肌梗死&GRACE评分极高危         保守策略    无PCI手术条件者建议尽快开始保守治疗
推荐治疗方案8行-1 急性非ST段抬高型心肌梗死+GRACE评分极高危,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略


####推荐治疗方案8 急性非ST段抬高型心肌梗死&GRACE评分>140&血流动力学不稳定｜心源性休克｜严重心律失常｜心脏骤停｜难治性心绞痛            保守策略    无PCI手术条件者建议尽快开始保守治疗
推荐治疗方案9行-1 急性非ST段抬高型心肌梗死+GRACE评分141+血流动力学不稳定,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 血流动力学不稳定 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

推荐治疗方案9行-2 急性非ST段抬高型心肌梗死+GRACE评分141+心源性休克,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心源性休克 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

推荐治疗方案9行-3 急性非ST段抬高型心肌梗死+GRACE评分141+严重心律失常,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 严重心律失常 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

推荐治疗方案9行-4 急性非ST段抬高型心肌梗死+GRACE评分141+心脏骤停,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 心脏骤停 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

推荐治疗方案9行-5 急性非ST段抬高型心肌梗死+GRACE评分141+难治性心绞痛,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141分 难治性心绞痛 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略



####推荐治疗方案9 急性非ST段抬高型心肌梗死&缺血极高危          保守策略    无PCI手术条件者建议尽快开始保守治疗
推荐治疗方案10行-1 急性非ST段抬高型心肌梗死+缺血极高危,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 缺血极高危Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

###推荐治疗方案10 急性非ST段抬高型心肌梗死&GRACE评分高危｜GRACE评分>140     胸痛>=72小时    PCI手术   GRACE评分>140分，高危NSTE－ACS，推荐早期行冠状动脉造影，根据病变情况决定是否行侵入策略。早期PCI治疗（<24小时）
推荐治疗方案11行-1 急性非ST段抬高型心肌梗死+GRACE评分高危,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案11行-2 急性非ST段抬高型心肌梗死+GRACE评分140,"不应"推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分140 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案11行-3 急性非ST段抬高型心肌梗死+GRACE评分141,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

###
推荐治疗方案11行-4 急性非ST段抬高型心肌梗死+GRACE评分高危+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分高危 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案11行-5 急性非ST段抬高型心肌梗死+GRACE评分140+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分140 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案11行-6 急性非ST段抬高型心肌梗死+GRACE评分141+否定条件:胸痛72小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案11行-7 急性非ST段抬高型心肌梗死+GRACE评分141+否定条件:胸痛71小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术


#####推荐治疗方案11 急性非ST段抬高型心肌梗死&GRACE评分高危｜GRACE评分>140           保守策略    无PCI手术条件者建议尽快开始保守治疗
推荐治疗方案12行-1 急性非ST段抬高型心肌梗死+GRACE评分高危,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略


推荐治疗方案12行-2 急性非ST段抬高型心肌梗死+GRACE评分140,"不应"推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分140 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     保守策略

推荐治疗方案12行-3 急性非ST段抬高型心肌梗死+GRACE评分141,推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

###推荐检查12 急性非ST段抬高型心肌梗死&GRACE评分中危｜GRACE评分［109-140］           转入CCU   GRACE评分［109分－140分］，中危NSTE－ACS，推荐侵入策略（<72小时），发病72小时内行延迟PCI（入院25-72小时内PCI）
推荐治疗方案13行-1 急性非ST段抬高型心肌梗死+GRACE评分中危,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分中危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU

推荐治疗方案13行-2 急性非ST段抬高型心肌梗死+GRACE评分109,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分109 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU

推荐治疗方案13行-3 急性非ST段抬高型心肌梗死+GRACE评分140,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分140 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU

推荐治疗方案13行-5 急性非ST段抬高型心肌梗死+GRACE评分141,不会推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分141 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     转入CCU

#######推荐治疗治疗方案13.急性非ST段抬高型心肌梗死&GRACE评分低危｜GRACE评分<109            转入CCU   GRACE评分<109分，低危缺血者，先行非侵入性检查（首选心脏超声等影像检查），寻找缺血证据，再决定是否采用侵入策略。建议药物保守治疗，可考虑转运PCI中心
推荐治疗方案14行-1 急性非ST段抬高型心肌梗死+GRACE评分低危,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分低危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU

推荐治疗方案14行-2 急性非ST段抬高型心肌梗死+GRACE评分109,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分109 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU

推荐治疗方案14行-3 急性非ST段抬高型心肌梗死+GRACE评分108,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 GRACE评分140 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU

#########推荐方案14 急性非ST段抬高型心肌梗死&无GRACE评分     胸痛>=72小时    PCI手术   建议进行GRACE评分后，高危和极高危患者选择PCI手术治疗
推荐治疗方案15行-1 急性非ST段抬高型心肌梗死+无 RACE评分,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

推荐治疗方案15行-2 急性非ST段抬高型心肌梗死+无RACE评分+否定条件:胸痛72小时,推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 胸痛72小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     PCI手术

推荐治疗方案15行-3 急性非ST段抬高型心肌梗死+无RACE评分+否定条件:胸痛71小时,不会推荐血运重建方案:PCI手术
    [Documentation]    断言:"planName=PCI手术"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 胸痛71小时 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     PCI手术

####推荐治疗方案15 急性非ST段抬高型心肌梗死&无GRACE评分            保守策略    建议进行GRACE评分后，高危和极高危，但无PCI条件的患者进行保守策略
推荐治疗方案16行 急性非ST段抬高型心肌梗死+无RACE评分,不会推荐血运重建方案:保守策略
    [Documentation]    断言:"planName=保守策略"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     保守策略

####推荐治疗方案16 急性非ST段抬高型心肌梗死&无GRACE评分            转入CCU   建议进行GRACE评分后，中危和低危患者转入CCU后，继续观察
推荐治疗方案17行 急性非ST段抬高型心肌梗死+无RACE评分 ,推荐血运重建方案:转入CCU
    [Documentation]    断言:"planName=转入CCU"
    #执行删除操作
    # ${timestamp}    Get Time    epoch
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐_xml    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗死</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗死 Objective: Assessment:诊断：急性非ST段抬高型心肌梗死 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     转入CCU