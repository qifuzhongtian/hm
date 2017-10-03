*** Settings ***
# Suite Setup    获取时间戳
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
*** Variables ***

*** Test Cases ***

###############################################推荐检查####################################################
### 主要条件                                                                                      次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######64L 脑梗死｜TIA｜短暂性脑缺血发作｜脑缺血表现      脑出血 头颅CT平扫  诊断脑卒中首选的影像学检查方法 确诊检查        是
#######64L 脑梗死 TIA 短暂性脑缺血发作 脑缺血表现      脑出血 头颅CT平扫  诊断脑卒中首选的影像学检查方法 确诊检查        是
推荐检查1.1 主要条件:脑梗死,推荐检查包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅CT平扫

推荐检查1.2 主要条件:短暂性脑缺血发作,推荐检查包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅CT平扫


推荐检查1.3 主要条件:怀疑短暂性脑缺血发作,推荐检查包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    怀疑短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅CT平扫


推荐检查1.4 主要条件:怀疑脑梗死,推荐检查包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅CT平扫



推荐检查1.5 主要条件:脑梗死｜短暂性脑缺血发作｜脑缺血表现+否定条件:脑出血,推荐检查"不应"包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 脑缺血表现 脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    头颅CT平扫
    # Should Not Contain    ${getRes['body']}    examinationRecommendList


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######65L 脑梗死｜短暂性脑缺血发作｜脑缺血表现      脑出血 凝血功能  诊断脑卒中首选的影像学检查方法 确诊检查        是
#######65L 脑梗死 短暂性脑缺血发作 脑缺血表现      脑出血 凝血功能  诊断脑卒中首选的影像学检查方法 确诊检查        是
推荐检查2.1 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死,推荐检查包含:凝血功能
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    凝血功能

推荐检查2.2 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死+否定条件:脑出血,推荐检查"不应"包含:凝血功能
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死 脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    凝血功能
    # Should Not Contain    ${getRes['body']}    examinationRecommendList


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######66L 脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死      脑出血 血常规  诊断脑卒中首选的影像学检查方法 确诊检查        是
#######66L 脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死      脑出血 血常规  诊断脑卒中首选的影像学检查方法 确诊检查        是
推荐检查3.1 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死,推荐检查包含:血常规
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规

推荐检查3.2 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死+否定条件:脑出血,推荐检查"不应"包含:血常规
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死 脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    血常规
    # Should Not Contain    ${getRes['body']}    examinationRecommendList




### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######67L 脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死      脑出血 心电图  诊断脑卒中首选的影像学检查方法 确诊检查        是
推荐检查4.1 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死,推荐检查包含:心电图
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    心电图

####推荐检查4.2 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死+否定条件:脑出血,推荐检查"不应"包含:心电图
####    [Documentation]    断言:""
####    ${timestamp}    Get Time    epoch
####    ${Assessment}    Set Variable
####    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死 脑出血
####    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
####    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
####    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
####    ...    definiteDiagnosis=
####    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
####    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
####    ...    labTestList=
####    ...    examinationList=
####    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
####    Should Not Contain    ${aj}    心电图
####    # Should Not Contain    ${getRes['body']}    examinationRecommendList


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######68L 脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死      脑出血 胸部X线片  诊断脑卒中首选的影像学检查方法 确诊检查        是
推荐检查5.1 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死,推荐检查包含:胸部X线片
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    胸部X线片

######推荐检查5.2 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死+否定条件:脑出血,推荐检查"不应"包含:胸部X线片
######    [Documentation]    断言:""
######    ${timestamp}    Get Time    epoch
######    ${Assessment}    Set Variable
######    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死 脑出血
######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
######    ...    definiteDiagnosis=
######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
######    ...    labTestList=
######    ...    examinationList=
######    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
######    Should Not Contain    ${aj}    胸部X线片
######    # Should Not Contain    ${getRes['body']}    examinationRecommendList


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######69L 脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死      脑出血 血糖  诊断脑卒中首选的影像学检查方法 确诊检查        是
推荐检查6.1 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死,推荐检查包含:血糖
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血糖

推荐检查6.2 主要条件:脑梗死｜短暂性脑缺血发作｜怀疑短暂性脑缺血发作｜怀疑脑梗死+否定条件:脑出血,推荐检查"不应"包含:血糖
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死 脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    血糖
    # Should Not Contain    ${getRes['body']}    examinationRecommendList



### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######70L 短暂性脑缺血发作              血电解质        一般检查        是
推荐检查7.1 主要条件:短暂性脑缺血发作,推荐检查包含:血电解质
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血电解质


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######71L 短暂性脑缺血发作              肾功能     一般检查        是
推荐检查8.1 主要条件:短暂性脑缺血发作,推荐检查包含:肾功能
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    肾功能


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######72L 短暂性脑缺血发作              血脂      一般检查        是
推荐检查9.1 主要条件:短暂性脑缺血发作,推荐检查包含:血脂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血脂



### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######73L 短暂性脑缺血发作              脑血管成像技术(CTA)    可发现重要的颅内外血管病变   鉴别检查        是
推荐检查10.1 主要条件:短暂性脑缺血发作,推荐检查包含:脑血管成像技术(CTA)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    脑血管成像技术(CTA)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######74L 短暂性脑缺血发作              脑磁共振血管成像 (MRA)  可发现重要的颅内外血管病变   鉴别检查        是
推荐检查11.1 主要条件:短暂性脑缺血发作,推荐检查包含:脑磁共振血管成像 (MRA)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    脑磁共振血管成像 (MRA)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######75L 短暂性脑缺血发作              颈部血管超声  可发现重要的颅内外血管病变   鉴别检查        是
推荐检查12.1 主要条件:短暂性脑缺血发作,推荐检查包含:颈部血管超声
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    颈部血管超声

### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######76L 短暂性脑缺血发作              全脑血管造影(DSA)     颈动脉内膜剥脱术(CEA)和颈动脉支架治疗(CAS)术前评估的金标准。同时评估侧支循环代偿及脑血流储备 术前检查        是
推荐检查13.1 主要条件:短暂性脑缺血发作,推荐检查包含:全脑血管造影(DSA)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    全脑血管造影(DSA)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######77L 短暂性脑缺血发作              脑灌注成像   评估侧支循环代偿及脑血流储备  鉴别检查        是
推荐检查14.1 主要条件:短暂性脑缺血发作,推荐检查包含:脑灌注成像
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    脑灌注成像


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######78L 短暂性脑缺血发作              经颅彩色多普勒超声(TCD)  评估侧支循环代偿及脑血流储备  鉴别检查        是
推荐检查15.1 主要条件:短暂性脑缺血发作,推荐检查包含:经颅彩色多普勒超声(TCD)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    经颅彩色多普勒超声(TCD)

### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######79L 短暂性脑缺血发作&<=45岁    短暂性脑缺血发作 age=45岁 短暂性脑缺血发作 age=4$岁            超声心动图       合并症检查       是
推荐检查16.1 主要条件:短暂性脑缺血发作&age=45岁,推荐检查包含:超声心动图
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"45","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    超声心动图

推荐检查16.2 主要条件:短暂性脑缺血发作&age=44岁,推荐检查包含:超声心动图
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"44","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    超声心动图

推荐检查16.3 主要条件:短暂性脑缺血发作&age>45岁,推荐检查"不应"包含:超声心动图
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"46","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Not Contain    ${aj}    超声心动图
    # Should Not Contain    ${getRes['body']}    examinationRecommendList


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######80L 短暂性脑缺血发作              经食道超声心动图(TEE)       合并症检查       是
推荐检查17.1 主要条件:短暂性脑缺血发作,推荐检查包含:经食道超声心动图(TEE)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    经食道超声心动图(TEE)

### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######81L 脑出血              头颅CT平扫  诊断脑卒中首选的影像学检查方法，发病3小时内行首次头部CT患者，应于发病后8小时，最迟24小时内再次复查头部CT    确诊检查        是
推荐检查18.1 主要条件:脑出血,推荐检查包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅CT平扫


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######82L 脑出血              CT脑灌注成像(CTP)    CTP能够反映ICH后脑组织的血供变化，了解血肿周边血流灌注情况    鉴别检查        是
推荐检查19.1 主要条件:脑出血,推荐检查包含:CT脑灌注成像(CTP)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    CT脑灌注成像(CTP)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######83L 脑出血              脑血管成像技术(CTA)    可用于筛查可存在的脑血管畸形，动脉瘤，动静脉窦 鉴别检查        是
推荐检查20.1 主要条件:脑出血,推荐检查包含:脑血管成像技术(CTA)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    脑血管成像技术(CTA)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######84L 脑出血              脑磁共振血管成像 (MRA)      鉴别检查        是
推荐检查21.1 主要条件:脑出血,推荐检查包含:脑磁共振血管成像(MRA)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    脑磁共振血管成像 (MRA)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######85L 脑出血              CTV     鉴别检查        是
推荐检查22.1 主要条件:脑出血,推荐检查包含:CTV
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    CTV


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######86L 脑出血              MRV     鉴别检查        是
推荐检查23.1 主要条件:脑出血,推荐检查包含:MRV
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    MRV


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######87L 脑出血              全脑血管造影(DSA)     血管病变检查的重要方法和金标准 鉴别检查        是
推荐检查24.1 主要条件:脑出血,推荐检查包含:全脑血管造影(DSA)
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    全脑血管造影(DSA)


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######88L 脑出血              血常规     一般检查        是
推荐检查25.1 主要条件:脑出血,推荐检查包含:血常规
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血常规


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######89L 脑出血              血生化     一般检查        是
推荐检查26.1 主要条件:脑出血,推荐检查包含:血生化
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血生化


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######90L 脑出血              凝血功能        一般检查        是
推荐检查27.1 主要条件:脑出血,推荐检查包含:凝血功能
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    凝血功能


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######91L 脑出血              输血前检查       一般检查        是
推荐检查28.1 主要条件:脑出血,推荐检查包含:输血前检查
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    输血前检查


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######92L 脑出血              心电图     一般检查        是
推荐检查29.1 主要条件:脑出血,推荐检查包含:心电图
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    心电图


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######93L 20170919         脑出血         胸部X线片       一般检查        是
推荐检查30.1 主要条件:脑出血,推荐检查包含:胸部X线片
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    胸部X线片


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######94L 20170919         帕金森         全血细胞计数      一般检查        是
推荐检查31.1 主要条件:帕金森,推荐检查包含:全血细胞计数
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    全血细胞计数


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######95L 20170919         帕金森         血钙      一般检查        是
推荐检查32.1 主要条件:帕金森,推荐检查包含:血钙
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血钙

### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######96L 20170919         帕金森         促甲状腺激素      一般检查        是
推荐检查33.1 主要条件:帕金森,推荐检查包含:促甲状腺激素
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    促甲状腺激素

### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######97L 20170919         帕金森         维生素B12      一般检查        是
推荐检查34.1 主要条件:帕金森,推荐检查包含:维生素B12
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    维生素B12

### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######98L 20170919 <50 岁   帕金森         血浆铜蓝蛋白      鉴别检查        是
推荐检查35.1 主要条件:age=49岁+帕金森,推荐检查包含:血浆铜蓝蛋白
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"49","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    血浆铜蓝蛋白

推荐检查35.2 主要条件:age=50岁+帕金森,推荐检查"不应"包含:血浆铜蓝蛋白
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"50","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    # Should Contain    ${aj}    血浆铜蓝蛋白
    Should Not Contain    ${aj}    血浆铜蓝蛋白
    # Should Not Contain    ${getRes['body']}    examinationRecommendList




### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######99L 20170919 <50 岁   帕金森         血浆铜蓝蛋白      鉴别检查        是
推荐检查36.1 主要条件:帕金森,推荐检查包含:头颅MRI
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅MRI


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######100L 20170919            帕金森         头颅CT平扫      鉴别检查        是
推荐检查37.1 主要条件:帕金森,推荐检查包含:头颅CT平扫
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    头颅CT平扫


### 主要条件 次要条件    否定条件    推荐检查    备注文案，包括注意及推荐理由  推荐检查类型  检查ID    是否新增
#######101L 20170919            帕金森         DaTscan     确诊检查        是
推荐检查38.1 主要条件:帕金森,推荐检查包含:DaTscan
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Should Contain    ${aj}    DaTscan


########################################推荐评分表##########################################################
#####推荐评分表17L     20170919   脑梗死｜短暂性脑缺血发作｜脑缺血表现      NIH卒中量表     是
##### 脑梗死 短暂性脑缺血发作 怀疑短暂性脑缺血发作 怀疑脑梗死
推荐评分表1.1 病历内容:脑梗死,推荐诊断包含:NIH卒中量表
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     NIH卒中量表

推荐评分表1.2 病历内容:短暂性脑缺血发作,推荐诊断包含:NIH卒中量表
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     NIH卒中量表


推荐评分表1.3 病历内容:短暂性脑缺血发作,推荐诊断包含:NIH卒中量表
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    怀疑短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     NIH卒中量表


推荐评分表1.4 病历内容:怀疑脑梗死,推荐诊断包含:NIH卒中量表
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    怀疑怀疑脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     NIH卒中量表






#####数据版本   主要条件    否定条件    评分表 备注  是否新增
#####推荐评分表18L    20170919   脑梗死     卒中静脉溶栓禁忌        是
推荐评分表2.1 病历内容:脑梗死,推荐诊断包含:卒中静脉溶栓禁忌
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     卒中静脉溶栓禁忌


#####数据版本   主要条件    否定条件    评分表 备注  是否新增
#####推荐评分表19L  20170919 短暂性脑缺血发作        ABCD2评分 短暂性脑缺血发作患者推荐进行ABCD2评分来危险分层，已知有高度颈动脉狭窄或房颤的患者中，短暂性脑缺血发作后卒中风险更高    是
推荐评分表3.1 病历内容:短暂性脑缺血发作,推荐诊断包含:ABCD2评分
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     ABCD2评分


#####数据版本   主要条件    否定条件    评分表 备注  是否新增
#####推荐评分表20L  20170919 营养风险筛查2002(NRS)>=3分     营养风险筛查2002 (NRS)        是
推荐评分表4.1 病历内容:营养风险筛查2002(NRS)>=3分,推荐诊断包含:营养风险筛查2002 (NRS)
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    营养风险筛查2002(NRS):3
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     营养风险筛查2002 (NRS)

#####数据版本   主要条件    否定条件    评分表 备注  是否新增
#####推荐评分表21L  20170919 营养风险筛查2002(NRS)<3分      营养风险筛查2002 (NRS)    每周复查营养评定    是
推荐评分表5.1 病历内容:营养风险筛查2002(NRS)<3分,推荐诊断包含:营养风险筛查2002 (NRS)
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    营养风险筛查2002(NRS):2
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     营养风险筛查2002 (NRS)

#####数据版本   主要条件    否定条件    评分表 备注  是否新增
#####推荐评分表22L  20170919 疼痛      疼痛评分        是
推荐评分表6.1 病历内容:疼痛,推荐诊断包含:疼痛评分
    [Documentation]    ""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    疼痛
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Should Contain    ${aj}     疼痛评分


#####数据版本   主要条件    否定条件    评分表 备注  是否新增
#####推荐评分表23L  20170919 首日病程｜大手术后｜情况恶化  压疮(Braden)评分>=0 压疮(Braden)评分        删
#####推荐评分表6.1 病历内容:首日病程｜大手术后｜情况恶化,推荐诊断包含:压疮(Braden)评分
#####    [Documentation]    ""
#####    ${timestamp}    Get Time    epoch
#####    ${Assessment}    Set Variable
#####    ${Subjective}    Set Variable    首日病程 大手术后 情况恶化
#####    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#####    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#####    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#####    ...    definiteDiagnosis=
#####    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#####    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#####    ...    labTestList=
#####    ...    examinationList=
#####    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#####    Should Contain    ${aj}     压疮(Braden)评分
#####
#####推荐评分表6.2 病历内容:首日病程｜大手术后｜情况恶化+否定条件:压疮(Braden)评分>=0,推荐诊断包含:压疮(Braden)评分
#####    [Documentation]    ""
#####    ${timestamp}    Get Time    epoch
#####    ${Assessment}    Set Variable
#####    ${Subjective}    Set Variable    首日病程 大手术后 情况恶化 压疮(Braden)评分:0
#####    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#####    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#####    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#####    ...    definiteDiagnosis=
#####    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#####    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#####    ...    labTestList=
#####    ...    examinationList=
#####    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
#####    Should Contain    ${aj}     压疮(Braden)评分
#####    # Should Not Contain    ${getRes['body']}    examinationRecommendList

######################################推荐治疗方案##########################################################
#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案75l 20170919 脑梗死 脑梗死     卒中静脉溶栓禁忌    静脉溶栓    溶栓治疗是目前最重要的恢复血流措施，有效抢救半暗带组织的时间窗为4.5h内或6h内       是

推荐治疗方案1.1 主要条件:脑梗死,推荐血运重建方案:静脉溶栓
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     静脉溶栓

推荐治疗方案1.2 主要条件:脑梗死+否定条件:卒中静脉溶栓禁忌,"不应"推荐血运重建方案:静脉溶栓
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死 头颅外伤:90天 卒中:90天 可疑蛛网膜下腔出血 不易压迫止血部位的动脉穿刺:6天 既往有颅内出血 颅内肿瘤 动静脉畸形 动脉瘤 颅内手术:30天 椎管内手术:30天 血压升高 收缩压:180mmHg 舒张压:100mmHg 活动性内出血 急性出血倾向 血小板计数:99 109/L 肝素治疗:48小时 APTT:增高 INR:1.8 PT:16s 空腹血糖:2.6mmol/L 多脑叶梗死 低密度影:1/2大脑半球 股动脉穿刺:7天 消化道出血 胃出血 颅内出血 脑出血 低血糖
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     静脉溶栓
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案76l 20170919   脑梗死 脑梗死         血管内介入   不适合静脉溶栓，或静脉溶栓无效的大动脉闭塞患者，推荐血管内介入治疗，包括：动脉溶栓、桥接、机械取栓、血管成形盒支架术  无   是

推荐治疗方案2.1 主要条件:脑梗死,推荐血运重建方案:血管内介入
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内介入

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案77l 20170919   脑梗死 脑梗死         抗血小板治疗  不适合溶栓的患者应在发病后尽早给予抗血小板治疗；同时溶栓治疗者，抗血小板药物应在溶栓24h后开始使用      是
推荐治疗方案3.1 主要条件:脑梗死,推荐血运重建方案:抗血小板治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗血小板治疗

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案78l 20170919   脑梗死 脑梗死     、   抗凝治疗    抗凝治疗的时机应取决于梗死灶的大小和发生出血性转化风险的高低。用于急性短暂性脑缺血发作或卒中伴疑似心源性栓塞或动脉夹层时，需平衡短期复发风险和出血风险；存在大面积急性梗死提示有发生出血性转化的风险，应推迟抗凝治疗。     是
推荐治疗方案4.1 主要条件:脑梗死,推荐血运重建方案:抗凝治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗凝治疗

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案79l 20170919   脑梗死 脑梗死&颅内压增高｜脑水肿           降颅压治疗           是
推荐治疗方案5.1 主要条件:脑梗死 颅内压增高,推荐血运重建方案:降颅压治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     降颅压治疗

推荐治疗方案5.2 主要条件:脑梗死 脑水肿,推荐血运重建方案:降颅压治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死 脑水肿
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     降颅压治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案80l 20170919   脑梗死 脑梗死         改善循环及脑保护    防治脑水肿，改善高血凝及脑血循环        是
推荐治疗方案6.1 主要条件:脑梗死,推荐血运重建方案:改善循环及脑保护
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable    脑梗死
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     改善循环及脑保护


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案84l 20170919   短暂性脑缺血发作    ABCD2评分>=4&短暂性脑缺血发作         住院治疗    患者ABCD2评分>=4分，建议住院治疗    无   是
推荐治疗方案7.1 主要条件:ABCD2评分==4&短暂性脑缺血发作,推荐血运重建方案:住院治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    ABCD2评分:4 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     住院治疗

推荐治疗方案7.2 主要条件:ABCD2评分>4&短暂性脑缺血发作,推荐血运重建方案:住院治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    ABCD2评分:5 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     住院治疗

