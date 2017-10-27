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

#####PCI手术:术前－抗血小板治疗  急性非ST段抬高型心肌梗塞     8065    阿司匹林缓释片 1   嚼服  100-300mg   顿服
PCI手术:术前－抗血小板治疗1.1:急性非ST段抬高型心肌梗塞,分组1:用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林咀嚼片    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前－抗血小板治疗1.2:急性非ST段抬高型心肌梗塞,分组2:用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#####PCI手术:术前－抗血小板治疗  急性ST段抬高型心肌梗塞     8065    阿司匹林缓释片 1   嚼服  100-300mg   顿服

PCI手术:术前－抗血小板治疗1.1:急性ST段抬高型心肌梗塞,用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林咀嚼片    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前－抗血小板治疗1.2:急性ST段抬高型心肌梗塞,用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




######PCI手术:术前－调脂   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞          8095    阿托伐他汀钙片 6   口服  20mg    顿服
PCI手术:术前－调脂1.1:急性非ST段抬高型心肌梗塞,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前－调脂1.2:急性ST段抬高型心肌梗塞,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




#######PCI手术:术前｜术中－PPCI策略    急性ST段抬高型心肌梗塞&非出血高危          4190    注射用比伐芦定 7   静脉注射
PCI手术:术前｜术中－PPCI策略1.1:急性ST段抬高型心肌梗塞,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断： Plan:急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前｜术中－PPCI策略1.2:急性ST段抬高型心肌梗塞+出血高危,用药推荐包含:注射用比伐芦定
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断： Plan:急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#######PCI手术:术前｜术中－PPCI策略    急性非ST段抬高型心肌梗塞&GRACE评分>140｜GRACE评分高危｜GRACE评分极高危｜缺血高危｜缺血极高危&出血高危         609 依诺肝素钠注射液    9   静脉注射｜皮下注射

PCI手术:术前｜术中－PPCI策略2.1:急性非ST段抬高型心肌梗塞+GRACE评分:141+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
    [Documentation]    断言:""
    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前｜术中－PPCI策略2.2:急性非ST段抬高型心肌梗塞+GRACE评分高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
    [Documentation]    断言:""
    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分高危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前｜术中－PPCI策略2.3:急性非ST段抬高型心肌梗塞+GRACE评分极高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
    [Documentation]    断言:""
    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分极高危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


PCI手术:术前｜术中－PPCI策略2.4:急性非ST段抬高型心肌梗塞+缺血高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
    [Documentation]    断言:""
    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血高危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前｜术中－PPCI策略2.5:急性非ST段抬高型心肌梗塞+缺血极高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
    [Documentation]    断言:""
    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血极高危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

####PCI手术:急性非ST段抬高型心肌梗塞&GRACE评分>140｜GRACE评分高危｜GRACE评分极高危｜缺血高危｜缺血极高危&出血高危         4190    注射用比伐芦定 9   静脉注射

PCI手术:术前｜术中－PPCI策略2.1:急性非ST段抬高型心肌梗塞+GRACE评分:141+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前｜术中－PPCI策略2.2:急性非ST段抬高型心肌梗塞+GRACE评分高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
PCI手术:术前｜术中－PPCI策略2.3:急性非ST段抬高型心肌梗塞+GRACE评分极高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分极高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


PCI手术:术前｜术中－PPCI策略2.4:急性非ST段抬高型心肌梗塞+缺血高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术前｜术中－PPCI策略2.5:急性非ST段抬高型心肌梗塞+缺血极高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血极高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#######PCI手术 术后－抗血小板治疗   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞          8065    阿司匹林缓释片 10  口服  100mg   1日1次

PCI手术:术后－抗血小板治疗1.1:急性非ST段抬高型心肌梗塞 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－抗血小板治疗1.2:急性非ST段抬高型心肌梗塞 ,用药推荐包含: 替格瑞洛片 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－抗血小板治疗1.3:急性ST段抬高型心肌梗塞 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－抗血小板治疗1.4:急性ST段抬高型心肌梗塞 ,用药推荐包含:替格瑞洛片 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



