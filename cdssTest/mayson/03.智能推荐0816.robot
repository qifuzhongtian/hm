*** Settings ***
# Suite Setup    Run Keywords    登录接口
# ...    AND    获取时间戳

Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名	类型	是否必须	说明
# userGuid    String  是   患者唯一编号
# serialNumber    String  是   住院病历唯一编号
# pageSource  Integer 是   页面来源
#             病案首页：1
#             病程页面：2
#             检验医嘱页面：3
#             处方医嘱页面：4
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
# definiteDiagnosis   List[Object]    是   已明确诊断(每次提交全量诊断)
# ----id  String  是   诊断ID
# ----name    String  是   诊断名称
# progressNoteList    List[Object]    否   病程记录列表（新增或有变更的病程记录）
# ----progressGuid    String  是   病程唯一标识
# ----progressType    Integer 是   病程类型
#             门诊病历：0
#             入院记录：1
#             首次病程：2
#             日常病程：3
#             查房记录：4
#             手术前记录：5
#             手术后小结：6
#             讨论小结：7
#             阶段小结：8
#             会诊记录：9
#             出院小结：10
#             其他记录：11
# ----progressMessage String  是   病程文本信息
# ----doctorGuid  String  否   医生编号（当次记录提交人）
# ----recordTime  String  否   记录时间
# deleteProgressNoteList  List[Object]    否   删除的病程记录列表（被删除的病程记录）
# ----progressGuid    String  是   被删除的病程唯一标识
# ----progressType    Integer 是   病程类型
#             门诊病历：0
#             入院记录：1
#             首次病程：2
#             日常病程：3
#             查房记录：4
#             手术前记录：5
#             手术后小结：6
#             讨论小结：7
#             阶段小结：8
#             会诊记录：9
#             出院小结：10
#             其他记录：11
# ----doctorGuid  String  否   医生编号（当次记录提交人）
# ----recordTime  String  否   删除时间
# labTestList List[Object]    否   检验
# ----labTestNumber   String  是   检验编号
# ----labTestName String  否   检验单名称
# ----labTestSample   String  否   检验样本
# ----labTestItems    List[Object]    是   检验结果列表
# --------labTestItemName String  否   检验结果中文名称
# --------labTestItemEnName   String  否   检验结果英文名称
# --------labTestResult   String  否   检验结果的值
# --------labTestValueUnit    String  否   检验值单位
# --------labTestValueChange  String  否   检验值变化
#             正常：N
#             偏高：H
#             偏低：L
# --------labTestMethod   String  否   检验方法
# --------normalRange String  否   参考区间
# examinationList List[Object]    否   检查单
# ----examinationNumber   String  是   检查单编号
# ----examinationName String  否   检查单名称
# ----examinationResult   String  否   检查结果
# ----examinationDesc String  否   检查描述
# prescriptions   List[Object]    否   处方集合
# ----prescriptionNumber  String  是   处方编号
# ----drugList    List[Object]    是   药品集合
# --------drugId  String  是   药品Id
# --------drugName    String  是   药品名称
# --------dosage  String  否   每次给药剂量
# --------frequency   String  否   频率
# --------dosageForm  String  否   剂型
# --------pathway String  否   用药途径
# --------specification   String  否   药品规格

*** Variables ***

*** Test Cases ***
####
#### 主要条件                                                                                      次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
########25L 急性胸痛｜胸痛｜濒死感｜胸部撕裂样痛｜背部撕裂样痛｜呼吸困难&Wells评分低度可能急性肺栓塞｜Wells评分<2分      严重心动过缓｜心率<40次/分｜脉搏细弱｜脉搏消失｜无脉｜低氧血症｜呼吸窘迫｜休克｜持续性低血压｜收缩压<90mmHg｜SPO2<90%    D-二聚体   Wells评分低度可能肺栓塞患者首先进行急性肺栓塞初筛 紧急检查        是
推荐检查1.1 胸痛+Wells评分低度可能急性肺栓塞,推荐检查包含:D-二聚体
    [Documentation]    胸痛+Wells评分低度可能急性肺栓塞,断言:"推荐检查examination=D-二聚体"
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分低度可能急性肺栓塞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    D-二聚体

