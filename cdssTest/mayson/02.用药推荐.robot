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
#删除病程
# ...    deleteProgressNoteList={"progressGuid":"22325","progressType":"3","doctorGuid":"1000","recordTime":""}
*** Test Cases ***
######PCI手术:术前－抗血小板治疗  急性非ST段抬高型心肌梗塞     8065    阿司匹林缓释片 1   嚼服  100-300mg   顿服
# PCI手术:术前－抗血小板治疗1.1:急性非ST段抬高型心肌梗塞,分组1:用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林咀嚼片    阿司匹林缓释胶囊
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前－抗血小板治疗1.2:急性非ST段抬高型心肌梗塞,分组2:用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

#######PCI手术:术前－抗血小板治疗  急性ST段抬高型心肌梗塞     8065    阿司匹林缓释片 1   嚼服  100-300mg   顿服

# PCI手术:术前－抗血小板治疗1.1:急性ST段抬高型心肌梗塞,用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林咀嚼片    阿司匹林缓释胶囊
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前－抗血小板治疗1.2:急性ST段抬高型心肌梗塞,用药推荐包含:阿司匹林缓释片,阿司匹林肠溶片,阿司匹林肠溶缓释片,阿司匹林肠溶胶囊,阿司匹林咀嚼片,阿司匹林缓释胶囊
#     [Documentation]    断言:""
#     ${assert}    Create List    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


#######PCI手术:术前－调脂   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞          8095    阿托伐他汀钙片 6   口服  20mg    顿服
# PCI手术:术前－调脂1.1:急性非ST段抬高型心肌梗塞,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
#     [Documentation]    断言:""
#     ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前－调脂1.2:急性ST段抬高型心肌梗塞,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
#     [Documentation]    断言:""
#     ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][1]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########PCI手术:术前｜术中－PPCI策略    急性ST段抬高型心肌梗塞&非出血高危          4190    注射用比伐芦定 7   静脉注射
# PCI手术:术前｜术中－PPCI策略1.1:急性ST段抬高型心肌梗塞,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    注射用依诺肝素钠    达肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前｜术中－PPCI策略1.2:急性ST段抬高型心肌梗塞+出血高危,用药推荐包含:注射用比伐芦定
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}



########PCI手术:术前｜术中－PPCI策略    急性非ST段抬高型心肌梗塞&GRACE评分>140｜GRACE评分高危｜GRACE评分极高危｜缺血高危｜缺血极高危&出血高危         609 依诺肝素钠注射液    9   静脉注射｜皮下注射

# PCI手术:术前｜术中－PPCI策略2.1:急性非ST段抬高型心肌梗塞+GRACE评分:141+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
#     [Documentation]    断言:""
#     ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 GRACE评分:141 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前｜术中－PPCI策略2.2:急性非ST段抬高型心肌梗塞+GRACE评分高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
#     [Documentation]    断言:""
#     ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 GRACE评分高危 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}
# PCI手术:术前｜术中－PPCI策略2.3:急性非ST段抬高型心肌梗塞+GRACE评分极高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
#     [Documentation]    断言:""
#     ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 GRACE评分极高危 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


# PCI手术:术前｜术中－PPCI策略2.4:急性非ST段抬高型心肌梗塞+缺血高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
#     [Documentation]    断言:""
#     ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 缺血高危 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前｜术中－PPCI策略2.5:急性非ST段抬高型心肌梗塞+缺血极高危+非出血高危,用药推荐包含:依诺肝素钠注射液 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液 注射用比伐芦定
#     [Documentation]    断言:""
#     ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液    注射用比伐芦定
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 缺血极高危 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

#####PCI手术:急性非ST段抬高型心肌梗塞&GRACE评分>140｜GRACE评分高危｜GRACE评分极高危｜缺血高危｜缺血极高危&出血高危         4190    注射用比伐芦定 9   静脉注射