########PCI手术:术后－降低心梗再发  急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞          7653    酒石酸美托洛尔片    12  口服
PCI手术:术后－降低心梗再发1.1:急性非ST段抬高型心肌梗塞 ,用药推荐包含:酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 盐酸索他洛尔片 盐酸普萘洛尔缓释胶囊 盐酸普萘洛尔片 盐酸普萘洛尔缓释片 阿替洛尔片 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔片 盐酸索他洛尔注射液 盐酸普萘洛尔注射液
    [Documentation]    断言:""
    ${assert}    Create List    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    盐酸索他洛尔片    盐酸普萘洛尔缓释胶囊    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    阿替洛尔片    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔片    盐酸索他洛尔注射液    盐酸普萘洛尔注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][3]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－降低心梗再发1.2:急性ST段抬高型心肌梗塞 ,用药推荐包含:酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 盐酸索他洛尔片 盐酸普萘洛尔缓释胶囊 盐酸普萘洛尔片 盐酸普萘洛尔缓释片 阿替洛尔片 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔片 盐酸索他洛尔注射液 盐酸普萘洛尔注射液
    [Documentation]    断言:""
    ${assert}    Create List    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    盐酸索他洛尔片    盐酸普萘洛尔缓释胶囊    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    阿替洛尔片    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔片    盐酸索他洛尔注射液    盐酸普萘洛尔注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][3]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#######PCI手术:术后－调脂  急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  冠心病     8095    阿托伐他汀钙片 13  口服  20mg    1日1次
PCI手术:术后－调脂1.1:急性非ST段抬高型心肌梗塞+冠心病 ,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 冠心病 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][4]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－调脂1.2:急性ST段抬高型心肌梗塞+冠心病 ,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
    [Documentation]    断言:""
    ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 冠心病 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][4]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#######PCI手术:术后－降压   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  高血压     5877    盐酸贝那普利片 14
PCI手术:术后－降压1.1:急性非ST段抬高型心肌梗塞+高血压 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 高血压 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－降压1.2:急性ST段抬高型心肌梗塞+高血压 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 高血压 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#######PCI手术:术后－降压   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  冠心病&心力衰竭        5877    盐酸贝那普利片 15
PCI手术:术后－降压2.1:急性非ST段抬高型心肌梗塞+冠心病+心力衰竭 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 冠心病 心力衰竭 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－降压2.2:急性ST段抬高型心肌梗塞+冠心病+心力衰竭 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 冠心病 心力衰竭 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#######PCI手术:术后－降糖   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  冠心病&心力衰竭        5877    盐酸贝那普利片 15
PCI手术:术后－降糖1.1:急性非ST段抬高型心肌梗塞+糖尿病 ,用药推荐包含: 胰岛素注射液
    [Documentation]    断言:""
    ${assert}    Create List    胰岛素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 糖尿病 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][6]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－降糖1.2:急性ST段抬高型心肌梗塞+糖尿病 ,用药推荐包含: 胰岛素注射液
    [Documentation]    断言:""
    ${assert}    Create List    胰岛素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 糖尿病 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][6]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#######保守策略:抗凝   抗凝    急性ST段抬高型心肌梗塞    出血高危｜出血极高危      6194    磺达肝癸钠注射液    17
保守策略:抗凝1.1:急性ST段抬高型心肌梗塞+出血高危 ,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝1.2:急性ST段抬高型心肌梗塞+出血极高危 ,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#####保守策略:抗凝   抗凝    急性ST段抬高型心肌梗塞    非出血高危      6194    磺达肝癸钠注射液    17
########保守策略:抗凝2.1:急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐包含: 依诺肝素钠注射液 注射用依诺肝素钠 磺达肝癸钠注射液
########    [Documentation]    断言:""
########    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    磺达肝癸钠注射液
########[Setup]    Run Keywords    获取时间戳#########
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断： Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
########    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
########    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
########    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
########    # List should contain sub list    ${aj}     ${assert}
########    Lists should Be Equal    ${aj}    ${assert}