推荐治疗方案7.3 主要条件:ABCD2评分<4&短暂性脑缺血发作,"不应"推荐血运重建方案:住院治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    ABCD2评分:3 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     住院治疗
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案85l 20170919   短暂性脑缺血发作    非心源性短暂性脑缺血发作            抗血小板治疗  对于非心源性短暂性脑缺血发作患者,建议给予口服抗血小板药物而非抗凝药物，预防脑卒中复发及其他心血管事件的发生      是
推荐治疗方案8.1 主要条件:ABCD2评分==4&短暂性脑缺血发作,推荐血运重建方案:抗血小板治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    非心源性短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗血小板治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案86l 20170919   短暂性脑缺血发作    短暂性脑缺血发作        非风湿性二尖瓣病变｜局部主动脉弓病变｜二尖瓣环钙化｜二尖瓣脱垂｜风湿性二尖瓣病变｜左室附壁血栓｜急性心肌梗死｜房颤   抗血小板治疗  对于非心源性短暂性脑缺血发作患者,建议给予口服抗血小板药物而非抗凝药物，预防脑卒中复发及其他心血管事件的发生      是
推荐治疗方案9.1 主要条件:短暂性脑缺血发作,推荐血运重建方案:抗血小板治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗血小板治疗

推荐治疗方案9.2 主要条件:短暂性脑缺血发作+否定条件:非风湿性二尖瓣病变｜局部主动脉弓病变｜二尖瓣环钙化｜二尖瓣脱垂｜风湿性二尖瓣病变｜左室附壁血栓｜急性心肌梗死｜房颤,推荐血运重建方案:抗血小板治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 非风湿性二尖瓣病变 局部主动脉弓病变 二尖瓣环钙化 二尖瓣脱垂 风湿性二尖瓣病变 左室附壁血栓 急性心肌梗死 房颤
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗血小板治疗
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案87l 20170919   短暂性脑缺血发作    心源性栓塞性短暂性脑缺血发作          抗栓治疗    对于心源性短暂性脑缺血发作，建议根据患者缺血的严重程度和出血转化的风险选择抗凝或抗血小板治疗      是
推荐治疗方案10.1 主要条件:心源性栓塞性短暂性脑缺血发作,推荐血运重建方案:抗栓治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    心源性栓塞性短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗栓治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案88l 20170919   短暂性脑缺血发作    短暂性脑缺血发作&房颤         口服抗凝治疗  伴有心房颤动的 短暂性脑缺血发作 患者,推荐给予华法林口服抗凝治疗(维持 INR值范围 2.0~3.0)        是
推荐治疗方案11.1 主要条件:短暂性脑缺血发作&房颤,推荐血运重建方案:口服抗凝治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 房颤
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     口服抗凝治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案89l 20170919   短暂性脑缺血发作    短暂性脑缺血发作&房颤         抗血小板治疗  伴有心房颤动的 短暂性脑缺血发作 患者,若不能接受口服抗凝药物治疗,推荐应用 阿司匹林单药治疗。也可以选择阿司匹林联合氯吡格雷抗血小板治疗       是
推荐治疗方案12.1 主要条件:短暂性脑缺血发作&房颤,推荐血运重建方案:抗血小板治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 房颤
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗血小板治疗



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案90l 20170919   短暂性脑缺血发作    急性心肌梗死&短暂性脑缺血发作 左室附壁血栓      口服抗凝治疗  若有左室附壁血栓形成,推荐给予至少3个月的华法林口服治疗(目标INR值为2.5;范围2.0~3.0)。如无左室附壁血栓形成,但发现前壁无运动或异常运动,也应考虑给予3个月的华法林口服治疗       是
推荐治疗方案13.1 主要条件:短暂性脑缺血发作&房颤+次要条件:左室附壁血栓,推荐血运重建方案:口服抗凝治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    急性心肌梗死 短暂性脑缺血发作 左室附壁血栓
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     口服抗凝治疗

推荐治疗方案13.2 主要条件:短暂性脑缺血发作&房颤+没有次要条件:左室附壁血栓,"不应"推荐血运重建方案:口服抗凝治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    急性心肌梗死 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     口服抗凝治疗
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案91l 20170919   短暂性脑缺血发作    风湿性二尖瓣病变&短暂性脑缺血发作       房颤｜颈动脉狭窄    抗栓治疗    推荐给予华法林口服抗凝治疗(目标 INR值为 2.5;范围 2.0~3.0) ，在使用足量的华法林治疗过程中仍出现缺 血性脑卒中或 短暂性脑缺血发作 时,可加用阿司匹林抗血小板治疗      是
推荐治疗方案14.1 主要条件:风湿性二尖瓣病变&短暂性脑缺血发作:,推荐血运重建方案:抗栓治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    风湿性二尖瓣病变 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗栓治疗

推荐治疗方案14.2 主要条件:风湿性二尖瓣病变&短暂性脑缺血发+否定条件:房颤｜颈动脉狭窄,"不应"推荐血运重建方案:抗栓治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    风湿性二尖瓣病变 短暂性脑缺血发作 房颤 颈动脉狭窄
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     抗栓治疗
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案92l 20170919   短暂性脑缺血发作    非风湿性二尖瓣病变｜局部主动脉弓病变｜二尖瓣环钙化｜二尖瓣脱垂&短暂性脑缺血发作        房颤  抗血小板治疗  不伴有心房颤动的非风湿性二尖瓣病变或其他瓣膜病变(局部主动脉 弓、二尖瓣环钙化、二尖瓣脱垂等)的 短暂性脑缺血发作 患者,可以考虑抗血小板聚集治疗       是
推荐治疗方案15.1 主要条件:非风湿性二尖瓣病变｜局部主动脉弓病变｜二尖瓣环钙化｜二尖瓣脱垂&短暂性脑缺血发作,推荐血运重建方案:抗血小板治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    非风湿性二尖瓣病变 局部主动脉弓病变 二尖瓣环钙化 二尖瓣脱垂&短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗血小板治疗



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案93l 20170919   短暂性脑缺血发作    人工心脏瓣膜&短暂性脑缺血发作         口服抗凝治疗  对于植入人工心脏瓣膜的 短暂性脑缺血发作 患者,推荐给予长期华法林口服抗凝治疗     是
推荐治疗方案16.1 主要条件:人工心脏瓣膜&短暂性脑缺血发作,推荐血运重建方案:口服抗凝治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    人工心脏瓣膜 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     口服抗凝治疗

######推荐治疗方案16.2 主要条件:人工心脏瓣膜,缺少&短暂性脑缺血发作,"不应"推荐血运重建方案:口服抗凝治疗
######    [Documentation]    断言:""
######    ${timestamp}    Get Time    epoch
######    ${Assessment}    Set Variable    短暂性脑缺血发作
######    ${Subjective}    Set Variable    人工心脏瓣膜
######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
######    ...    definiteDiagnosis=
######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
######    ...    labTestList=
######    ...    examinationList=
######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
######    Should Not Contain    ${aj}     口服抗凝治疗
######    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案94l 20170919   短暂性脑缺血发作    短暂性脑缺血发作&LDL-C>=100mg/dl｜主动脉弓动脉粥样硬化斑块｜颅内大动脉粥样硬化性狭窄｜颈动脉狭窄率70%-99%｜主动脉弓动脉粥样硬化斑块｜收缩压>=140mmHg｜舒张压>=90mmHg｜高血压｜HbA1c增高｜糖尿病｜糖尿病前期            TIA危险因素管理   纠正TIA危险因素，防止向卒中演变       是
#######短暂性脑缺血发作 LDL-C>=100mg/dl 主动脉弓动脉粥样硬化斑块 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率70%-99% 主动脉弓动脉粥样硬化斑块 收缩压>=140mmHg 舒张压>=90mmHg 高血压 HbA1c增高 糖尿病 糖尿病前期
#######短暂性脑缺血发作 LDL-C>:100mg/dl 主动脉弓动脉粥样硬化斑块 颅内大动脉粥样硬化性狭窄 颈动脉狭窄率70% 主动脉弓动脉粥样硬化斑块 收缩压:140mmHg 舒张压:90mmHg 高血压 HbA1c增高 糖尿病 糖尿病前期
推荐治疗方案17.1 主要条件:短暂性脑缺血发作&LDL-C>=100mg/dl,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 LDL-C>:100mg/dl
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.2 主要条件:短暂性脑缺血发作&主动脉弓动脉粥样硬化斑块,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 主动脉弓动脉粥样硬化斑块
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.3 主要条件:短暂性脑缺血发作&颅内大动脉粥样硬化性狭窄,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 颅内大动脉粥样硬化性狭窄
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.4 主要条件:短暂性脑缺血发作&颈动脉狭窄率70%,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 颈动脉狭窄率70%
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

##########推荐治疗方案17.5 主要条件:短暂性脑缺血发作&主动脉弓动脉粥样硬化斑块,推荐血运重建方案:TIA危险因素管理
##########    [Documentation]    断言:""
##########    ${timestamp}    Get Time    epoch
##########    ${Assessment}    Set Variable    短暂性脑缺血发作
##########    ${Subjective}    Set Variable    短暂性脑缺血发作 主动脉弓动脉粥样硬化斑块
##########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
##########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
##########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
##########    ...    definiteDiagnosis=
##########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
##########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
##########    ...    labTestList=
##########    ...    examinationList=
##########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
##########    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.6 主要条件:短暂性脑缺血发作&收缩压:140mmHg,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 收缩压:140mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.7 主要条件:短暂性脑缺血发作&舒张压:90mmHg,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 舒张压:90mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.8 主要条件:短暂性脑缺血发作&高血压,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 高血压
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.9 主要条件:短暂性脑缺血发作&HbA1c增高,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 HbA1c增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理


推荐治疗方案17.10 主要条件:短暂性脑缺血发作&糖尿病,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 糖尿病
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.11 主要条件:短暂性脑缺血发作&糖尿病前期,推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 糖尿病前期
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     TIA危险因素管理

推荐治疗方案17.12 主要条件:短暂性脑缺血发作不正确的&&LDL-C<100mg/dl,"不应"推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 LDL-C:99mg/dl
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     TIA危险因素管理
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList

推荐治疗方案17.13 主要条件:短暂性脑缺血发作不加&,"不应"推荐血运重建方案:TIA危险因素管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     TIA危险因素管理
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList




#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案99l 20170919   短暂性脑缺血发作    颅外颈动脉狭窄[70%-99%]｜颈动脉颅外段严重狭窄&6个月内短暂性脑缺血发作发作史     颈动脉颅外段狭窄程度<50%  颈动脉内膜切除术（CEA）   颈动脉颅外段严重狭窄者(狭窄>70%)，如果预计围手术期死亡和卒中复发<6%,推荐进行颈动脉内膜切除术（CEA）或 颈动脉血管成形和支架置入术（CAS）治疗  无   是
推荐治疗方案18.1 主要条件:颅外颈动脉狭窄[70%-99%]｜颈动脉颅外段严重狭窄&6个月内短暂性脑缺血发作发作史,推荐血运重建方案:颈动脉内膜切除术（CEA）
#######颅外颈动脉狭窄:70% 颅外颈动脉狭窄:99% 颈动脉颅外段严重狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:70% 颈动脉颅外段严重狭窄 短暂性脑缺血发作:180 天
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉内膜切除术（CEA）


