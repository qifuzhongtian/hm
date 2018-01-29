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
# ${timestamp}${random}    Get Time    epoch

*** Test Cases ***
######20171023 雌激素治疗       年龄>=40&年龄>55岁＆尿失禁｜排尿功能障碍    绝经期泌尿生殖系统综合征｜萎缩性阴道炎｜外阴阴道萎缩      nsj1

#女性&年龄＞=40&年龄＜55＆尿失禁｜急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜排尿功能障碍
#女性&年龄＞=40&年龄＜55＆尿失禁｜急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜排尿功能障碍
##尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 排尿功能障碍
#####20171116  预防中枢神经系统浸润      急性淋巴细胞白血病           jxlbxbbxb1  是
#####尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍
###次要条件:绝经期泌尿生殖系统综合征 萎缩性阴道炎 外阴阴道萎缩
药品方案2行-分组1:治疗方案-雌激素治疗:主要条件:急性淋巴细胞白血病,+次要条件:绝经期泌尿生殖系统综合征｜萎缩性阴道炎｜外阴阴道萎缩,用药推荐包含:雌三醇栓 雌三醇乳膏 雌二醇凝胶 雌二醇阴道片
    [Documentation]    断言:""
    ${assert}    Create List    雌三醇栓    雌三醇乳膏    雌二醇凝胶    雌二醇阴道片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 排尿功能障碍 绝经期泌尿生殖系统综合征 萎缩性阴道炎 外阴阴道萎缩 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][7]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}




###########20171023    抗毒蕈碱药物      急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍         nsj2
################急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍
################急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁  尿失禁 排尿功能障碍

药品方案3行-分组2:治疗方案-抗毒蕈碱药物:主要条件:急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍,用药推荐包含:酒石酸托特罗定片 酒石酸托特罗定缓释片 富马酸托特罗定片
    [Documentation]    断言:""
    ${assert}    Create List    酒石酸托特罗定片    酒石酸托特罗定缓释片    富马酸托特罗定片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][6]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

###########20171023    β3激动剂联用     急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍         nsj8
################急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍
################急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍

药品方案4行-分组2:治疗方案-β3激动剂联用:主要条件:急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍,用药推荐包含:盐酸奥昔布宁缓释片 盐酸奥昔布宁胶囊 盐酸奥昔布宁口服溶液 盐酸奥昔布宁片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸奥昔布宁缓释片    盐酸奥昔布宁胶囊    盐酸奥昔布宁口服溶液    盐酸奥昔布宁片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][5]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


###########20171023    肉毒毒素逼尿肌内注射      急迫性尿失禁｜膀胱过度活动症          nsj3

药品方案5行-分组3:治疗方案-肉毒毒素逼尿肌内注射:主要条件:急迫性尿失禁｜膀胱过度活动症,用药推荐包含:注射用A型肉毒毒素
    [Documentation]    断言:""
    ${assert}    Create List    注射用A型肉毒毒素
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"急迫性尿失禁 膀胱过度活动症 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][2]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


#######20171023    对症治疗    选择性 α1 肾上腺素受体激动剂    压力性尿失禁      严重器质性心脏病｜急性肾脏病｜嗜铬细胞瘤｜甲状腺功能亢进｜持续性卧位高血压   nsj4
#######尿路感染&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍
#######尿路感染 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍

药品方案7行-分组5:治疗方案-抗感染治疗,主要条件:尿路感染&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍,用药推荐包含:盐酸米多君片
    [Documentation]    断言:""
    ${assert}    Create List    盐酸米多君片
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"尿路感染 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][10]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


药品方案7行-分组6:治疗方案-抗感染治疗,主要条件:尿路感染&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍,用药推荐包含:硫酸庆大霉素胶囊 硫酸庆大霉素胶囊 硫酸庆大霉素咀嚼片 硫酸庆大霉素咀嚼片 硫酸庆大霉素片 硫酸庆大霉素片 硫酸妥布霉素注射液 硫酸妥布霉素注射液 硫酸妥布霉素注射液
    [Documentation]    断言:""
    ${assert}    Create List    硫酸庆大霉素胶囊    硫酸庆大霉素胶囊    硫酸庆大霉素咀嚼片    硫酸庆大霉素咀嚼片    硫酸庆大霉素片    硫酸庆大霉素片    硫酸妥布霉素注射液    硫酸妥布霉素注射液    硫酸妥布霉素注射液
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"尿路感染 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][10]['matchMedications'][0]['recommendedDrugs'][1]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

########20171023   止咳治疗        慢性咳嗽&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍            nsj6
#######慢性咳嗽&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜｜尿失禁｜排尿功能障碍
#######慢性咳嗽 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍

药品方案8行-分组7:治疗方案-止咳治疗,主要条件:慢性咳嗽 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍,用药推荐包含:枸橼酸喷托维林片 枸橼酸喷托维林片 川贝止咳露 急支糖浆 急支糖浆 急支糖浆 急支糖浆 急支糖浆
    [Documentation]    断言:""
    ${assert}    Create List    枸橼酸喷托维林片    枸橼酸喷托维林片    川贝止咳露    急支糖浆    急支糖浆    急支糖浆    急支糖浆    急支糖浆
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"慢性咳嗽 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][8]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}

#########20171023   缓泻药物治疗      便秘&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜尿失禁｜排尿功能障碍           nsj7
########便秘&急迫性尿失禁｜膀胱过度活动症｜压力性尿失禁｜混合性尿失禁｜功能性尿失禁｜尿失禁｜排尿功能障碍
########便秘 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍
药品方案9行-分组7:治疗方案-缓泻药物治疗,主要条件:便秘 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍,用药推荐包含:麻仁丸 四消丸
    [Documentation]    断言:""
    ${assert}    Create List    麻仁丸    四消丸
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ...    AND    智能推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}    patientInfo={"gender":0,"age":"40","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0"}    physicalSign={"bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}    definiteDiagnosis=
    ...    progressNoteList={"progressGuid": "22222","progressType":"2","progressMessage":"便秘 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 尿失禁 排尿功能障碍 诊断及诊断依据:尿失禁 急迫性尿失禁 膀胱过度活动症 压力性尿失禁 混合性尿失禁 功能性尿失禁 充溢性尿失禁 排尿功能障碍 ","doctorGuid": "2222","recordTime": ""}    deleteProgressNoteList=    labTestList=    examinationList=
    ${getRes}    用药推荐_宣武    userGuid=${timestamp}${random}    serialNumber=${timestamp}${random}
    ...    patientInfo={"gender":0,"age":"18","ageType":"岁","maritalStatus":"1","pregnancyStatus":"0","bodyTempr": "","heartRate": "","lowBldPress": "","highBldPress": ""}
    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['therapeuticPlanList'][8]['matchMedications'][0]['recommendedDrugs'][0]['drugDetailList']]
    # List should contain sub list    ${aj}     ${assert}
    Lists should Be Equal    ${aj}    ${assert}