######保守策略:抗凝   抗凝    急性非ST段抬高型心肌梗塞    GRACE评分>140｜GRACE评分高危｜GRACE评分极高危｜缺血极高危｜缺血高危&出血高危｜出血极高危      6194    磺达肝癸钠注射液    19
保守策略:抗凝3.1:急性非ST段抬高型心肌梗塞+GRACE评分:141 +出血高危 ,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:抗凝3.2:急性非ST段抬高型心肌梗塞+GRACE评分:140+出血高危 ,用药推荐"不"包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:140 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Should Not Contain    ${getRes['body']['therapeuticPlanList']}    ${assert}

保守策略:抗凝3.3:急性非ST段抬高型心肌梗塞+GRACE评分:140+出血极高危 ,用药推推"不"包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:140 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList']]
    # List should contain sub list    ${aj}     ${assert}
    Should Not Contain    ${getRes['body']['therapeuticPlanList']}    ${assert}

保守策略:抗凝3.4:急性非ST段抬高型心肌梗塞+GRACE评分:141+GRACE评分高危+出血高危,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 GRACE评分高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝3.5:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血极高危+出血高危,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血极高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝3.6:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血高危+出血高危,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝3.7:急性非ST段抬高型心肌梗塞+GRACE评分:141+GRACE评分高危+出血极高危,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 GRACE评分高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝3.8:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血极高危+出血极高危,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血极高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝3.9:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血高危+出血极高危,用药推荐包含: 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#####保守策略:抗凝  急性非ST段抬高型心肌梗塞   缺血中危&非出血高危      609 依诺肝素钠注射液    20
##### 保守策略:抗凝4.1:急性非ST段抬高型心肌梗塞+缺血中危+非出血高危 ,用药推荐包含: 依诺肝素钠注射液 注射用依诺肝素钠 磺达肝癸钠注射液
#####     [Documentation]    断言:""
#####     ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    磺达肝癸钠注射液
########[Setup]    Run Keywords    获取时间戳######
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 非出血高危 Objective: Assessment:诊断： Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#####     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#####     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#####     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#####     # List should contain sub list    ${aj}     ${assert}
#####     Lists should Be Equal    ${aj}    ${assert}



######保守策略:抗凝  急性非ST段抬高型心肌梗塞   缺血中危&出血高危｜出血极高危     6194    磺达肝癸钠注射液    22
保守策略:抗凝5.1:急性非ST段抬高型心肌梗塞+缺血中危+出血高危 ,用药推荐包含:磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:抗凝5.1:急性非ST段抬高型心肌梗塞+缺血中危+出血极高危 ,用药推荐包含:磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#####保守策略:双抗  急性ST段抬高型心肌梗塞    出血高危｜出血极高危      8065    阿司匹林缓释片 23  口服  100mg
####### 保守策略:双抗1.1:急性ST段抬高型心肌梗塞+出血高危 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
#######     [Documentation]    断言:""
#######     ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
########[Setup]    Run Keywords    获取时间戳########
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#######     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#######     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
#######     # List should contain sub list    ${aj}     ${assert}
#######     Lists should Be Equal    ${aj}    ${assert}
######
####### 保守策略:双抗1.2:急性ST段抬高型心肌梗塞+出血高危 ,用药推荐包含:硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
#######     [Documentation]    断言:""
#######     ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
########[Setup]    Run Keywords    获取时间戳########
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#######     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#######     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
#######     # List should contain sub list    ${aj}     ${assert}
#######     Lists should Be Equal    ${aj}    ${assert}
######
######
####### 保守策略:双抗1.3:急性ST段抬高型心肌梗塞+出血极高危 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
#######     [Documentation]    断言:""
#######     ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
########[Setup]    Run Keywords    获取时间戳########
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#######     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#######     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
#######     # List should contain sub list    ${aj}     ${assert}
#######     Lists should Be Equal    ${aj}    ${assert}
######
####### 保守策略:双抗1.4:急性ST段抬高型心肌梗塞+出血极高危 ,用药推荐包含:硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
#######     [Documentation]    断言:""
#######     ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
########[Setup]    Run Keywords    获取时间戳########
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#######     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#######     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
#######     # List should contain sub list    ${aj}     ${assert}
#######     Lists should Be Equal    ${aj}    ${assert}