推荐治疗方案18.2 主要条件:颅外颈动脉狭窄[70%-99%]｜颈动脉颅外段严重狭窄&6个月内短暂性脑缺血发作发作史+否定条件:颈动脉颅外段狭窄程度<50%,"不应"推荐血运重建方案:颈动脉内膜切除术（CEA）
#######颅外颈动脉狭窄:70% 颅外颈动脉狭窄:99% 颈动脉颅外段严重狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:70% 颈动脉颅外段严重狭窄 短暂性脑缺血发作:180天 颈动脉颅外段狭窄程度:49%
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     颈动脉内膜切除术（CEA）
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案100l 20170919  短暂性脑缺血发作    颅外颈动脉狭窄[70%-99%]｜颈动脉颅外段严重狭窄&6个月内短暂性脑缺血发作发作史     颈动脉颅外段狭窄程度<50%  颈动脉血管成形和支架置入术（CAS）  颈动脉颅外段严重狭窄者(狭窄>70%)，如果预计围手术期死亡和卒中复发<6%,推荐进行颈动脉内膜切除术（CEA）或 颈动脉血管成形和支架置入术（CAS）治疗  无   是
推荐治疗方案19.1 主要条件:颅外颈动脉狭窄[70%-99%]｜颈动脉颅外段严重狭窄&6个月内短暂性脑缺血发作发作史,推荐血运重建方案:颈动脉血管成形和支架置入术（CAS）
#######颅外颈动脉狭窄:70% 颅外颈动脉狭窄:99% 颈动脉颅外段严重狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:70% 颈动脉颅外段严重狭窄 短暂性脑缺血发作:180 天
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉血管成形和支架置入术（CAS）


推荐治疗方案19.2 主要条件:颅外颈动脉狭窄[70%-99%]｜颈动脉颅外段严重狭窄&6个月内短暂性脑缺血发作发作史+否定条件:颈动脉颅外段狭窄程度<50%,"不应"推荐血运重建方案:颈动脉血管成形和支架置入术（CAS）
#######颅外颈动脉狭窄:70% 颅外颈动脉狭窄:99% 颈动脉颅外段严重狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:70% 颈动脉颅外段严重狭窄 短暂性脑缺血发作:180天 颈动脉颅外段狭窄程度:49%
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉血管成形和支架置入术（CAS）
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案101l 20170919  短暂性脑缺血发作    颅外颈动脉狭窄[50%-69%]｜颈动脉颅外段中度狭窄&短暂性脑缺血发作        颈动脉颅外段狭窄程度<50%  颈动脉内膜切除术（CEA）   颈动脉颅外段中度狭窄者(狭窄50%～69%)，如有短暂性脑缺血发作或脑CTA检查发现血管狭窄>50%,推荐进行颈动脉内膜切除术（CEA）或 颈动脉血管成形和支架置入术（CAS）治疗  无   是
推荐治疗方案20.1 主要条件:颅外颈动脉狭窄[50%-69%]｜颈动脉颅外段中度狭窄&短暂性脑缺血发作,推荐血运重建方案:颈动脉内膜切除术（CEA）
#######颅外颈动脉狭窄:70% 颅外颈动脉狭窄:99% 颈动脉颅外段中度狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:50% 颈动脉颅外段中度狭窄 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉内膜切除术（CEA）

推荐治疗方案20.2 主要条件:颅外颈动脉狭窄[50%-69%]｜颈动脉颅外段中度狭窄&短暂性脑缺血发作+否定条件:颈动脉颅外段狭窄程度<50%,"不应"推荐血运重建方案:颈动脉内膜切除术（CEA）
#######颅外颈动脉狭窄:50%  颈动脉颅外段中度狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:50% 颈动脉颅外段中度狭窄 短暂性脑缺血发作 颈动脉颅外段狭窄程度:49%
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉内膜切除术（CEA）
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案102l 20170919  短暂性脑缺血发作    颅外颈动脉狭窄[50%-69%]｜颈动脉颅外段中度狭窄&短暂性脑缺血发作        颈动脉颅外段狭窄程度<50%  颈动脉血管成形和支架置入术（CAS）  颈动脉颅外段中度狭窄者(狭窄50%～69%)，如有短暂性脑缺血发作或脑CTA检查发现血管狭窄>50%,推荐进行颈动脉内膜切除术（CEA）或 颈动脉血管成形和支架置入术（CAS）治疗  无   是
推荐治疗方案21.1 主要条件:颅外颈动脉狭窄[50%-69%]｜颈动脉颅外段中度狭窄&短暂性脑缺血发作,推荐血运重建方案:颈动脉血管成形和支架置入术（CAS）
#######颅外颈动脉狭窄:70% 颅外颈动脉狭窄:99% 颈动脉颅外段中度狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:50% 颈动脉颅外段中度狭窄 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉血管成形和支架置入术（CAS）

推荐治疗方案21.2 主要条件:颅外颈动脉狭窄[50%-69%]｜颈动脉颅外段中度狭窄&短暂性脑缺血发作+否定条件:颈动脉颅外段狭窄程度<50%,"不应"推荐血运重建方案:颈动脉血管成形和支架置入术（CAS）
#######颅外颈动脉狭窄:50%  颈动脉颅外段中度狭窄  短暂性脑缺血发作:180 天 短暂性脑缺血发作:179 天  否定条件:颈动脉颅外段狭窄程度:49%
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颅外颈动脉狭窄:50% 颈动脉颅外段中度狭窄 短暂性脑缺血发作 颈动脉颅外段狭窄程度:49%
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颈动脉血管成形和支架置入术（CAS）
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案103l 20170919  短暂性脑缺血发作    短暂性脑缺血发作&颅外椎动脉狭窄&症状性颅外椎动脉粥样硬化狭窄         血管内支架置入         无   是
推荐治疗方案22.1 主要条件:短暂性脑缺血发作&颅外椎动脉狭窄&症状性颅外椎动脉粥样硬化狭窄,推荐血运重建方案:血管内支架置入
#######短暂性脑缺血发作 颅外椎动脉狭窄 症状性颅外椎动脉粥样硬化狭窄
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 颅外椎动脉狭窄 症状性颅外椎动脉粥样硬化狭窄
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内支架置入

推荐治疗方案22.2 主要条件:短暂性脑缺血发作&颅外椎动脉狭窄,缺少&症状性颅外椎动脉粥样硬化狭窄,"不应"推荐血运重建方案:血管内支架置入
#######短暂性脑缺血发作 颅外椎动脉狭窄 症状性颅外椎动脉粥样硬化狭窄
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 颅外椎动脉狭窄
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     血管内支架置入
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案104l 20170919  短暂性脑缺血发作    短暂性脑缺血发作&锁骨下动脉狭窄｜锁骨下动脉闭塞&循环缺血症状         血管内支架置入         无   是
推荐治疗方案23.1 主要条件:短暂性脑缺血发作&锁骨下动脉狭窄&循环缺血症状,推荐血运重建方案:血管内支架置入
#######短暂性脑缺血发作 锁骨下动脉狭窄 锁骨下动脉闭塞 循环缺血症状
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 锁骨下动脉狭窄 循环缺血症状
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内支架置入

推荐治疗方案23.2 主要条件:短暂性脑缺血发作&锁骨下动脉闭塞&循环缺血症状,推荐血运重建方案:血管内支架置入
#######短暂性脑缺血发作 锁骨下动脉狭窄 锁骨下动脉闭塞 循环缺血症状
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 锁骨下动脉闭塞 循环缺血症状
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内支架置入

推荐治疗方案23.3 主要条件:短暂性脑缺血发作&锁骨下动脉狭窄｜锁骨下动脉闭塞,缺少&循环缺血症状,"不应"推荐血运重建方案:血管内支架置入
#######短暂性脑缺血发作 锁骨下动脉狭窄 锁骨下动脉闭塞 循环缺血症状
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    短暂性脑缺血发作 锁骨下动脉狭窄 锁骨下动脉闭塞 循环缺血症状
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内支架置入
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案105l 20170919  短暂性脑缺血发作    颈总动脉病变｜头臂干病变& 短暂性脑缺血发作          血管内支架置入         无   是
####### 颈总动脉病变 头臂干病变 短暂性脑缺血发作
推荐治疗方案24.1 主要条件:短颈总动脉病变｜头臂干病变&短暂性脑缺血发作,推荐血运重建方案:血管内支架置入
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颈总动脉病变 头臂干病变 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内支架置入

推荐治疗方案24.2 主要条件:颈总动脉病变｜头臂干病变,缺少&短暂性脑缺血发作,"不应"推荐血运重建方案:血管内支架置入
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    短暂性脑缺血发作
    ${Subjective}    Set Variable    颈总动脉病变 头臂干病变 短暂性脑缺血发作
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     血管内支架置入
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案106l 20170919  脑出血 脑出血         脑出血血压管理     无   是
推荐治疗方案24.1 主要条件:脑出血,推荐血运重建方案:脑出血血压管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑出血血压管理

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案107l 20170919  脑出血 脑出血         脑出血血糖管理 高血糖和低血糖均是影响脑出血预后的重要因素。脑出血当血糖>10mmol/L开始降糖治疗，静脉用胰岛素治疗，控制随机血糖<11.1mmol/L，避免发生低血糖  是   是
推荐治疗方案25.1 主要条件:脑出血,推荐血运重建方案:脑出血血糖管理
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑出血血糖管理

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案108l 20170919  脑出血 脑出血     凝血功能正常｜高血压动脉硬化性出血   止血治疗    出血8小时内可以适当应用止血药预防血肿扩大，使用一般不超过48小时。对于凝血功能正常的患者，一般不建议常规使用止血药      是
推荐治疗方案26.1 主要条件:脑出血,推荐血运重建方案:止血治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     止血治疗

