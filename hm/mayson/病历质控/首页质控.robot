*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    获取时间戳
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
首页质控:既往史在病案首页的遗漏syqt1
    [Documentation]    pangoo/ruleengine/homePage
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${ruleCodes}    Create List    syqt7    syqt2    syqt1    syqt4    syqt6-xw    syqt3    syzzd3    syzzd2    syzzd1
    ${getRes}    首页质控    masterProfile={"adviceKnowledges":[],"allergies":[],"assessItems":[],"assesss":[],"consultationAdvices":[],"customerId":1001,"diseases":[{"customerId":1001,"definiteDate":1587548565554,"dictionaryAttributeId":47,"diseaseDate":1587548565554,"diseaseExtendCode":[],"diseaseId":161,"diseaseName":"脑梗死","existState":1,"id":195232186889277442,"nodeId":3465,"nodeType":5,"orderDate":1587548565554,"profilePartType":8,"progressId":16583459,"rankId":0,"recordDate":1587548565554,"recordId":2951533,"recordTypeId":6,"suspected":0},{"customerId":1001,"definiteDate":"2020-04-217:25:49","dictionaryAttributeId":23,"diseaseDate":"2020-04-217:25:49","diseaseExtendCode":[],"diseaseGuid":"Z34.901","diseaseId":40070,"diseaseName":"妊娠","existState":1,"id":195232481534939140,"mainDisease":1,"nodeId":61479418,"nodeType":5,"orderDate":"2020-04-217:25:49","orgDiseaseName":"妊娠40+周G3P1LOT剖宫产","profilePartType":32,"progressId":345496,"rankId":0,"recordDate":"2020-04-217:25:49","recordId":2951533,"recordTypeId":12004,"suspected":0},{"continuedTime":819936000,"continuedTimeDesc":"26年","customerId":1001,"definiteDate":767614067110,"dictionaryAttributeId":13,"diseaseDate":767614067110,"diseaseExtendCode":[],"diseaseId":5005,"diseaseName":"2型糖尿病","existState":1,"id":195238434711932930,"nodeId":21243,"nodeType":5,"orderDate":767614067110,"profilePartType":3,"progressId":16583452,"rankId":1,"recordDate":1587550067110,"recordId":2951533,"recordTypeId":1,"suspected":0},{"customerId":1001,"dictionaryAttributeId":23,"diseaseGuid":"Z34.901","diseaseId":0,"diseaseName":"妊娠40+周G3P1LOT剖宫产","id":195232481534939139,"mainDisease":1,"nodeType":5,"orgDiseaseName":"妊娠40+周G3P1LOT剖宫产","profilePartType":36,"progressId":345496,"recordDate":"2020-04-217:25:49","recordId":2951533,"recordTypeId":12004}],"drugAdvices":[],"drugs":[],"examinationAdvices":[],"examinationItems":[],"examinations":[],"medicalorders":[],"nurseAdvices":[],"nurseItems":[],"operationAdvices":[{"anesthesia":"","customerId":1001,"dictionaryAttributeId":214,"id":195223546132303872,"incisionType":"","nodeId":13731,"nodeType":11,"operationDate":"2020-04-217:08:32","operationName":"手术","orderCreateDate":"2020-04-217:08:32","orderDate":"2020-04-217:08:32","orderExecuteDate":"2020-04-217:08:32","progressId":1199,"rankId":0,"recordDate":"2020-04-217:08:32","recordId":2951533,"recordTypeId":11002},{"anesthesia":"","customerId":1001,"dictionaryAttributeId":214,"id":195223546132303873,"incisionType":"","nodeId":116461,"nodeType":11,"operationDate":"2020-04-217:08:32","operationName":"剖宫产","orderCreateDate":"2020-04-217:08:32","orderDate":"2020-04-217:08:32","orderExecuteDate":"2020-04-217:08:32","progressId":1199,"rankId":1,"recordDate":"2020-04-217:08:32","recordId":2951533,"recordTypeId":11002}],"operations":[{"anesthesia":"","customerId":1001,"dictionaryAttributeId":213,"existState":1,"id":195233678115344387,"incisionType":"Ⅰ","nodeId":24563468,"nodeType":11,"operationDate":"2020-04-216:53:55","operationId":5006,"operationName":"子宫下段横切口剖宫产术","orderDate":"2020-04-216:53:55","profilePartType":33,"progressId":331864,"rankId":0,"recordId":2951533,"recordTypeId":12005},{"anesthesia":"","customerId":1001,"dictionaryAttributeId":213,"existState":1,"id":195233678115344388,"incisionType":"Ⅰ","nodeId":13731,"nodeType":11,"operationDate":"2020-04-216:53:55","operationId":13640,"operationName":"手术","orderDate":"2020-04-216:53:55","profilePartType":33,"progressId":331864,"rankId":1,"recordId":2951533,"recordTypeId":12005},{"customerId":1001,"dictionaryAttributeId":213,"id":195233678115344386,"incisionType":"Ⅰ","nodeType":11,"operationDate":"2020-04-216:53:55","operationGuid":"74.02","operationId":0,"operationName":"子宫下段剖宫产术，横切(无)","orderDate":"2020-04-216:53:55","profilePartType":37,"progressId":331864,"recordDate":"2020-04-216:53:55","recordId":2951533,"recordTypeId":12005}],"patientVisitInfo":{"admissionDate":"2020-04-216:53:31","customerId":1001,"department":"产科","patientAge":20,"patientAgeType":"岁","patientGender":0,"patientGuid":"1587545546344","patientName":"stable_200430_1587545546834","recordId":2951533,"serialNumber":"1587545619245"},"physicals":[],"previous":[{"customerId":1001,"dictionaryAttributeId":2,"existState":1,"id":195238434711932931,"nodeId":61479418,"nodeType":19,"orderDate":1587550067110,"previousId":1,"previousName":"妊娠","progressId":16583452,"rankId":0,"recordDate":1587550067110,"recordId":2951533,"recordTypeId":1}],"progresses":[{"customerId":1001,"dictionaryAttributeId":47,"id":195232186830557186,"progressContent":"术后诊断:脑梗。","progressDate":1587548565554,"progressId":16583459,"recordDate":1587548565554,"recordId":2951533,"recordTypeId":6},{"customerId":1001,"dictionaryAttributeId":2,"id":195238434460274690,"progressContent":"主诉:妊。","progressDate":1587550067110,"progressId":16583452,"recordDate":1587550067110,"recordId":2951533,"recordTypeId":1},{"customerId":1001,"dictionaryAttributeId":13,"id":195238434460274691,"progressContent":"既往史:2型糖尿病病史26年,。","progressDate":1587550067110,"progressId":16583452,"recordDate":1587550067110,"recordId":2951533,"recordTypeId":1}],"recordId":2951533,"symptoms":[],"testAdvices":[],"testItems":[],"tests":[],"timepoints":[],"vitalsigns":[]}
    ...    recordDatas={"患者基本信息":{"出生地（市）":"","职业":"","入院科室名称":"","患者姓名":"stable_200430_1587545546834","社保卡号":"","出生地（省\直辖市）":"","现在工作邮编":"","入院床号":"","本人电话":"","入院途径":"0","现住址邮编":"","出院科室名称":"","新生儿入院体重":"","出院床号":"","婚姻状况":"0","新生儿出生体重":"","民族":"","现在工作单位联系方式（电话）":"","籍贯（市）":"","id":"34757","年龄":"20","身份证号":"","联系人电话":"","户口所在地（省\直辖市）":"","病人来源":"0","联系人地址":"","户口地址邮编":"","现工作单位名称":"","出生地（县/地区）":"","联系人姓名":"","转科科室名称":"","病案号":"","现工作地址":"","年龄单位":"岁","户口所在地（市）":"","联系人关系":"","籍贯（省\直辖市）":"","国籍":"","患者性别":"0","实际住院天数":"","现住址":"","医疗付费方式":"0"},"患者诊断信息":[{"诊断名称":"妊娠40+周G3P1LOT剖宫产","诊断编码":"Z34.901","诊断时间":"2020-04-217:25:49.0","诊断ICD编码":"Z34.901","诊断类型":"9","id":"345496","是否主诊断":"1","入院病情":"4"}]}
    ...    recordId=${2951533}
    ...    ruleCodes=${ruleCodes}
    ${aj}    Evaluate    [aj['ruleCode'] for aj in $getRes['result']]
    Should Contain    ${aj}    syqt1