#####保守策略:双抗  急性ST段抬高型心肌梗塞    非出血高危       8065    阿司匹林缓释片 25  口服  100mg
###### 保守策略:双抗2.1:急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
######     [Documentation]    断言:""
######     ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
########[Setup]    Run Keywords    获取时间戳#######
########...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
######     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
######     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
######     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
######     # List should contain sub list    ${aj}     ${assert}
######     Lists should Be Equal    ${aj}    ${assert}

######保守策略:双抗2.2:急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐包含:替格瑞洛片 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
######    [Documentation]    断言:""
######    ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
######    [Setup]    Run Keywords    获取时间戳    ...    AND    获取随机数
######    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
######    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
######    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
######    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
######    # List should contain sub list    ${aj}     ${assert}
######    Lists should Be Equal    ${aj}    ${assert}



#####保守策略:双抗   双抗    急性非ST段抬高型心肌梗塞    GRACE评分>140｜GRACE评分高危｜GRACE评分极高危｜缺血极高危｜缺血高危&出血高危｜出血极高危      6194    阿司匹林缓释片    19
保守策略:双抗3.1:急性非ST段抬高型心肌梗塞+GRACE评分:141 +出血高危 ,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.2:急性非ST段抬高型心肌梗塞+GRACE评分:141 +出血高危 ,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:双抗3.3:急性非ST段抬高型心肌梗塞+GRACE评分:140+出血高危 ,用药推荐"不"包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:140 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Should Not Contain    ${getRes['body']['therapeuticPlanList']}    ${assert}

保守策略:双抗3.4:急性非ST段抬高型心肌梗塞+GRACE评分:140+出血极高危 ,用药推推"不"包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:140 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList']]
    # List should contain sub list    ${aj}     ${assert}
    Should Not Contain    ${getRes['body']['therapeuticPlanList']}    ${assert}

保守策略:双抗3.4:急性非ST段抬高型心肌梗塞+GRACE评分:141+GRACE评分高危+出血高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 GRACE评分高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.5:急性非ST段抬高型心肌梗塞+GRACE评分:141+GRACE评分高危+出血高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 GRACE评分高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.6:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血极高危+出血高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血极高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.7:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血极高危+出血高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血极高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.8:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血高危+出血高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.9:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血高危+出血高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血高危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:双抗3.10:急性非ST段抬高型心肌梗塞+GRACE评分:141+GRACE评分高危+出血极高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 GRACE评分高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.11:急性非ST段抬高型心肌梗塞+GRACE评分:141+GRACE评分高危+出血极高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 GRACE评分高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.12:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血极高危+出血极高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血极高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.13:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血极高危+出血极高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血极高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:双抗3.14:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血高危+出血极高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗3.15:急性非ST段抬高型心肌梗塞+GRACE评分:141+缺血高危+出血极高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 GRACE评分:141 缺血高危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


######保守策略:双抗 急性非ST段抬高型心肌梗塞   缺血中危&非出血高危      8065    阿司匹林缓释片 29  口服  100mg


# 保守策略:双抗4.2: 急性非ST段抬高型心肌梗塞+缺血中危+非出血高危,用药推荐包含:替格瑞洛片 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
#     [Documentation]    断言:""
#     ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
#     [Setup]    Run Keywords    获取时间戳    ...    AND    获取随机数
#     ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