推荐治疗方案26.2 主要条件:脑出血+否定条件:凝血功能正常｜高血压动脉硬化性出血,"不应"推荐血运重建方案:止血治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 凝血功能正常 高血压动脉硬化性出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     止血治疗
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案109l 20170919  20170919    脑出血 脑出血         降颅压治疗   密切观察患者脑水肿和颅内压增高情况，必要时监测颅内压，颅内压ICP>20mmHg，可应用脱水剂；颅内压ICP>25mmHg，可微创或外科干预，如脑室引流减压、去骨瓣减压        是
推荐治疗方案27.1 主要条件:脑出血,推荐血运重建方案:降颅压治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     降颅压治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案110l 20170919  脑出血 脑出血         外科治疗    脑出血后，若患者情况恶化和高危患者（如：大半球血肿中线移位或小脑出血）可以考虑手术治疗 无   是
推荐治疗方案28.1 主要条件:脑出血,推荐血运重建方案:外科治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     外科治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案111l 20170919  脑出血 脑出血&基底节区出血&实测颅内压ICP>25mmHg｜颞叶钩回疝｜小脑幕切迹疝         颞瓣或额颞瓣骨瓣开颅血肿清除术 神经外科会诊手术治疗，考虑急诊行病变颞瓣或额颞瓣开颅血肿清除术 无   是
#######脑出血&基底节区出血&实测颅内压ICP>25mmHg｜颞叶钩回疝｜小脑幕切迹疝
#######脑出血 基底节区出血 颅内压ICP:26mmHg 颞叶钩回疝 小脑幕切迹疝
推荐治疗方案29.1 主要条件:脑出血&基底节区出血&实测颅内压ICP>25mmHg｜颞叶钩回疝｜小脑幕切迹疝,推荐血运重建方案:颞瓣或额颞瓣骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 颅内压ICP:26mmHg 颞叶钩回疝 小脑幕切迹疝
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颞瓣或额颞瓣骨瓣开颅血肿清除术


推荐治疗方案29.2 主要条件:脑出血&基底节区出血&颞叶钩回疝,推荐血运重建方案:颞瓣或额颞瓣骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 颞叶钩回疝
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颞瓣或额颞瓣骨瓣开颅血肿清除术

推荐治疗方案29.3 主要条件:脑出血&基底节区出血&小脑幕切迹疝,推荐血运重建方案:颞瓣或额颞瓣骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 小脑幕切迹疝
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     颞瓣或额颞瓣骨瓣开颅血肿清除术

推荐治疗方案29.4 主要条件:脑出血&基底节区出血,缺少&实测颅内压ICP>25mmHg｜颞叶钩回疝｜小脑幕切迹疝,推荐血运重建方案:颞瓣或额颞瓣骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     颞瓣或额颞瓣骨瓣开颅血肿清除术


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案112l 20170919  脑出血 脑出血&基底节区出血&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2            小骨窗开颅血肿清除术      无   是
#######脑出血&基底节区出血&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2
#######脑出血 基底节区出血 颅内压ICP:26mmHg 明显颅高压升高 影像学检查脑中线结构移位 :5mm 影像学检查发现侧脑室受压闭塞:1/2

推荐治疗方案30.1 主要条件:脑出血 基底节区出血 颅内压ICP:26mmHg,推荐血运重建方案:小骨窗开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     小骨窗开颅血肿清除术


推荐治疗方案30.2 主要条件:脑出血 基底节区出血 明显颅高压升高,推荐血运重建方案:小骨窗开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 明显颅高压升高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     小骨窗开颅血肿清除术


推荐治疗方案30.3 主要条件:脑出血 基底节区出血 影像学检查脑中线结构移位 :5mm,推荐血运重建方案:小骨窗开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 影像学检查脑中线结构移位 :5mm
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     小骨窗开颅血肿清除术

推荐治疗方案30.4 主要条件:脑出血 基底节区出血 影像学检查发现侧脑室受压闭塞:1/2,推荐血运重建方案:小骨窗开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 影像学检查发现侧脑室受压闭塞:1/2
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     小骨窗开颅血肿清除术

推荐治疗方案30.5 主要条件:脑出血&基底节区出血,缺少&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2,推荐血运重建方案:小骨窗开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     小骨窗开颅血肿清除术



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案113l 20170919  脑出血 脑出血&基底节区出血&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2            神经内镜血肿清除术      无   是
#######脑出血&基底节区出血&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2
#######脑出血 基底节区出血 颅内压ICP:26mmHg 明显颅高压升高 影像学检查脑中线结构移位 :5mm 影像学检查发现侧脑室受压闭塞:1/2

推荐治疗方案31.1 主要条件:脑出血 基底节区出血 颅内压ICP:26mmHg,推荐血运重建方案:神经内镜血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     神经内镜血肿清除术


推荐治疗方案31.2 主要条件:脑出血 基底节区出血 明显颅高压升高,推荐血运重建方案:神经内镜血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 明显颅高压升高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     神经内镜血肿清除术


推荐治疗方案31.3 主要条件:脑出血 基底节区出血 影像学检查脑中线结构移位 :5mm,推荐血运重建方案:神经内镜血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 影像学检查脑中线结构移位 :5mm
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     神经内镜血肿清除术

推荐治疗方案31.4 主要条件:脑出血 基底节区出血 影像学检查发现侧脑室受压闭塞:1/2,推荐血运重建方案:神经内镜血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 影像学检查发现侧脑室受压闭塞:1/2
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     神经内镜血肿清除术

推荐治疗方案31.5 主要条件:脑出血&基底节区出血,缺少&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2,推荐血运重建方案:神经内镜血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     神经内镜血肿清除术




#######数据版本 诊断条件    主要ç条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案114l 20170919  脑出血 脑出血&基底节区出血&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2            神经内镜血肿清除术      无   是
#######脑出血&基底节区出血&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2
#######脑出血 基底节区出血 颅内压ICP:26mmHg 明显颅高压升高 影像学检查脑中线结构移位 :5mm 影像学检查发现侧脑室受压闭塞:1/2

推荐治疗方案32.1 主要条件:脑出血 基底节区出血 颅内压ICP:26mmHg,推荐血运重建方案:立体定向骨孔血肿抽吸术（改良椎颅术）
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     立体定向骨孔血肿抽吸术（改良椎颅术）


推荐治疗方案32.2 主要条件:脑出血 基底节区出血 明显颅高压升高,推荐血运重建方案:立体定向骨孔血肿抽吸术（改良椎颅术）
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 明显颅高压升高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     立体定向骨孔血肿抽吸术（改良椎颅术）


推荐治疗方案32.3 主要条件:脑出血 基底节区出血 影像学检查脑中线结构移位 :5mm,推荐血运重建方案:立体定向骨孔血肿抽吸术（改良椎颅术）
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 影像学检查脑中线结构移位 :5mm
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     立体定向骨孔血肿抽吸术（改良椎颅术）

推荐治疗方案32.4 主要条件:脑出血 基底节区出血 影像学检查发现侧脑室受压闭塞:1/2,推荐血运重建方案:立体定向骨孔血肿抽吸术（改良椎颅术）
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血 影像学检查发现侧脑室受压闭塞:1/2
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     立体定向骨孔血肿抽吸术（改良椎颅术）

推荐治疗方案32.5 主要条件:脑出血&基底节区出血,缺少&实测颅内压ICP>25mmHg｜明显颅高压升高｜影像学检查脑中线结构移位超过5mm｜影像学检查发现侧脑室受压闭塞超过1/2,推荐血运重建方案:立体定向骨孔血肿抽吸术（改良椎颅术）
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 基底节区出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     立体定向骨孔血肿抽吸术（改良椎颅术）





#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案115l 20170919  脑出血 脑出血&丘脑出血&出血破入脑室｜梗阻性脑积水&颅内高压｜实测颅内压ICP>25mmHg         脑室钻孔外引流术    丘脑出血破入脑室，丘脑实质血肿较小，但发生梗阻性脑积水并继发性颅内高压患者，一般行侧脑室额角钻孔外引流术    无   是
#######脑出血&丘脑出血&出血破入脑室｜梗阻性脑积水&颅内高压｜实测颅内压ICP>25mmHg
#######脑出血 丘脑出血 出血破入脑室 梗阻性脑积水 颅内高压 颅内压ICP:26mmHg

推荐治疗方案33.1 主要条件:脑出血 丘脑出血 出血破入脑室 颅内高压,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 丘脑出血 出血破入脑室 颅内高压
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑室钻孔外引流术


#######脑出血&丘脑出血&出血破入脑室｜梗阻性脑积水&颅内高压｜实测颅内压ICP>25mmHg
推荐治疗方案33.2 主要条件: 脑出血 丘脑出血 梗阻性脑积水 颅内高压,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 丘脑出血 梗阻性脑积水 颅内高压
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑室钻孔外引流术


#######脑出血&丘脑出血&出血破入脑室｜梗阻性脑积水&颅内高压｜实测颅内压ICP>25mmHg
推荐治疗方案33.3 主要条件:脑出血 丘脑出血 出血破入脑室 颅内压ICP:26mmHg,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 丘脑出血 出血破入脑室 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑室钻孔外引流术


#######脑出血&丘脑出血&出血破入脑室｜梗阻性脑积水&颅内高压｜实测颅内压ICP>25mmHg
推荐治疗方案33.4 主要条件:脑出血 丘脑出血 梗阻性脑积水 颅内压ICP:26mmHg,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 丘脑出血 梗阻性脑积水 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑室钻孔外引流术

推荐治疗方案33.5 主要条件:脑出血&丘脑出血&出血破入脑室｜梗阻性脑积水,缺少&颅内高压｜实测颅内压ICP>25mmHg,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 丘脑出血 出血破入脑室 梗阻性脑积水
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     脑室钻孔外引流术




#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案116l 20170919   脑出血 脑出血&脑室出血&少量出血｜中等量出血&GCS>8分 否定条件:梗阻性脑积水      意识障碍    腰池持续外引流术        无   是
#######脑出血&脑室出血&少量出血｜中等量出血&GCS>8分&梗阻性脑积水
#######脑出血 脑室出血 少量出血 中等量出血 GCS:9 梗阻性脑积水

推荐治疗方案34.1 主要条件:脑出血&脑室出血&少量出血｜中等量出血&GCS>8分,推荐血运重建方案:腰池持续外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 少量出血 GCS:9
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     腰池持续外引流术


推荐治疗方案34.2 主要条件:脑出血 脑出血&脑室出血&中等量出血&GCS>8分,推荐血运重建方案:腰池持续外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 中等量出血 GCS:9
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     腰池持续外引流术