# PCI手术:术前｜术中－PPCI策略2.1:急性非ST段抬高型心肌梗塞+GRACE评分:141+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 GRACE评分:141 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前｜术中－PPCI策略2.2:急性非ST段抬高型心肌梗塞+GRACE评分高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 GRACE评分高危 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}
# PCI手术:术前｜术中－PPCI策略2.3:急性非ST段抬高型心肌梗塞+GRACE评分极高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 GRACE评分极高危 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


# PCI手术:术前｜术中－PPCI策略2.4:急性非ST段抬高型心肌梗塞+缺血高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 缺血高危 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术前｜术中－PPCI策略2.5:急性非ST段抬高型心肌梗塞+缺血极高危+非出血高危,用药推荐包含:注射用比伐芦定 注射用依诺肝素钠 低分子肝素钙注射液 注射用低分子量肝素钙 低分子量肝素钙注射液 低分子肝素钠注射液 注射用低分子量肝素钠 低分子量肝素钠注射液 依诺肝素钠注射液 那屈肝素钙注射液 那曲肝素钙注射液 注射用那屈肝素钙 贝米肝素钠注射液 肝素钙注射液 注射用肝素钙 肝素钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    注射用比伐芦定    注射用依诺肝素钠    低分子肝素钙注射液    注射用低分子量肝素钙    低分子量肝素钙注射液    低分子肝素钠注射液    注射用低分子量肝素钠    低分子量肝素钠注射液    依诺肝素钠注射液    那屈肝素钙注射液    那曲肝素钙注射液    注射用那屈肝素钙    贝米肝素钠注射液    肝素钙注射液    注射用肝素钙    肝素钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 缺血极高危 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

########PCI手术 术后－抗血小板治疗   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞          8065    阿司匹林缓释片 10  口服  100mg   1日1次

PCI手术:术后－抗血小板治疗1.1:急性非ST段抬高型心肌梗塞 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊 替格瑞洛片 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

PCI手术:术后－抗血小板治疗1.2:急性ST段抬高型心肌梗塞 ,用药推荐包含:阿司匹林缓释片 阿司匹林肠溶片 阿司匹林肠溶缓释片 阿司匹林肠溶胶囊 阿司匹林缓释胶囊 替格瑞洛片 硫酸氢氯吡格雷片 硫酸氢氯吡格雷颗粒
    [Documentation]    断言:""
    ${assert}    Create List    阿司匹林缓释片    阿司匹林肠溶片    阿司匹林肠溶缓释片    阿司匹林肠溶胶囊    阿司匹林缓释胶囊    替格瑞洛片    硫酸氢氯吡格雷片    硫酸氢氯吡格雷颗粒
    [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][2]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#########PCI手术:术后－降低心梗再发  急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞          7653    酒石酸美托洛尔片    12  口服