#####保守策略:双抗 急性非ST段抬高型心肌梗塞 缺血中危&出血高危｜出血极高危     8065    阿司匹林缓释片 31  口服  100mg
保守策略:双抗5.1: 急性非ST段抬高型心肌梗塞+缺血中危+出血高危,用药推荐33组包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗5.2: 急性非ST段抬高型心肌梗塞+缺血中危+出血高危,用药推荐34组包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:双抗5.3: 急性非ST段抬高型心肌梗塞+缺血中危+出血极高危,用药推荐包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗5.4: 急性非ST段抬高型心肌梗塞+缺血中危+出血极高危,用药推荐包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血中危 出血极高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#####保守策略:双抗 急性非ST段抬高型心肌梗塞 缺血低危&非出血高危      8065    阿司匹林缓释片 33  口服  300mg
保守策略:双抗6.1: 急性非ST段抬高型心肌梗塞+缺血低危+非出血高危,用药推荐组包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血低危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:双抗6.2: 急性非ST段抬高型心肌梗塞+缺血低危+非出血高危,用药推荐组包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性非ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 缺血低危 非出血高危 Objective: Assessment:诊断：急性非ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][1]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}







######保守策略:PPI治疗 急性ST段抬高型心肌梗塞｜急性非ST段抬高型心肌梗塞   出血高危｜出血极高危      4217    注射用泮托拉唑钠    35
保守策略:PPI治疗1.1 急性ST段抬高型心肌梗塞+出血高危 ,用药推荐组35包含: 注射用泮托拉唑钠 注射用兰索拉唑 注射用埃索美拉唑钠 注射用奥美拉唑钠 注射用雷贝拉唑钠 注射用奥美拉唑钠(静脉滴注)
    [Documentation]    断言:""
    ${assert}    Create List    注射用泮托拉唑钠    注射用兰索拉唑    注射用埃索美拉唑钠    注射用奥美拉唑钠    注射用雷贝拉唑钠    注射用奥美拉唑钠(静脉滴注)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:PPI治疗1.2 急性ST段抬高型心肌梗塞+出血极高危 ,用药推荐组35包含: 注射用泮托拉唑钠 注射用兰索拉唑 注射用埃索美拉唑钠 注射用奥美拉唑钠 注射用雷贝拉唑钠 注射用奥美拉唑钠(静脉滴注)
    [Documentation]    断言:""
    ${assert}    Create List    注射用泮托拉唑钠    注射用兰索拉唑    注射用埃索美拉唑钠    注射用奥美拉唑钠    注射用雷贝拉唑钠    注射用奥美拉唑钠(静脉滴注)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:PPI治疗1.3 急性非ST段抬高型心肌梗塞+出血高危 ,用药推荐组35包含: 注射用泮托拉唑钠 注射用兰索拉唑 注射用埃索美拉唑钠 注射用奥美拉唑钠 注射用雷贝拉唑钠 注射用奥美拉唑钠(静脉滴注)
    [Documentation]    断言:""
    ${assert}    Create List    注射用泮托拉唑钠    注射用兰索拉唑    注射用埃索美拉唑钠    注射用奥美拉唑钠    注射用雷贝拉唑钠    注射用奥美拉唑钠(静脉滴注)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:PPI治疗1.4 急性非ST段抬高型心肌梗塞+出血极高危 ,用药推荐组35包含: 注射用泮托拉唑钠 注射用兰索拉唑 注射用埃索美拉唑钠 注射用奥美拉唑钠 注射用雷贝拉唑钠 注射用奥美拉唑钠(静脉滴注)
    [Documentation]    断言:""
    ${assert}    Create List    注射用泮托拉唑钠    注射用兰索拉唑    注射用埃索美拉唑钠    注射用奥美拉唑钠    注射用雷贝拉唑钠    注射用奥美拉唑钠(静脉滴注)
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:PPI治疗1.5 急性ST段抬高型心肌梗塞+出血高危 ,用药推荐组36包含: 泮托拉唑肠溶片 泮托拉唑钠肠溶片 泮托拉唑钠肠溶胶囊 埃索美拉唑镁肠溶片 埃索美拉唑肠溶胶囊 兰索拉唑口崩片 兰索拉唑片 兰索拉唑肠溶胶囊 兰索拉唑胶囊 兰索拉唑肠溶片 奥美拉唑肠溶片 奥美拉唑肠溶胶囊 奥美拉唑钠肠溶片 奥美拉唑镁肠溶片 奥美拉唑碳酸氢钠胶囊 雷贝拉唑钠肠溶片 雷贝拉唑钠肠溶胶囊 奥美拉唑肠溶颗粒 艾普拉唑肠溶片
    [Documentation]    断言:""
    ${assert}    Create List    泮托拉唑肠溶片    泮托拉唑钠肠溶片    泮托拉唑钠肠溶胶囊    埃索美拉唑镁肠溶片    埃索美拉唑肠溶胶囊    兰索拉唑口崩片    兰索拉唑片    兰索拉唑肠溶胶囊    兰索拉唑胶囊    兰索拉唑肠溶片    奥美拉唑肠溶片    奥美拉唑肠溶胶囊    奥美拉唑钠肠溶片    奥美拉唑镁肠溶片    奥美拉唑碳酸氢钠胶囊    雷贝拉唑钠肠溶片    雷贝拉唑钠肠溶胶囊    奥美拉唑肠溶颗粒    艾普拉唑肠溶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