推荐治疗方案34.3 主要条件:脑出血 脑出血&脑室出血&少量出血&GCS>8分+否定条件:意识障碍,"不应"推荐血运重建方案:腰池持续外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 少量出血 中等量出血 GCS:9 梗阻性脑积水 意识障碍
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     腰池持续外引流术
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList

推荐治疗方案34.4 主要条件:脑出血 脑出血&脑室出血&少量出血&GCS>8分+否定条件:梗阻性脑积水,"不应"推荐血运重建方案:腰池持续外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 少量出血 中等量出血 GCS:9 梗阻性脑积水
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     腰池持续外引流术
    # Should Not Contain    ${getRes['body']}    therapeuticPlanList

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案117l   20170919    脑出血  脑出血&脑室出血&中等量出血｜较大量出血&GCS<＝8分&梗阻性脑积水         脑室钻孔外引流术        无   是
####### 脑出血 脑室出血 中等量出血 较大量出血 GCS:8 梗阻性脑积水

推荐治疗方案35.1 主要条件:脑出血&脑室出血&中等量出血&GCS<＝8分&梗阻性脑积水,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 中等量出血 GCS:8 梗阻性脑积水
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑室钻孔外引流术

推荐治疗方案35.2 主要条件:脑出血&脑室出血&较大量出血&GCS<＝8分&梗阻性脑积水,推荐血运重建方案:脑室钻孔外引流术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 较大量出血 GCS:8 梗阻性脑积水
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑室钻孔外引流术



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案118l   20170919    脑出血 脑出血&脑室出血&出血量大｜大量出血｜四脑室受压｜四脑室闭塞｜脑室出血超过脑室容积75%｜脑室铸型&GCS<8分&颅内压增高｜实测颅内压ICP>25mmHg          开颅直视下脑室内血肿清除术       无   是
####### 脑出血&脑室出血&出血量大｜大量出血｜四脑室受压｜四脑室闭塞｜脑室出血超过脑室容积75%｜脑室铸型&GCS<8分&颅内压增高｜实测颅内压ICP>25mmHg
####### 脑出血&脑室出血&出血量大｜大量出血｜四脑室受压｜四脑室闭塞｜脑室出血超过脑室容积:75%｜脑室铸型&GCS:7&颅内压增高｜颅内压ICP:26mmHg

推荐治疗方案36.1 主要条件:脑出血&脑室出血&出血量大&GCS<8分&颅内压增高,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 出血量大 GCS:7 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术

推荐治疗方案36.2 主要条件:脑出血&脑室出血& 大量出血 &GCS<8分&颅内压增高 ,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血脑室出血 大量出血 GCS:7 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术

推荐治疗方案36.3 主要条件:脑出血&脑室出血& 大量出血 &GCS<8分&颅内压增高 ,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 四脑室受压 GCS:7 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术

推荐治疗方案36.4 主要条件:脑出血&脑室出血&四脑室闭塞&GCS:7&颅内压增高,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 四脑室闭塞 GCS:7 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术

推荐治疗方案36.5 主要条件:脑出血&脑室出血 脑室出血超过脑室容积:75% GCS:7 颅内压增高,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 四脑室闭塞 GCS:7 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术

推荐治疗方案36.5 主要条件:脑出血 脑室出血 脑室铸型 GCS:7 颅内压增高,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 脑室铸型 GCS:7 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术

推荐治疗方案36.6 主要条件:脑出血 脑室出血 脑室铸型 GCS<8分 颅实测颅内压 颅内压ICP:26mmHg,推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 脑室铸型 GCS:7分 颅实测颅内压 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     开颅直视下脑室内血肿清除术


推荐治疗方案36.7 主要条件:脑出血&脑室出血&出血量大｜大量出血｜四脑室受压｜四脑室闭塞｜脑室出血超过脑室容积75%｜脑室铸型&GCS<8分,缺少&颅内压增高｜实测颅内压ICP>25mmHg,"不应"推荐血运重建方案:开颅直视下脑室内血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 脑室出血 脑室铸型 GCS:7分
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     开颅直视下脑室内血肿清除术

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案119l   脑出血&小脑出血&血肿超过10ml｜颅内压增高｜脑疝｜梗阻性脑积水｜实测颅内压ICP >25mmHg
####### 脑出血&小脑出血&血肿:10ml｜颅内压增高｜脑疝｜梗阻性脑积水｜颅内压ICP:26mmHg
####### 脑出血 小脑出血 血肿:10ml 颅内压增高 脑疝 梗阻性脑积水 颅内压ICP:26mmHg

推荐治疗方案37.1 主要条件:脑出血&小脑出血&血肿超过10ml,推荐血运重建方案:幕下正中或旁正中入路骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 小脑出血 血肿:10ml
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     幕下正中或旁正中入路骨瓣开颅血肿清除术

推荐治疗方案37.2 主要条件:脑出血&小脑出血&颅内压增高,推荐血运重建方案:幕下正中或旁正中入路骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 小脑出血 颅内压增高
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     幕下正中或旁正中入路骨瓣开颅血肿清除术

推荐治疗方案37.3 主要条件:脑出血&小脑出血&脑疝,推荐血运重建方案:幕下正中或旁正中入路骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 小脑出血 脑疝
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     幕下正中或旁正中入路骨瓣开颅血肿清除术


推荐治疗方案37.4 主要条件:脑出血&小脑出血&梗阻性脑积水,推荐血运重建方案:幕下正中或旁正中入路骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 小脑出血 梗阻性脑积水
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     幕下正中或旁正中入路骨瓣开颅血肿清除术

推荐治疗方案37.5 主要条件:脑出血&小脑出血&实测颅内压ICP>25mmHg,推荐血运重建方案:幕下正中或旁正中入路骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 小脑出血 颅内压ICP:26mmHg
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     幕下正中或旁正中入路骨瓣开颅血肿清除术


推荐治疗方案37.6 主要条件:脑出血&小脑出血缺少&血肿:10ml,推荐血运重建方案:幕下正中或旁正中入路骨瓣开颅血肿清除术
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血 小脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     幕下正中或旁正中入路骨瓣开颅血肿清除术


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案123l   20170919    脑出血 脑出血         脑出血并发症治疗            是

推荐治疗方案38.1 主要条件:脑出血,推荐血运重建方案:脑出血并发症治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑出血
    ${Subjective}    Set Variable    脑出血
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     脑出血并发症治疗




#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案124l   20170919    帕金森 帕金森     早发型帕金森｜晚发型帕金森｜智力减退｜症状波动｜异动症 非麦角类DR激动剂   早发型帕金森的首选方案     是
####### 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症

推荐治疗方案39.1 主要条件:帕金森,推荐血运重建方案:非麦角类DR激动剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非麦角类DR激动剂

###########推荐治疗方案39.2 主要条件:帕金森+否定条件:早发型帕金森,"不会"推荐血运重建方案:非麦角类DR激动剂
###########    [Documentation]    断言:""
###########    ${timestamp}    Get Time    epoch
###########    ${Assessment}    Set Variable    帕金森
###########    ${Subjective}    Set Variable    帕金森 早发型帕金森症
###########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
###########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
###########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
###########    ...    definiteDiagnosis=
###########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
###########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
###########    ...    labTestList=
###########    ...    examinationList=
###########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
###########    Should Not Contain    ${aj}     非麦角类DR激动剂

###########推荐治疗方案39.3 主要条件:帕金森+否定条件:晚发型帕金森,"不会"推荐血运重建方案:非麦角类DR激动剂
###########    [Documentation]    断言:""
###########    ${timestamp}    Get Time    epoch
###########    ${Assessment}    Set Variable    帕金森
###########    ${Subjective}    Set Variable    帕金森 晚发型帕金森
###########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
###########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
###########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
###########    ...    definiteDiagnosis=
###########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
###########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
###########    ...    labTestList=
###########    ...    examinationList=
###########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
###########    Should Not Contain    ${aj}     非麦角类DR激动剂

###########推荐治疗方案39.4 主要条件:帕金森+否定条件:智力减退,"不会"推荐血运重建方案:非麦角类DR激动剂
###########    [Documentation]    断言:""
###########    ${timestamp}    Get Time    epoch
###########    ${Assessment}    Set Variable    帕金森
###########    ${Subjective}    Set Variable    帕金森 智力减退
###########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
###########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
###########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
###########    ...    definiteDiagnosis=
###########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
###########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
###########    ...    labTestList=
###########    ...    examinationList=
###########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
###########    Should Not Contain    ${aj}     非麦角类DR激动剂

###########推荐治疗方案39.5 主要条件:帕金森+否定条件:症状波动,"不会"推荐血运重建方案:非麦角类DR激动剂
###########    [Documentation]    断言:""
###########    ${timestamp}    Get Time    epoch
###########    ${Assessment}    Set Variable    帕金森
###########    ${Subjective}    Set Variable    帕金森 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症
###########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
###########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
###########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
###########    ...    definiteDiagnosis=
###########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
###########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
###########    ...    labTestList=
###########    ...    examinationList=
###########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
###########    Should Not Contain    ${aj}     非麦角类DR激动剂


###########推荐治疗方案39.6 主要条件:帕金森+否定条件:异动症,"不会"推荐血运重建方案:非麦角类DR激动剂
###########    [Documentation]    断言:""
###########    ${timestamp}    Get Time    epoch
###########    ${Assessment}    Set Variable    帕金森
###########    ${Subjective}    Set Variable    帕金森 异动症
###########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
###########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
###########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
###########    ...    definiteDiagnosis=
###########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
###########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
###########    ...    labTestList=
###########    ...    examinationList=
###########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
###########    Should Not Contain    ${aj}     非麦角类DR激动剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案125l   20170919    帕金森 帕金森     早发型帕金森｜晚发型帕金森｜智力减退｜症状波动｜异动症 MAO-B抑制剂    早发型帕金森的首选方案     是
####### 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症

推荐治疗方案40.1 主要条件:帕金森,推荐血运重建方案:MAO-B抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     MAO-B抑制剂

#########推荐治疗方案40.2 主要条件:帕金森+否定条件:早发型帕金森,"不会"推荐血运重建方案:MAO-B抑制剂
#########    [Documentation]    断言:""
#########    ${timestamp}    Get Time    epoch
#########    ${Assessment}    Set Variable    帕金森
#########    ${Subjective}    Set Variable    帕金森 早发型帕金森症
#########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#########    ...    definiteDiagnosis=
#########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#########    ...    labTestList=
#########    ...    examinationList=
#########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#########    Should Not Contain    ${aj}     MAO-B抑制剂