首页质控:nh23-C10-现病史中确诊疾病在病案首页入院病情类型选择错误
    [Documentation]    pangoo/ruleengine/homePage
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${ruleCodes}    Create List    nh23
    ${getRes}    首页质控    masterProfile={"adviceKnowledges":[],"allergies":[],"assessItems":[{"assessId":8,"assessItemId":191,"assessItemName":"女性","customerId":1001,"dictionaryAttributeId":212,"existState":1,"id":203596171074211842,"itemSource":1,"objectId":54607,"progressId":203596171074211841,"recordId":3035799,"recordTypeId":9006,"score":1,"sourceType":0,"wordId":54607},{"assessId":89,"assessItemId":304,"assessItemName":"年龄≤44岁","customerId":1001,"dictionaryAttributeId":212,"existState":1,"id":203596171074211846,"itemSource":1,"objectId":324985,"progressId":203596171074211845,"recordId":3035799,"recordTypeId":9006,"score":0,"sourceType":0,"wordId":324985}],"assesss":[{"assessId":4,"assessName":"Wells评分","assessResult":"低度可能急性肺栓塞","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211840,"objectId":4,"profilePartType":43,"progressId":203596171074211840,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":8,"assessItems":[{"assessId":8,"assessItemId":191,"assessItemName":"女性","customerId":1001,"dictionaryAttributeId":212,"existState":1,"id":203596171074211842,"itemSource":1,"objectId":54607,"progressId":203596171074211841,"recordId":3035799,"recordTypeId":9006,"score":1,"sourceType":0,"wordId":54607}],"assessName":"CHA2DS2-VASc","assessResult":"患者年卒中发生率1.3%","assessValue":"1","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211841,"objectId":8,"profilePartType":43,"progressId":203596171074211841,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":9,"assessName":"HAS-BLED","assessResult":"患者出血风险低","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211843,"objectId":9,"profilePartType":43,"progressId":203596171074211843,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":509,"assessName":"DVT-Wells评分","assessResult":"患者发生DVT低度可能性","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211844,"objectId":509,"profilePartType":43,"progressId":203596171074211844,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":89,"assessItems":[{"assessId":89,"assessItemId":304,"assessItemName":"年龄≤44岁","customerId":1001,"dictionaryAttributeId":212,"existState":1,"id":203596171074211846,"itemSource":1,"objectId":324985,"progressId":203596171074211845,"recordId":3035799,"recordTypeId":9006,"score":0,"sourceType":0,"wordId":324985}],"assessName":"APACHE II评分","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211845,"objectId":89,"profilePartType":43,"progressId":203596171074211845,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":276,"assessName":"qSOFA评分","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211847,"objectId":276,"profilePartType":43,"progressId":203596171074211847,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":278,"assessName":"妊娠及产褥期VTE危险因素评分","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211848,"objectId":278,"profilePartType":43,"progressId":203596171074211848,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":281,"assessName":"Padua评分","assessResult":"低危","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211849,"objectId":281,"profilePartType":43,"progressId":203596171074211849,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":282,"assessName":"Caprini评分","assessResult":"低危","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211850,"objectId":282,"profilePartType":43,"progressId":203596171074211850,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":306,"assessName":"SOFA评分 ","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211851,"objectId":306,"profilePartType":43,"progressId":203596171074211851,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":535,"assessName":"外科住院患者出血风险评估","assessResult":"低危","assessValue":"","assessValueType":1,"assessValueUnit":"","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211852,"objectId":535,"profilePartType":43,"progressId":203596171074211852,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":522,"assessName":"内科住院患者出血风险评估","assessResult":"低危","assessValue":"","assessValueType":1,"assessValueUnit":"","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211853,"objectId":522,"profilePartType":43,"progressId":203596171074211853,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":589,"assessName":"非手术患者出血风险评估","assessResult":"低危","assessValue":"","assessValueType":1,"assessValueUnit":"","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211854,"objectId":589,"profilePartType":43,"progressId":203596171074211854,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":590,"assessName":"外科VTE风险评估","assessResult":"低危","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211855,"objectId":590,"profilePartType":43,"progressId":203596171074211855,"recordId":3035799,"recordTypeId":9006,"sourceType":0},{"assessId":591,"assessName":"内科VTE风险评估","assessResult":"低危","assessValue":"0","assessValueType":1,"assessValueUnit":"分","customerId":1001,"dictionaryAttributeId":212,"id":203596171074211856,"objectId":591,"profilePartType":43,"progressId":203596171074211856,"recordId":3035799,"recordTypeId":9006,"sourceType":0}],"consultationAdvices":[],"customerId":1001,"diseases":[{"customerId":1001,"definiteDate":"2020-05-15 18:47:37","dictionaryAttributeId":10,"diseaseDate":"2020-05-15 18:47:37","diseaseExtendCode":[],"diseaseId":10333,"diseaseName":"脂肪肝","existState":1,"id":203596170986131462,"nodeId":3827,"nodeType":5,"objectId":10333,"orderDate":"2020-05-15 18:47:37","profilePartType":3,"progressId":16671540,"rankId":0,"recordDate":"2020-05-15 18:47:37","recordId":3035799,"recordTypeId":1,"sourceType":0,"suspected":0},{"customerId":1001,"definiteDate":"2020-05-15 18:47:37","dictionaryAttributeId":10,"diseaseDate":"2020-05-15 18:47:37","diseaseExtendCode":[],"diseaseId":268,"diseaseName":"病毒性肝炎,不伴有肝昏迷","existState":1,"id":203596170986131463,"nodeId":3991,"nodeType":5,"objectId":268,"orderDate":"2020-05-15 18:47:37","profilePartType":3,"progressId":16671540,"rankId":1,"recordDate":"2020-05-15 18:47:37","recordId":3035799,"recordTypeId":1,"sourceType":0,"suspected":0},{"admissionCondition":2,"customerId":1001,"dictionaryAttributeId":23,"diseaseExtendCode":[],"diseaseGuid":"","diseaseId":268,"diseaseName":"病毒性肝炎,不伴有肝昏迷","existState":1,"id":203596170986131464,"mainDisease":0,"nodeId":3991,"nodeType":5,"objectId":268,"orgDiseaseName":"病毒性肝炎","profilePartType":32,"progressId":350622,"rankId":0,"recordId":3035799,"recordTypeId":12004,"sourceType":0,"suspected":0},{"admissionCondition":2,"customerId":1001,"dictionaryAttributeId":23,"diseaseExtendCode":[],"diseaseGuid":"","diseaseId":10333,"diseaseName":"脂肪肝","existState":1,"id":203596170986131465,"mainDisease":0,"nodeId":3827,"nodeType":5,"objectId":10333,"orgDiseaseName":"脂肪肝","profilePartType":32,"progressId":350623,"rankId":0,"recordId":3035799,"recordTypeId":12004,"sourceType":0,"suspected":0},{"admissionCondition":2,"customerId":1001,"dictionaryAttributeId":23,"diseaseGuid":"","diseaseId":0,"diseaseName":"病毒性肝炎","id":203596170986131459,"mainDisease":0,"nodeType":5,"objectId":0,"orgDiseaseName":"病毒性肝炎","profilePartType":36,"progressId":350622,"recordId":3035799,"recordTypeId":12004,"sourceType":0},{"admissionCondition":2,"customerId":1001,"dictionaryAttributeId":23,"diseaseGuid":"","diseaseId":0,"diseaseName":"脂肪肝","id":203596170986131460,"mainDisease":0,"nodeType":5,"objectId":0,"orgDiseaseName":"脂肪肝","profilePartType":36,"progressId":350623,"recordId":3035799,"recordTypeId":12004,"sourceType":0}],"drugAdvices":[],"drugs":[],"examinationAdvices":[],"examinationItems":[],"examinations":[],"medicalorders":[],"nurseAdvices":[],"nurseItems":[],"operationAdvices":[],"operations":[],"patientVisitInfo":{"admissionDate":"2020-05-14 11:43:25","customerId":1001,"department":"呼吸科","dischargeDate":"2020-05-13 11:45:29","patientAge":20,"patientAgeType":"岁","patientGender":0,"patientGuid":"1589361520882","patientName":"stable_200515_1589361521859nh23-C10-现病史中确诊疾病在病案首页入院病情类型选择错误","recordId":3035799,"serialNumber":"1589427803693"},"physicals":[],"previous":[],"progresses":[{"customerId":1001,"dictionaryAttributeId":10,"id":203596170801582083,"progressContent":"现病史:脂肪肝, 病毒性肝炎。","progressDate":"2020-05-15 18:47:37","progressId":16671540,"recordDate":"2020-05-15 18:47:37","recordId":3035799,"recordTypeId":1,"sourceType":0}],"recordId":3035799,"symptoms":[],"testAdvices":[],"testItems":[],"tests":[],"timepoints":[{"customerId":1001,"dictionaryAttributeId":122,"id":203596170801582081,"profilePartType":38,"progressId":3035799,"recordId":3035799,"recordTypeId":16001,"sourceType":0,"timePointValue":"2020-05-14 11:43:25","timeTypeId":5453,"timeTypeName":"住院时间"},{"customerId":1001,"dictionaryAttributeId":30,"id":203596170801582082,"profilePartType":38,"progressId":3035799,"recordId":3035799,"recordTypeId":16001,"sourceType":0,"timePointValue":"2020-05-13 11:45:29","timeTypeId":5719,"timeTypeName":"出院时间"}],"vitalsigns":[]}
    ...    recordDatas={"患者基本信息":{"出生地（市）":"","职业":"","入院科室名称":"","患者姓名":"stable_200515_1589361521859nh23-","社保卡号":"","出生地（省\直辖市）":"","现在工作邮编":"","入院床号":"","本人电话":"","入院途径":"0","现住址邮编":"","出院科室名称":"","新生儿入院体重":"","出院床号":"","婚姻状况":"0","新生儿出生体重":"","民族":"","现在工作单位联系方式（电话）":"","籍贯（市）":"","id":"35228","年龄":"20","身份证号":"","联系人电话":"","户口所在地（省\直辖市）":"","病人来源":"0","联系人地址":"","户口地址邮编":"","现工作单位名称":"","出生地（县/地区）":"","联系人姓名":"","转科科室名称":"","病案号":"","现工作地址":"","年龄单位":"岁","户口所在地（市）":"","联系人关系":"","籍贯（省\直辖市）":"","国籍":"","患者性别":"0","实际住院天数":"","现住址":"","医疗付费方式":"0"},"患者诊断信息":[{"诊断名称":"病毒性肝炎","诊断编码":"","诊断ICD编码":"","诊断类型":"9","id":"350622","入院病情":"2"},{"诊断名称":"脂肪肝","诊断编码":"","诊断ICD编码":"","诊断类型":"9","id":"350623","入院病情":"2"}]}
    ...    recordId=${3035799}
    ...    ruleCodes=${ruleCodes}
    ${aj}    Evaluate    [aj['ruleCode'] for aj in $getRes['result']]
    Should Contain    ${aj}    nh23