保守策略:PPI治疗1.6 急性ST段抬高型心肌梗塞+出血极高危 ,用药推荐组36包含: 泮托拉唑肠溶片 泮托拉唑钠肠溶片 泮托拉唑钠肠溶胶囊 埃索美拉唑镁肠溶片 埃索美拉唑肠溶胶囊 兰索拉唑口崩片 兰索拉唑片 兰索拉唑肠溶胶囊 兰索拉唑胶囊 兰索拉唑肠溶片 奥美拉唑肠溶片 奥美拉唑肠溶胶囊 奥美拉唑钠肠溶片 奥美拉唑镁肠溶片 奥美拉唑碳酸氢钠胶囊 雷贝拉唑钠肠溶片 雷贝拉唑钠肠溶胶囊 奥美拉唑肠溶颗粒 艾普拉唑肠溶片
    [Documentation]    断言:""
    ${assert}    Create List    泮托拉唑肠溶片    泮托拉唑钠肠溶片    泮托拉唑钠肠溶胶囊    埃索美拉唑镁肠溶片    埃索美拉唑肠溶胶囊    兰索拉唑口崩片    兰索拉唑片    兰索拉唑肠溶胶囊    兰索拉唑胶囊    兰索拉唑肠溶片    奥美拉唑肠溶片    奥美拉唑肠溶胶囊    奥美拉唑钠肠溶片    奥美拉唑镁肠溶片    奥美拉唑碳酸氢钠胶囊    雷贝拉唑钠肠溶片    雷贝拉唑钠肠溶胶囊    奥美拉唑肠溶颗粒    艾普拉唑肠溶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:PPI治疗1.7 急性非ST段抬高型心肌梗塞+出血高危 ,用药推荐组36包含: 泮托拉唑肠溶片 泮托拉唑钠肠溶片 泮托拉唑钠肠溶胶囊 埃索美拉唑镁肠溶片 埃索美拉唑肠溶胶囊 兰索拉唑口崩片 兰索拉唑片 兰索拉唑肠溶胶囊 兰索拉唑胶囊 兰索拉唑肠溶片 奥美拉唑肠溶片 奥美拉唑肠溶胶囊 奥美拉唑钠肠溶片 奥美拉唑镁肠溶片 奥美拉唑碳酸氢钠胶囊 雷贝拉唑钠肠溶片 雷贝拉唑钠肠溶胶囊 奥美拉唑肠溶颗粒 艾普拉唑肠溶片
    [Documentation]    断言:""
    ${assert}    Create List    泮托拉唑肠溶片    泮托拉唑钠肠溶片    泮托拉唑钠肠溶胶囊    埃索美拉唑镁肠溶片    埃索美拉唑肠溶胶囊    兰索拉唑口崩片    兰索拉唑片    兰索拉唑肠溶胶囊    兰索拉唑胶囊    兰索拉唑肠溶片    奥美拉唑肠溶片    奥美拉唑肠溶胶囊    奥美拉唑钠肠溶片    奥美拉唑镁肠溶片    奥美拉唑碳酸氢钠胶囊    雷贝拉唑钠肠溶片    雷贝拉唑钠肠溶胶囊    奥美拉唑肠溶颗粒    艾普拉唑肠溶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