#########推荐治疗方案40.3 主要条件:帕金森+否定条件:晚发型帕金森,"不会"推荐血运重建方案:MAO-B抑制剂
#########    [Documentation]    断言:""
#########    ${timestamp}    Get Time    epoch
#########    ${Assessment}    Set Variable    帕金森
#########    ${Subjective}    Set Variable    帕金森 晚发型帕金森
#########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#########    ...    definiteDiagnosis=
#########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#########    ...    labTestList=
#########    ...    examinationList=
#########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#########    Should Not Contain    ${aj}     MAO-B抑制剂


#########推荐治疗方案40.4 主要条件:帕金森+否定条件:智力减退,"不会"推荐血运重建方案:MAO-B抑制剂
#########    [Documentation]    断言:""
#########    ${timestamp}    Get Time    epoch
#########    ${Assessment}    Set Variable    帕金森
#########    ${Subjective}    Set Variable    帕金森 智力减退
#########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#########    ...    definiteDiagnosis=
#########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#########    ...    labTestList=
#########    ...    examinationList=
#########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#########    Should Not Contain    ${aj}     MAO-B抑制剂


#########推荐治疗方案40.5 主要条件:帕金森+否定条件:症状波动,"不会"推荐血运重建方案:MAO-B抑制剂
#########    [Documentation]    断言:""
#########    ${timestamp}    Get Time    epoch
#########    ${Assessment}    Set Variable    帕金森
#########    ${Subjective}    Set Variable    帕金森 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症
#########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#########    ...    definiteDiagnosis=
#########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#########    ...    labTestList=
#########    ...    examinationList=
#########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#########    Should Not Contain    ${aj}     MAO-B抑制剂

#########推荐治疗方案40.6 主要条件:帕金森+否定条件:异动症,"不会"推荐血运重建方案:MAO-B抑制剂
#########    [Documentation]    断言:""
#########    ${timestamp}    Get Time    epoch
#########    ${Assessment}    Set Variable    帕金森
#########    ${Subjective}    Set Variable    帕金森 异动症
#########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#########    ...    definiteDiagnosis=
#########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#########    ...    labTestList=
#########    ...    examinationList=
#########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#########    Should Not Contain    ${aj}     MAO-B抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案126l  20170919 帕金森 帕金森     早发型帕金森｜晚发型帕金森｜智力减退｜症状波动｜异动症 复方左旋多巴 晚发型帕金森的首选方案     是
####### 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症

推荐治疗方案41.1 主要条件:帕金森,推荐血运重建方案:复方左旋多巴
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴

#######推荐治疗方案41.2 主要条件:帕金森+否定条件:早发型帕金森,"不会"推荐血运重建方案:复方左旋多巴
#######    [Documentation]    断言:""
#######    ${timestamp}    Get Time    epoch
#######    ${Assessment}    Set Variable    帕金森
#######    ${Subjective}    Set Variable    帕金森 早发型帕金森症
#######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######    ...    definiteDiagnosis=
#######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#######    ...    labTestList=
#######    ...    examinationList=
#######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#######    Should Not Contain    ${aj}     复方左旋多巴


#######推荐治疗方案41.3 主要条件:帕金森+否定条件:晚发型帕金森,"不会"推荐血运重建方案:复方左旋多巴
#######    [Documentation]    断言:""
#######    ${timestamp}    Get Time    epoch
#######    ${Assessment}    Set Variable    帕金森
#######    ${Subjective}    Set Variable    帕金森 晚发型帕金森
#######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######    ...    definiteDiagnosis=
#######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#######    ...    labTestList=
#######    ...    examinationList=
#######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#######    Should Not Contain    ${aj}     复方左旋多巴

#######推荐治疗方案41.4 主要条件:帕金森+否定条件:智力减退,"不会"推荐血运重建方案:复方左旋多巴
#######    [Documentation]    断言:""
#######    ${timestamp}    Get Time    epoch
#######    ${Assessment}    Set Variable    帕金森
#######    ${Subjective}    Set Variable    帕金森 智力减退
#######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######    ...    definiteDiagnosis=
#######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#######    ...    labTestList=
#######    ...    examinationList=
#######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#######    Should Not Contain    ${aj}     复方左旋多巴


#######推荐治疗方案41.5 主要条件:帕金森+否定条件:症状波动,"不会"推荐血运重建方案:复方左旋多巴
#######    [Documentation]    断言:""
#######    ${timestamp}    Get Time    epoch
#######    ${Assessment}    Set Variable    帕金森
#######    ${Subjective}    Set Variable    帕金森 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症
#######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######    ...    definiteDiagnosis=
#######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#######    ...    labTestList=
#######    ...    examinationList=
#######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#######    Should Not Contain    ${aj}     复方左旋多巴
#######
#######推荐治疗方案41.6 主要条件:帕金森+否定条件:异动症,"不会"推荐血运重建方案:复方左旋多巴
#######    [Documentation]    断言:""
#######    ${timestamp}    Get Time    epoch
#######    ${Assessment}    Set Variable    帕金森
#######    ${Subjective}    Set Variable    帕金森 异动症
#######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######    ...    definiteDiagnosis=
#######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#######    ...    labTestList=
#######    ...    examinationList=
#######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#######    Should Not Contain    ${aj}     复方左旋多巴


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案127l  20170919 帕金森 早发型帕金森      智力减退    非麦角类DR激动剂   首选方案        是
####### 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症

推荐治疗方案42.1 主要条件:帕金森,推荐血运重建方案:非麦角类DR激动剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    早发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非麦角类DR激动剂

#######推荐治疗方案42.2 主要条件:帕金森 +否定条件:智力减退,"不会"推荐血运重建方案:非麦角类DR激动剂
#######    [Documentation]    断言:""
#######    ${timestamp}    Get Time    epoch
#######    ${Assessment}    Set Variable    帕金森
#######    ${Subjective}    Set Variable    早发型帕金森 智力减退
#######    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
#######    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
#######    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
#######    ...    definiteDiagnosis=
#######    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
#######    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
#######    ...    labTestList=
#######    ...    examinationList=
#######    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
#######    Should Not Contain    ${aj}     非麦角类DR激动剂



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案128l  20170919 帕金森 早发型帕金森      智力减退    MAO-B抑制剂    首选方案        是
####### 早发型帕金森 晚发型帕金森 智力减退 症状波动 异动症

推荐治疗方案43.1 主要条件:帕金森,推荐血运重建方案:MAO-B抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    早发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     MAO-B抑制剂

########推荐治疗方案43.2 主要条件:帕金森 +否定条件:智力减退,"不会"推荐血运重建方案:MAO-B抑制剂
########    [Documentation]    断言:""
########    ${timestamp}    Get Time    epoch
########    ${Assessment}    Set Variable    帕金森
########    ${Subjective}    Set Variable    早发型帕金森 智力减退
########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
########    ...    definiteDiagnosis=
########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
########    ...    labTestList=
########    ...    examinationList=
########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
########    Should Not Contain    ${aj}     MAO-B抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案129l  20170919 帕金森 早发型帕金森      金刚烷胺禁忌｜智力减退 金刚烷胺            是
####### 金刚烷胺禁忌 智力减退
推荐治疗方案44.1 主要条件:帕金森,推荐血运重建方案:金刚烷胺
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    早发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     金刚烷胺

########推荐治疗方案44.2 主要条件:帕金森 +否定条件:金刚烷胺禁忌,"不会"推荐血运重建方案:金刚烷胺
########    [Documentation]    断言:""
########    ${timestamp}    Get Time    epoch
########    ${Assessment}    Set Variable    帕金森
########    ${Subjective}    Set Variable    早发型帕金森 金刚烷胺禁忌
########    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
########    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
########    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
########    ...    definiteDiagnosis=
########    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
########    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
########    ...    labTestList=
########    ...    examinationList=
########    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
########    Should Not Contain    ${aj}     金刚烷胺

推荐治疗方案44.3 主要条件:帕金森 +否定条件:智力减退,"不会"推荐血运重建方案:金刚烷胺
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    早发型帕金森 智力减退
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     金刚烷胺



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案130l 20170919  帕金森 早发型帕金森          复方左旋多巴  若因特殊工作之需,力求 显著改善运动症状,或出现认知功能减退,则可首选方案       是
####### 金刚烷胺禁忌 智力减退
推荐治疗方案44.1 主要条件:帕金森,推荐血运重建方案:复方左旋多巴
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    早发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案131l 20170919  帕金森 早发型帕金森          复方左旋多巴＋COMT抑制剂  若因特殊工作之需,力求 显著改善运动症状,或出现认知功能减退,则可首选方案       是
推荐治疗方案45.1 主要条件:帕金森,推荐血运重建方案:复方左旋多巴＋COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    早发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴＋COMT抑制剂

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案132l 20170919  帕金森 帕金森&震颤明显        抗胆碱能药禁忌｜>=60岁   抗胆碱能药           是
#######抗胆碱能药禁忌: 无震颤症状的帕金森 闭角型青光眼 前列腺肥大 痴呆 认知功能障碍
推荐治疗方案46.1 主要条件:帕金森,推荐血运重建方案:抗胆碱能药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 震颤明显
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗胆碱能药


推荐治疗方案46.2 主要条件:帕金森+否定条件:抗胆碱能药禁忌,"不应"推荐血运重建方案:抗胆碱能药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 震颤明显 无震颤症状的帕金森 闭角型青光眼 前列腺肥大 痴呆 认知功能障碍
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     抗胆碱能药


推荐治疗方案46.3 主要条件:帕金森+否定条件:age==60岁,"不应"推荐血运重建方案:抗胆碱能药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 震颤明显
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"60","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     抗胆碱能药


推荐治疗方案46.4 主要条件:帕金森+否定条件:age>60岁,"不应"推荐血运重建方案:抗胆碱能药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 震颤明显
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"61","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Not Contain    ${aj}     抗胆碱能药