# PCI手术:术后－降低心梗再发1.1:急性非ST段抬高型心肌梗塞 ,用药推荐包含:酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 盐酸索他洛尔片 盐酸普萘洛尔缓释胶囊 盐酸普萘洛尔片 盐酸普萘洛尔缓释片 阿替洛尔片 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔片 盐酸索他洛尔注射液 盐酸普萘洛尔注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    盐酸索他洛尔片    盐酸普萘洛尔缓释胶囊    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    阿替洛尔片    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔片    盐酸索他洛尔注射液    盐酸普萘洛尔注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][3]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术后－降低心梗再发1.2:急性ST段抬高型心肌梗塞 ,用药推荐包含:酒石酸美托洛尔片 酒石酸美托洛尔胶囊 酒石酸美托洛尔控释片 酒石酸美托洛尔缓释片 琥珀酸美托洛尔缓释片 盐酸索他洛尔片 盐酸普萘洛尔缓释胶囊 盐酸普萘洛尔片 盐酸普萘洛尔缓释片 阿替洛尔片 富马酸比索洛尔片 富马酸比索洛尔胶囊 盐酸倍他洛尔片 盐酸索他洛尔注射液 盐酸普萘洛尔注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    酒石酸美托洛尔片    酒石酸美托洛尔胶囊    酒石酸美托洛尔控释片    酒石酸美托洛尔缓释片    琥珀酸美托洛尔缓释片    盐酸索他洛尔片    盐酸普萘洛尔缓释胶囊    盐酸普萘洛尔片    盐酸普萘洛尔缓释片    阿替洛尔片    富马酸比索洛尔片    富马酸比索洛尔胶囊    盐酸倍他洛尔片    盐酸索他洛尔注射液    盐酸普萘洛尔注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][3]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########PCI手术:术后－调脂  急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  冠心病     8095    阿托伐他汀钙片 13  口服  20mg    1日1次
# PCI手术:术后－调脂1.1:急性非ST段抬高型心肌梗塞+冠心病 ,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
#     [Documentation]    断言:""
#     ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 冠心病 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][4]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术后－调脂1.2:急性ST段抬高型心肌梗塞+冠心病 ,用药推荐包含:阿托伐他汀钙片 阿托伐他汀钙胶囊 阿托伐他汀钙分散片 瑞舒伐他汀钙片 瑞舒伐他汀钙胶囊 瑞舒伐他汀钙分散片 匹伐他汀钙片 氟伐他汀钠胶囊 氟伐他汀钠缓释片 普伐他汀钠片 普伐他汀钠胶囊 普伐他汀钠胶囊 洛伐他汀颗粒 辛伐他汀片 辛伐他汀咀嚼片 辛伐他汀胶囊 辛伐他汀分散片 辛伐他汀滴丸 依折麦布辛伐他汀片
#     [Documentation]    断言:""
#     ${assert}    Create List    阿托伐他汀钙片    阿托伐他汀钙胶囊    阿托伐他汀钙分散片    瑞舒伐他汀钙片    瑞舒伐他汀钙胶囊    瑞舒伐他汀钙分散片    匹伐他汀钙片    氟伐他汀钠胶囊    氟伐他汀钠缓释片    普伐他汀钠片    普伐他汀钠胶囊    普伐他汀钠胶囊    洛伐他汀颗粒    辛伐他汀片    辛伐他汀咀嚼片    辛伐他汀胶囊    辛伐他汀分散片    辛伐他汀滴丸    依折麦布辛伐他汀片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 冠心病 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][4]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########PCI手术:术后－降压   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  高血压     5877    盐酸贝那普利片 14
# PCI手术:术后－降压1.1:急性非ST段抬高型心肌梗塞+高血压 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
#     [Documentation]    断言:""
#     ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 高血压 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术后－降压1.2:急性ST段抬高型心肌梗塞+高血压 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
#     [Documentation]    断言:""
#     ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 高血压 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