保守策略:PPI治疗1.8 急性非ST段抬高型心肌梗塞+出血极高危 ,用药推荐组36包含: 泮托拉唑肠溶片 泮托拉唑钠肠溶片 泮托拉唑钠肠溶胶囊 埃索美拉唑镁肠溶片 埃索美拉唑肠溶胶囊 兰索拉唑口崩片 兰索拉唑片 兰索拉唑肠溶胶囊 兰索拉唑胶囊 兰索拉唑肠溶片 奥美拉唑肠溶片 奥美拉唑肠溶胶囊 奥美拉唑钠肠溶片 奥美拉唑镁肠溶片 奥美拉唑碳酸氢钠胶囊 雷贝拉唑钠肠溶片 雷贝拉唑钠肠溶胶囊 奥美拉唑肠溶颗粒 艾普拉唑肠溶片
    [Documentation]    断言:""
    ${assert}    Create List    泮托拉唑肠溶片    泮托拉唑钠肠溶片    泮托拉唑钠肠溶胶囊    埃索美拉唑镁肠溶片    埃索美拉唑肠溶胶囊    兰索拉唑口崩片    兰索拉唑片    兰索拉唑肠溶胶囊    兰索拉唑胶囊    兰索拉唑肠溶片    奥美拉唑肠溶片    奥美拉唑肠溶胶囊    奥美拉唑钠肠溶片    奥美拉唑镁肠溶片    奥美拉唑碳酸氢钠胶囊    雷贝拉唑钠肠溶片    雷贝拉唑钠肠溶胶囊    奥美拉唑肠溶颗粒    艾普拉唑肠溶片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性非ST段抬高型心肌梗塞 出血极高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}



######溶栓治疗:双抗 双抗   急性ST段抬高型心肌梗塞    非出血高危       8065    阿司匹林缓释片 37  嚼服  300mg
溶栓治疗:双抗1.1 急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐组37包含: 阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林咀嚼片 阿司匹林缓释胶囊
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林咀嚼片    阿司匹林缓释胶囊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

溶栓治疗:双抗1.2 急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐组38包含: 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

######溶栓治疗:溶栓  急性ST段抬高型心肌梗塞    非出血高危       4233    注射用瑞替普酶 39              静脉溶栓治疗时首剂瑞替普酶10MU静脉推注30分钟后静脉滴注瑞替普酶10MU
溶栓治疗:溶栓1.1 急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐组39包含:注射用瑞替普酶 注射用阿替普酶 注射用尿激酶 注射用重组人尿激酶原 注射用重组链激酶
    [Documentation]    断言:""
    ${assert}    Create List    注射用瑞替普酶    注射用阿替普酶     注射用尿激酶    注射用重组人尿激酶原    注射用重组链激酶
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#######溶栓治疗:抗凝  急性ST段抬高型心肌梗塞    非出血高危       561 低分子肝素钙注射液   40  静脉注射｜皮下注射
溶栓治疗:抗凝1.1 急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐组40包含:低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 达肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 依诺肝素钠注射液 注射用依诺肝素钠 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    依诺肝素钠注射液    注射用依诺肝素钠    磺达肝癸钠注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=    progressNoteList={"progressGuid": "22222","progressType":"3","progressMessage":"<XTextDocument><XElements><Element><Name>诊断</Name><InnerValue>Assessment:诊断：急性ST段抬高型心肌梗塞</InnerValue></Element></XElements><BodyText>Subjective:急性ST段抬高型心肌梗塞 非出血高危 Objective: Assessment:诊断：急性ST段抬高型心肌梗塞 Plan: </BodyText></XTextDocument>","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}
