*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           String

# 字段名   类型  是否必须    说明
# userGuid    String  是   患者唯一编号
# serialNumber    String  是   住院病历唯一编号
# patientInfo Object  是   患者信息
# ----gender  Integer 否   性别0女,1男,  2 其他
# ----age double  是   年龄
# ----ageType String  是   岁、月、天
# ----maritalStatus   Integer 否   婚姻状况  0：未婚 ,1: 已婚, 2:其他
# ----pregnancyStatus Integer 否   二尖瓣反流束面积(0-4)cm2妊娠状况  1: 怀孕  0：未怀孕
# ----bodyTempr   Double  否   体温
# ----heartRate   Integer 否   心率
# ----lowBldPress Double  否   舒张压-低压
# ----highBldPress    Double  否   收缩压-高压
*** Variables ***
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***

# #######
#######1型糖尿病及急慢性并发症###

1型糖尿病及急慢性并发症-主诉:男，8岁，已确诊1型糖尿病，推荐疑似诊断:1型糖尿病
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-点击疑似诊断或手动输入：1型糖尿病，推荐检查：糖化血红蛋白、血糖、血糖监测、尿常规、尿酮检测、血酮检测、糖化血清蛋白、血常规、粪便常规、电解质全套、肝功能、肾功能、24小时尿蛋白定量、心电图、腹部B超、胸部X线(正侧位)、C肽释放实验、精氨酸试验
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    糖化血红蛋白    血糖监测    C肽释放实验    血糖    精氨酸试验    胸部X线(正侧位)    腹部B超    尿常规    糖化血清蛋白    粪便常规    血常规    肝功能    肾功能    电解质全套    心电图    尿酮检测    血酮检测    24小时尿蛋白定量
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-点击疑似诊断或手动输入：1型糖尿病，推荐评估表：1型糖尿病、2型糖尿病及单基因突变糖尿病的鉴别要点、糖尿病病因学分类(WHO,1999)、1型糖尿病患者的血糖控制目标
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    1型糖尿病、2型糖尿病及单基因突变糖尿病的鉴别要点     糖尿病病因学分类(WHO,1999)    1型糖尿病患者的血糖控制目标
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-点击疑似诊断或手动输入：1型糖尿病，推荐治疗：估算每天所需胰岛素总量、强化胰岛素治疗每日多次胰岛素注射方案(MDI)、强化胰岛素治疗、医学营养治疗、估算7岁-10岁T1DM患者全日能量摄入量
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-病历内容增加急性并发症①：血糖2.4mmol/L，推荐治疗增加：纠正低血糖、纠正脑水肿、静脉给予糖皮质激素
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    纠正低血糖    纠正脑水肿    静脉给予糖皮质激素
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，血糖2.4mmol/L
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症①为：1型糖尿病性高渗性昏迷②，推荐评估表增加：儿童改良格拉斯哥昏迷评分(GCS）
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    1型糖尿病、2型糖尿病及单基因突变糖尿病的鉴别要点     糖尿病病因学分类(WHO,1999)    1型糖尿病患者的血糖控制目标    儿童改良格拉斯哥昏迷评分(GCS）
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性高渗性昏迷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症①为：1型糖尿病性高渗性昏迷②，推荐检查增加：血渗透压（渗透量）
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    糖化血红蛋白    血糖监测    C肽释放实验    血糖    精氨酸试验    胸部X线(正侧位)    腹部B超    尿常规    糖化血清蛋白    粪便常规    血常规    肝功能    肾功能    电解质全套    心电图    尿酮检测    血酮检测    24小时尿蛋白定量    血渗透压（渗透量）
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性高渗性昏迷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症①为：1型糖尿病性高渗性昏迷②，推荐治疗变更为：胰岛素治疗、其他对症治疗、及时补钾治疗、转诊ICU
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    胰岛素治疗    其他对症治疗    及时补钾治疗    转诊ICU
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性高渗性昏迷
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症②为：1型糖尿病性酮症酸中毒③，推荐评估表变更为：推荐增加评估表变更为：糖尿病酮症酸中毒(DKA)的主要诊断和分级标准(儿童及青少年)、儿童改良格拉斯哥昏迷评分(GCS）、糖尿病酮症酸中毒脑水肿评估、1型糖尿病性酮症酸中毒脱水补液量计算
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    1型糖尿病、2型糖尿病及单基因突变糖尿病的鉴别要点     糖尿病病因学分类(WHO,1999)    1型糖尿病患者的血糖控制目标    糖尿病酮症酸中毒(DKA)的主要诊断和分级标准(儿童及青少年)    儿童改良格拉斯哥昏迷评分(GCS）    糖尿病酮症酸中毒脑水肿评估    1型糖尿病性酮症酸中毒脱水补液量计算
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性酮症酸中毒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症②为：1型糖尿病性酮症酸中毒③，推荐检查变更为：血渗透压（渗透量）
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    糖化血红蛋白    血糖监测    C肽释放实验    血糖    精氨酸试验    胸部X线(正侧位)    腹部B超    尿常规    糖化血清蛋白    粪便常规    血常规    肝功能    肾功能    电解质全套    心电图    尿酮检测    血酮检测    24小时尿蛋白定量    血渗透压（渗透量）
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性酮症酸中毒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症②为：1型糖尿病性酮症酸中毒③，推荐治疗变更为：补液消酮治疗、补液纠正酸中毒、补碱治疗、静脉持续小剂量胰岛素治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    补液消酮治疗    补液纠正酸中毒    补碱治疗    静脉持续小剂量胰岛素治疗
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性酮症酸中毒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症③为：1型糖尿病性乳酸酸中毒④，推荐评估表变更为：儿童改良格拉斯哥昏迷评分(GCS）
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    1型糖尿病、2型糖尿病及单基因突变糖尿病的鉴别要点     糖尿病病因学分类(WHO,1999)    1型糖尿病患者的血糖控制目标    儿童改良格拉斯哥昏迷评分(GCS）
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性乳酸酸中毒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改急性并发症③为：1型糖尿病性乳酸酸中毒④，推荐治疗变更为：转诊ICU、及时透析治疗、纠正水电解质酸碱失衡、减少乳酸生成、改善缺氧状态
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    转诊ICU    及时透析治疗    纠正水电解质酸碱失衡    减少乳酸生成    改善缺氧状态
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，1型糖尿病性乳酸酸中毒
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-病历内容增加：糖尿病病程6年，推荐检查增加：糖尿病视网膜病变筛查、眼底检查、眼底荧光血管造影检查、糖尿病周围神经病变筛查、尿微量白蛋白、尿蛋白/肌酐比值、肌电图检查、超声心动图、踝肱指数(ABI)、颈动脉超声、下肢血管彩色超声多普勒检查、不散瞳眼底照相
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    糖化血红蛋白    血糖监测    C肽释放实验    血糖    精氨酸试验    胸部X线(正侧位)    腹部B超    尿常规    糖化血清蛋白    粪便常规    血常规    肝功能    肾功能    电解质全套    心电图    尿酮检测    血酮检测    24小时尿蛋白定量    糖尿病视网膜病变筛查    眼底检查    眼底荧光血管造影检查    糖尿病周围神经病变筛查    尿微量白蛋白    尿蛋白/肌酐比值    肌电图检查    超声心动图    踝肱指数(ABI)    颈动脉超声    下肢血管彩色超声多普勒检查    不散瞳眼底照相
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，糖尿病病程6年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    #${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-病历内容增加：糖尿病病程6年，推荐治疗增加：会诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    会诊
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，糖尿病病程6年
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-病历内容增加慢性并发症：1型糖尿病性视网膜病变⑤，推荐评估表增加：糖尿病视网膜病变的国际临床分级标准(2002年,悉尼会议)、糖尿病黄斑水肿分级(2002年,悉尼会议)、基于糖尿病视网膜病变国际临床分级的治疗建议(2002年,悉尼会议)
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    1型糖尿病、2型糖尿病及单基因突变糖尿病的鉴别要点     糖尿病病因学分类(WHO,1999)    1型糖尿病患者的血糖控制目标    糖尿病视网膜病变的国际临床分级标准(2002年,悉尼会议)    糖尿病黄斑水肿分级(2002年,悉尼会议)    基于糖尿病视网膜病变国际临床分级的治疗建议(2002年,悉尼会议)
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，糖尿病病程6年，1型糖尿病性视网膜病变
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病


1型糖尿病及急慢性并发症-病历内容增加慢性并发症：1型糖尿病性视网膜病变⑤，推荐治疗增加：改善视网膜微循环治疗、其他眼部局部治疗、视网膜病变者运动注意事项、会诊
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    会诊    改善视网膜微循环治疗    其他眼部局部治疗    视网膜病变者运动注意事项    会诊
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，糖尿病病程6年，1型糖尿病性视网膜病变
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改慢性并发症⑤为：1型糖尿病性周围神经病⑥，推荐治疗变更为：营养神经治疗、止痛对症治疗、改善四肢微循环治疗、中医中药治疗、物理治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    会诊    营养神经治疗    止痛对症治疗    改善四肢微循环治疗    中医中药治疗    物理治疗
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，糖尿病病程6年，1型糖尿病性周围神经病
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病

1型糖尿病及急慢性并发症-更改慢性并发症⑥为：1型糖尿病性肾病、肾衰竭⑦，推荐治疗变更为：透析治疗、移植治疗、以ACEI/ARB为基础的治疗
    [Documentation]    断言:""
    # ${timestamp}    Get Time    epoch
    ${assert}    Create List    估算每天所需胰岛素总量    医学营养治疗    估算7岁-10岁T1DM患者全日能量摄入量     强化胰岛素治疗每日多次胰岛素注射方案(MDI)     强化胰岛素治疗    会诊    透析治疗    移植治疗    以ACEI/ARB为基础的治疗
    ${Assessment}    Set Variable    1型糖尿病
    ${Subjective}    Set Variable    男，8岁，已确诊1型糖尿病，糖尿病病程6年，1型糖尿病性肾病、肾衰竭
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能推荐    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":"1","age":"8","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}
    ...    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    definiteDiagnosis=
    ...    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"初步诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"2","progressGuid":"22222","recordTime":""}
    ...    deleteProgressNoteList={"progressGuid":"","progressType":"","doctorGuid":"","recordTime":""}
    ...    labTestList=
    ...    examinationList=
    ...    newTestList=
    #####推荐检查评估表
    #${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #Lists Should Be Equal    ${aj}    ${assert}
    #####推荐检查
    #${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    #Should Contain    ${aj}    血渗透压（渗透量）
    #Lists Should Be Equal    ${aj}    ${assert}
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    #####推荐治疗方案
    ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    Lists Should Be Equal    ${aj}    ${assert}
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #Should Contain    ${aj[:5]}    1型糖尿病