########PCI手术:术后－降压   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  冠心病&心力衰竭        5877    盐酸贝那普利片 15
# PCI手术:术后－降压2.1:急性非ST段抬高型心肌梗塞+冠心病+心力衰竭 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
#     [Documentation]    断言:""
#     ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 冠心病 心力衰竭 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术后－降压2.2:急性ST段抬高型心肌梗塞+冠心病+心力衰竭 ,用药推荐包含: 盐酸贝那普利片 盐酸贝那普利胶囊 福辛普利钠片 福辛普利钠胶囊 盐酸咪达普利片 赖诺普利片 赖诺普利胶囊 培哚普利片 雷米普利片 西拉普利片 马来酸依那普利片 马来酸依那普利胶囊 马来酸依那普利口腔崩解片 马来酸依那普利分散片 卡托普利片 卡托普利滴丸 卡托普利胶囊 卡托普利缓释片 厄贝沙坦片 厄贝沙坦分散片 厄贝沙坦胶囊 厄贝沙坦颗粒 缬沙坦片 缬沙坦分散片 缬沙坦胶囊 氯沙坦钾片 氯沙坦钾胶囊 坎地沙坦酯片 坎地沙坦酯分散片 坎地沙坦酯胶囊 替米沙坦片 替米沙坦胶囊 替米沙坦分散片 奥美沙坦酯片 奥美沙坦酯胶囊 依普沙坦片
#     [Documentation]    断言:""
#     ${assert}    Create List    盐酸贝那普利片    盐酸贝那普利胶囊    福辛普利钠片    福辛普利钠胶囊    盐酸咪达普利片    赖诺普利片    赖诺普利胶囊    培哚普利片    雷米普利片    西拉普利片    马来酸依那普利片    马来酸依那普利胶囊    马来酸依那普利口腔崩解片    马来酸依那普利分散片    卡托普利片    卡托普利滴丸    卡托普利胶囊    卡托普利缓释片    厄贝沙坦片    厄贝沙坦分散片    厄贝沙坦胶囊    厄贝沙坦颗粒    缬沙坦片    缬沙坦分散片    缬沙坦胶囊    氯沙坦钾片    氯沙坦钾胶囊    坎地沙坦酯片    坎地沙坦酯分散片    坎地沙坦酯胶囊    替米沙坦片    替米沙坦胶囊    替米沙坦分散片    奥美沙坦酯片    奥美沙坦酯胶囊    依普沙坦片
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 冠心病 心力衰竭 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][5]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

########PCI手术:术后－降糖   急性非ST段抬高型心肌梗塞｜急性ST段抬高型心肌梗塞  冠心病&心力衰竭        5877    盐酸贝那普利片 15
# PCI手术:术后－降糖1.1:急性非ST段抬高型心肌梗塞+糖尿病 ,用药推荐包含: 胰岛素注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    胰岛素注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性非ST段抬高型心肌梗塞 糖尿病 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][0]['matchMedications'][6]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# PCI手术:术后－降糖1.2:急性ST段抬高型心肌梗塞+糖尿病 ,用药推荐包含: 胰岛素注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    胰岛素注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 糖尿病 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][6]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}


########保守策略:抗凝   抗凝    急性ST段抬高型心肌梗塞    出血高危｜出血极高危      6194    磺达肝癸钠注射液    17
# 保守策略:抗凝1.1:急性ST段抬高型心肌梗塞+出血高危 ,用药推荐包含: 磺达肝癸钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    磺达肝癸钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

# 保守策略:抗凝1.2:急性ST段抬高型心肌梗塞+出血极高危 ,用药推荐包含: 磺达肝癸钠注射液
#     [Documentation]    断言:""
#     ${assert}    Create List    磺达œ癸钠注射液
#     [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 出血极高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
#     ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
#     ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
#     ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][1]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
#     # List should contain sub list    ${aj}     ${assert}
#     Lists should Be Equal    ${aj}    ${assert}

########保守策略:抗凝   抗凝    急性ST段抬高型心肌梗塞    非出血高危      6194    磺达肝癸钠注射液    17
保守策略:抗凝2.1:急性ST段抬高型心肌梗塞+非出血高危 ,用药推荐包含: 依诺肝素钠注射液 注射用依诺肝素钠 磺达肝癸钠注射液
    [Documentation]    断言:""
    ${assert}    Create List    依诺肝素钠注射液    注射用依诺肝素钠    磺达肝癸钠注射液
    [Setup]    智能推荐    userGuid=10116081    serialNumber=10116081    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}    definiteDiagnosis=    progressNoteList={"progressGuid": "22325","progressType":"3","progressMessage":"<XTextDocument><BodyText> 急性ST段抬高型心肌梗塞 非出血高危 </BodyText></XTextDocument>","doctorGuid": "1000","recordTime": ""}    deleteProgressNoteList={}    labTestList=    examinationList=
    ${getRes}    用药推荐    userGuid=10116081    serialNumber=10116081
    ...    patientInfo={"gender":0,"age":"65","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "36.5","heartRate": "76","lowBldPress": 86,"highBldPress": "120"}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

