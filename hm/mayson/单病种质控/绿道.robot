*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot    # Force Tags    skip
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
绿道提醒:急诊
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${progressMessage}    Set Variable    2019-10-21 19:38 \急诊静脉溶栓记录及抢救记录,患者姓名，性别性，年龄岁，体重 \ Kg，主因“ 突发语言不清，左侧肢体无力1小时7分钟”,2019-08-0115:07就诊于我院急诊，现病史：患者于 小时前在 突发 ，到我院急诊就诊。既往：否认高血压病史，否认糖尿病史，否认房颤史，否认冠心病史，否认脑梗死脑出血病史。否认消化性溃疡，否认肾病，否认药物过敏史，否认近期大手术及外伤史。查体:血压 \ \ \ \ \ \ \ \ \ / \ \ \ \ \ \ \ \ \ mmHg，右利手。神志：清楚；言语：流利；构音：正常。左侧瞳孔直径 \ \ \ \ \ \ \ \ \ mm，右侧瞳孔直径 \ \ \ \ \ \ \ \ \ mm，左侧对光反射灵敏 \ ，右侧对光反射灵敏 。双眼无凝视麻痹，无眼球震颤；双侧面部感觉对称。鼻唇沟：双侧对称。伸舌居中 。左上肢肌力 \ \ \ \ \ \ \ 级，左下肢肌力 \ \ \ \ \ \ \ 级，右上肢肌力 \ \ \ \ \ \ \ 级，右下肢肌力 \ \ \ \ \ \ \ 级；左侧指鼻试验稳准 ，右侧指鼻试验稳准 。左侧跟膝胫试验稳准，右侧跟膝胫试验稳准，双侧浅感觉正常，双侧腱反射阿替普酶使用后腱反射情况，双侧Babinski征阴性。NIHSS \ \ \ \ \ \ \ 分，GCS \ \ \ \ \ \ \ 分，mRS \ \ \ \ \ \ \ 分，Barthel指数 \ \ \ \ \ \ \ 分。头CT检查: \ \ \ \ \ \ \ 。血常规未见异常。目前诊断“急诊脑梗死”明确，符合静脉溶栓适应征，无绝对禁忌症，告知静脉溶栓获益及风险，由院总医师向患者及家属详细介绍了“注射用重组人尿激酶原(rhPro-UK)静脉溶栓治疗发病0-4.5小时急性缺血性脑卒中的随机、开放、阳性药对照、多中心Ⅲ期临床试验”，患者和家属经仔细权衡和充分考虑后，同意静脉溶栓治疗并参加该研究，并于 \ \ \ \ \ \ \ \ \ \ 由患者本人/法定代理人 \ \ \ \ \ \ \ 签署知情同意书，分配筛选编号01- \ \ \ \ \ \ \ ，经评估，受试者符合入选标准，不符合排除标准，随机入组。获得药物号01- \ \ \ \ \ \ \ ，B组阿替普酶，根据体重患者医嘱 \ \ \ \ \ \ \ mg，于 15:37 开始静脉溶栓，首先使用 \ \ \ \ \ \ \ mg以于1分钟静脉推注， \ \ \ \ \ \ \ \ \ 推注结束，后于 \ \ \ \ \ \ \ \ \ 用阿替普酶 \ \ \ \ \ \ \ mg以 \ \ \ \ \ \ \ ml/h微量泵泵入。同时持续心电、血压、血氧监测，泵入期间病人病情 \ \ \ \ \ \ \ 。于 \ \ \ \ \ \ \ \ \ 泵入完毕再次查体：血压 \ \ \ \ \ \ \ \ \ / \ \ \ \ \ \ \ \ \ mmHg，右利手。神志：清楚；言语：流利；构音：正常。左侧瞳孔直径 \ \ \ \ \ \ \ \ \ mm，右侧瞳孔直径 \ \ \ \ \ \ \ \ \ mm，左侧对光反射灵敏 \ ，右侧对光反射灵敏 。双眼无凝视麻痹，无眼球震颤；双侧面部感觉对称。鼻唇沟：双侧对称。伸舌居中 。左上肢肌力 \ \ \ \ \ \ \ 级，左下肢肌力 \ \ \ \ \ \ \ 级，右上肢肌力 \ \ \ \ \ \ \ 级，右下肢肌力 \ \ \ \ \ \ \ 级；左侧指鼻试验稳准 ，右侧指鼻试验稳准 。左侧跟膝胫试验稳准，右侧跟膝胫试验稳准，双侧浅感觉正常，双侧腱反射阿替普酶使用后腱反射情况，双侧Babinski征阴性。NIHSS \ \ \ \ \ \ \ 分，GCS \ \ \ \ \ \ \ 分，mRS \ \ \ \ \ \ \ 分。治疗期间患者无出血情况，具体出血部位 \ \ \ \ \ \ \ ，出血量约 \ \ \ \ \ \ \ ml，给予 \ \ \ \ \ \ \ 处理，溶栓后观察 \ \ \ \ \ \ \ \ \ 分钟患者病情未加重，下一步治疗方案: \ \ \ \ \ \ \ 。。 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 参与溶栓人员：。 \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ 操作医师记录： \ DjwStephen。
    ${getRes}    智能推荐-绿道    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    bodyTempr=37    lowBldPress=80    highBldPress=100    heartRate=100
    ...    height=    waistline=    presentHistory=    symptomClickDiseaseId=    confirmDiagnosis=    gender=0
    ...    age=30    ageType=岁    symptom=    confirmDiagnosisMap=    drugCommonNames=    examinationList=
    ...    newTestList=    labTestList=    patientName=张大斌    inpatientDepartment=急诊内科    progressNoteList={"progressGuid": "15716579618310065329", "progressType": "16", "msgType": 0,"progressMessage": "${progressMessage}", "createTime": "2019-10-21 19:39:21", "recordTime": "2019-10-21 19:39:21", "progressTemplateName": "急诊静脉溶栓记录及抢救记录", "progressSection": "抢救记录" }    patientInfo={}
    ...    doctorName=张医生    doctorGuid=345
    ${aj}    Evaluate    [aj['group_condition'] for aj in $getRes['body']['green_channel']['channels']]
    Should Contain    ${aj}    脑梗死患者满足脑卒中数据填报入组要求