推荐治疗方案46.5 主要条件:帕金森+否定条件:age<60岁,推荐血运重建方案:抗胆碱能药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 震颤明显
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"59","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     抗胆碱能药

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案133l 20170919  帕金森 晚发型帕金森          复方左旋多巴  首选方案        是
推荐治疗方案47.1 主要条件:晚发型帕金森,推荐血运重建方案:复方左旋多巴
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    晚发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案134l 20170919  帕金森 晚发型帕金森          复方左旋多巴＋COMT抑制剂  随着症状的加重,疗效减退时可换用        是
推荐治疗方案48.1 主要条件:晚发型帕金森,推荐血运重建方案:复方左旋多巴＋COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    晚发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴＋COMT抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案135l 20170919  20170919    帕金森 晚发型帕金森          COMT抑制剂 随着症状的加重,疗效减退时可添加        是
推荐治疗方案49.1 主要条件:晚发型帕金森,推荐血运重建方案:复方左旋多巴＋COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    晚发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴＋COMT抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案136l 20170919  帕金森 晚发型帕金森          非麦角类DR激动剂   随着症状的加重,疗效减退时可添加        是
推荐治疗方案50.1 主要条件:晚发型帕金森,推荐血运重建方案:非麦角类DR激动剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    晚发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非麦角类DR激动剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案137l 20170919  帕金森 晚发型帕金森          MAO-B抑制剂    随着症状的加重,疗效减退时可添加        是
推荐治疗方案51.1 主要条件:晚发型帕金森,推荐血运重建方案:MAO-B抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    晚发型帕金森
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     MAO-B抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案138l 20170919  帕金森 帕金森&智力减退            复方左旋多巴  首选方案        是
推荐治疗方案52.1 主要条件:帕金森&智力减退,推荐血运重建方案:复方左旋多巴
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 智力减退
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案139l 20170919  帕金森 帕金森&智力减退            复方左旋多巴＋COMT抑制剂  随着症状的加重,疗效减退时可换用        是
推荐治疗方案53.1 主要条件:帕金森&智力减退,推荐血运重建方案:复方左旋多巴＋COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 智力减退
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴＋COMT抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案140l 20170919  帕金森 帕金森&智力减退            COMT抑制剂 随着症状的加重,疗效减退时可添加        是
推荐治疗方案54.1 主要条件:帕金森&智力减退,推荐血运重建方案:COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 智力减退
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     COMT抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案141l 20170919  帕金森 帕金森&智力减退            非麦角类DR激动剂   随着症状的加重,疗效减退时可添加        是
推荐治疗方案55.1 主要条件:帕金森&症状波动,推荐血运重建方案:非麦角类DR激动剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 智力减退
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非麦角类DR激动剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案142l 20170919  帕金森 帕金森&智力减退            MAO-B抑制剂    随着症状的加重,疗效减退时可添加        是
推荐治疗方案56.1 主要条件:帕金森&症状波动,推荐血运重建方案:MAO-B抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 智力减退
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     MAO-B抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案143l 20170919  帕金森 帕金森&症状波动            复方左旋多巴  增加复方左旋多巴次数，换用左旋多巴控释剂        是
推荐治疗方案57.1 主要条件:帕金森&症状波动,推荐血运重建方案:复方左旋多巴
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 症状波动
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案144l 20170919  帕金森 帕金森&症状波动            复方左旋多巴＋COMT抑制剂  加用COMT抑制剂       是
推荐治疗方案58.1 主要条件:帕金森&症状波动,推荐血运重建方案:复方左旋多巴＋COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 症状波动
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴＋COMT抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案145l 20170919   帕金森 帕金森&症状波动            COMT抑制剂 加用COMT抑制剂       是
推荐治疗方案59.1 主要条件:帕金森&症状波动,推荐血运重建方案:COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 症状波动
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     COMT抑制剂

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案146l 20170919  帕金森 帕金森&症状波动            非麦角类DR激动剂   加用DR激动剂     是
推荐治疗方案60.1 主要条件:帕金森&症状波动,推荐血运重建方案:非麦角类DR激动剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 症状波动
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非麦角类DR激动剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案147l 20170919  帕金森 帕金森&症状波动            MAO-B抑制剂    加用MAO-B抑制剂      是
推荐治疗方案61.1 主要条件:帕金森&症状波动,推荐血运重建方案:MAO-B抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 症状波动
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     MAO-B抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案148l 20170919  帕金森 帕金森&症状波动            手术治疗        无   是
推荐治疗方案62.1 主要条件:帕金森&症状波动,推荐血运重建方案:手术治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 症状波动
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     手术治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案149l 20170919  帕金森 帕金森&异动症         复方左旋多巴  减量复方左旋多巴，增加服用次数     是
推荐治疗方案63.1 主要条件:帕金森&异动症,推荐血运重建方案:复方左旋多巴
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案150l 20170919  帕金森 帕金森&异动症         非麦角类DR激动剂   减量复方左旋多巴，加用DR激动剂        是
推荐治疗方案64.1 主要条件:帕金森&异动症,推荐血运重建方案:非麦角类DR激动剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非麦角类DR激动剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案151l 20170919  帕金森 帕金森&异动症         复方左旋多巴＋COMT抑制剂  减量复方左旋多巴，加用COMT抑制剂      是
推荐治疗方案65.1 主要条件:帕金森&异动症,推荐血运重建方案:复方左旋多巴＋COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     复方左旋多巴＋COMT抑制剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案152l 20170919  帕金森 帕金森&异动症         COMT抑制剂 减量复方左旋多巴，加用COMT抑制剂      是
推荐治疗方案66.1 主要条件:帕金森&异动症,推荐血运重建方案:COMT抑制剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     COMT抑制剂

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案153l 20170919  帕金森 帕金森&异动症         COMT抑制剂 减量复方左旋多巴，加用COMT抑制剂      是
推荐治疗方案67.1 主要条件:帕金森&异动症,推荐血运重建方案:金刚烷胺
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     金刚烷胺

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案154l 20170919  帕金森 帕金森&异动症         非典型神经安定剂    加用非典型神经安定剂      是
推荐治疗方案68.1 主要条件:帕金森&异动症,推荐血运重建方案:非典型神经安定剂
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     非典型神经安定剂


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案155l 20170919  帕金森 帕金森&异动症         手术治疗        无   是
推荐治疗方案69.1 主要条件:帕金森&异动症,推荐血运重建方案:手术治疗
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 异动症
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     手术治疗


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案156l 20170919  帕金森 帕金森&精神障碍｜焦虑｜抑郁｜幻觉｜认知障碍｜痴呆｜易激惹           精神障碍用药  最常见的精神障碍包括抑郁和 (或)焦虑、幻觉、认知障碍或痴呆等     是
#######帕金森&精神障碍｜焦虑｜抑郁｜幻觉｜认知障碍｜痴呆｜易激惹
#######帕金森 精神障碍 焦虑 抑郁 幻觉 认知障碍 痴呆 易激惹
推荐治疗方案70.1 主要条件:帕金森&精神障碍,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 精神障碍
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药

推荐治疗方案70.2 主要条件:帕金森&焦虑,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 焦虑
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药


推荐治疗方案70.3 主要条件:帕金森&抑郁,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 抑郁
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药


推荐治疗方案70.4 主要条件:帕金森&幻觉,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 幻觉
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药


推荐治疗方案70.5 主要条件:帕金森&认知障碍,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 认知障碍
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药


推荐治疗方案70.6 主要条件:帕金森&痴呆,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 痴呆
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药


推荐治疗方案70.7 主要条件:帕金森&易激惹,推荐血运重建方案:精神障碍用药
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    帕金森
    ${Subjective}    Set Variable    帕金森 易激惹
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     精神障碍用药



#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案157l 20170919      营养风险筛查2002(NRS)>=3分         肠内／肠外营养支持   NRS>=3分，患者营养不良或存在营养不良的风险，应该使用营养支持       是
推荐治疗方案71.1 主要条件: 营养风险筛查2002(NRS)==3,推荐血运重建方案:肠内／肠外营养支持
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     营养风险筛查2002(NRS):3
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肠内／肠外营养支持

推荐治疗方案71.2 主要条件: 营养风险筛查2002(NRS)>3,推荐血运重建方案:肠内／肠外营养支持
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     营养风险筛查2002(NRS):4
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     肠内／肠外营养支持

推荐治疗方案71.3 主要条件: 营养风险筛查2002(NRS)<3,"不应"推荐血运重建方案:肠内／肠外营养支持
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     营养风险筛查2002(NRS):2
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    # Should Not Contain    ${aj}     肠内／肠外营养支持
    Should Not Contain    ${getRes['body']}    therapeuticPlanList




#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案158l 20170919      疼痛评分[1-3]           NSAIDs  患者疼痛评分<=3分，一般无需用药       是
推荐治疗方案72.1 主要条件:疼痛评分:1,推荐血运重建方案:NSAIDs
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:1
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     NSAIDs

推荐治疗方案72.1 主要条件:疼痛评分==3,推荐血运重建方案:NSAIDs
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:1
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     NSAIDs


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案159l 20170919      疼痛评分[4-6]           弱阿片类药物  根据WHO三阶梯止痛原则给药      是
推荐治疗方案73.1 主要条件:疼痛评分:4,推荐血运重建方案:弱阿片类药物
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:4
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     弱阿片类药物

推荐治疗方案73.2 主要条件:疼痛评分:6,推荐血运重建方案:弱阿片类药物
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:6
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     弱阿片类药物

#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案160l 20170919      疼痛评分[7-10]          强阿片类药物  根据WHO三阶梯止痛原则给药      是
推荐治疗方案74.1 主要条件:疼痛评分:7,推荐血运重建方案:强阿片类药物
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:7
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     强阿片类药物

推荐治疗方案74.2 主要条件:疼痛评分:10,推荐血运重建方案:强阿片类药物
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:10
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     强阿片类药物


#######数据版本 诊断条件    主要条件    次要条件    否定条件    推荐血运重建方案    备注文案    是否有用药   是否新增
#######推荐治疗方案161l 20170919      疼痛评分[4-6]           中度疼痛非阿片药物   根据WHO三阶梯止痛原则给药      是
推荐治疗方案73.1 主要条件:疼痛评分:4,推荐血运重建方案:中度疼痛非阿片药物
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:4
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     中度疼痛非阿片药物

推荐治疗方案73.2 主要条件:疼痛评分:6,推荐血运重建方案:中度疼痛非阿片药物
    [Documentation]    断言:""
    ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable     疼痛评分:6
    ${getRes}    智能推荐_宣武    userGuid=${timestamp}    serialNumber=${timestamp}
    ...    patientInfo={"gender":0,"age":"","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"${Subjective} 诊断及诊断依据:${Assessment} ","doctorGuid": "2222","recordTime": ""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Should Contain    ${aj}     中度疼痛非阿片药物