推荐检查1.2 胸痛+Wells评分:1分,推荐检查包含:D-二聚体
    [Documentation]    胸痛+Wells评分:1分,断言:"推荐检查examination=D-二聚体"
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分:1分 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    D-二聚体

推荐检查1.3 胸痛+Wells评分:2分,推荐检查"不"包含:D-二聚体
    [Documentation]    胸痛+Wells评分:2分,断言:"推荐检查examination=D-二聚体"
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分:2分 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    D-二聚体

推荐检查1.4 胸痛+Wells评分:1分,推荐检查"不"包含:D-二聚体
    [Documentation]    断言:""
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难  Wells评分:1分  严重心动过缓 心率:39次/分 脉搏细弱 脉搏消失 无脉 低氧血症 呼吸窘迫 休克 持续性低血压 收缩压89mmHg SPO2:89% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    D-二聚体

推荐检查1.5 只有胸痛 没有Wells评分低度可能急性肺栓塞｜Wells评分<2分 ,推荐检查"不"包含:D-二聚体
    [Documentation]    胸痛+Wells评分低度可能急性肺栓塞,断言:"推荐检查examination=D-二聚体"
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分低度可能急性肺栓塞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    D-二聚体



#####26L 急性胸痛｜胸痛｜濒死感｜胸部撕裂样痛｜背部撕裂样痛｜呼吸困难&Wells评分低度可能急性肺栓塞｜Wells评分<2分&D-二聚体阳性     严重心动过缓｜心率<40次/分｜脉搏细弱｜脉搏消失｜无脉｜低氧血症｜呼吸窘迫｜休克｜持续性低血压｜收缩压<90mmHg｜SPO2<90%｜CTA禁忌  肺动脉CTA  进行CTA检查来确诊肺栓塞   紧急检查        是
推荐检查2.1 胸痛+Wells评分低度可能急性肺栓塞,推荐检查包含:肺动脉CTA
    [Documentation]    胸痛+Wells评分低度可能急性肺栓塞,断言:"推荐检查examination=肺动脉CTA"
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分低度可能急性肺栓塞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肺动脉CTA

推荐检查2.2 胸痛+Wells评分:1分,推荐检查包含:肺动脉CTA
    [Documentation]    断言:""
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分:1分 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肺动脉CTA

推荐检查2.3 胸痛+Wells评分:2分,推荐检查"不"包含:肺动脉CTA
    [Documentation]    断言:""
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分:2分 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    肺动脉CTA

推荐检查2.4 胸痛+Wells评分:1分,推荐检查"不"包含:肺动脉CTA
    [Documentation]    断言:""
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难  Wells评分:1分  严重心动过缓 心率:39次/分 脉搏细弱 脉搏消失 无脉 低氧血症 呼吸窘迫 休克 持续性低血压 收缩压89mmHg SPO2:89% </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    肺动脉CTA

推荐检查2.5 只有胸痛 没有Wells评分低度可能急性肺栓塞｜Wells评分<2分 ,推荐检查"不"包含:肺动脉CTA
    [Documentation]    断言:""
    #执行删除病程
    [Setup]    智能推荐        userGuid=22222222    serialNumber=22222222    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={"progressGuid":"22222","progressType":"3","doctorGuid":"2222","recordTime":""}    labTestList=    examinationList=
    ${getRes}    智能推荐    userGuid=22222222    serialNumber=22222222
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性胸痛 胸痛 濒死感 胸部撕裂样痛 背部撕裂样痛 呼吸困难 Wells评分低度可能急性肺栓塞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肺动脉CTA