绿道提醒:住院
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    # ${timestamp}    Get Time    epoch
    ${Assessment}    Set Variable    脑梗死
    ${Subjective}    Set Variable
    ${getRes}    智能推荐v2    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientName=tester    pageSource=2    requestSource=
    ...    doctorGuid=0210497    doctorName=测试医生    admissionTime=2018-12-12    inpatientDepartment=心脏科    patientInfo={"gender":"1","age":"19","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ...    openInterdict=${1}    definiteDiagnosis=    progressNoteList={"doctorGuid":"2222","msgType":"2","messageList":[{"key":"主诉","value":"${Subjective}"},{"key": "诊断依据及鉴别诊断","value": ""},{"key":"现病史","value":""},{"key":"既往史","value":""},{"key":"主诊断","value":"${Assessment}"},{"key":"出院诊断","value":"${Assessment}"},{"key":"辅助检查","value":""}],"progressType":"10","progressGuid":"22222","recordTime":""}    deleteProgressNoteList={"progressGuid":"","progressType":"10","doctorGid":"","recordTime":""}    labTestList=    examinationList=
    ...    newTestList=    operationRecord=    prescriptions={"prescriptionNumber":"","recordTime":"","drugList":[{"drugId":"","drugName":"","dosage":"","unit":"","frequency":"","pathway":"","specification":""}]}    currentDiseaseName=    medicalOrders={"orderId": "${timestamp}${random}","orderCode": "316275","orderContent": "阿托伐他汀钙片","dosage": "41","unit": "mg","frequency": "ONCE","pathway": "口服","specification": "","orderFlag": 1,"orderType": 3,"timelinessFlag": 2}
    #####推荐检查评估表
    # ${aj}    Evaluate    [aj['assessItem'] for aj in $getRes['body']['illnessAssessList']]
    #####推荐检查
    # ${aj}    Evaluate    [aj['examination'] for aj in $getRes['body']['examinationRecommendList']]
    ######检查解读
    # ${aj}    Evaluate    [aj['diagnosticSuggest'] for aj in $getRes['body']['examinationInterpretList']]
    ######质控
    #${aj}    Evaluate    [aj['caseIntegrity'] for aj in $getRes['body']['qualityControlResponse']['caseIntegrityRecommendList']]
    #####推荐治疗方案
    # ${aj}    Evaluate    [aj['planName'] for aj in $getRes['body']['therapeuticPlanList']]
    #####疑似诊断
    #${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseHospitalList']]
    #####质控推荐检查
    ${aj}    Evaluate    [aj['group_condition'] for aj in $getRes['body']['green_channel']['channels']]
    Should Contain    ${aj}    脑梗死患者满足脑卒中数据填报入组要求
