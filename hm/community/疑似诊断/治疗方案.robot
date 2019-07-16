*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Force Tags        skip    profileskip

*** Variables ***
# ${assert}

*** Test Cases ***
演示case-细菌性阴道病:推荐实验室检查:阴道分泌物常规(清洁度及滴虫)白带常规
    [Documentation]    白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    # #######################################手足口病##############################################################################
    # 演示case-手足口病:推荐实验室检查:柯萨奇病毒抗体1gM检测
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][1]['examLists'][0]]
    #    Should Contain    ${aj}    柯萨奇病毒抗体1gM检测
    # 演示case1-手足口病:推荐实验室检查:血常规
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists'][0]]
    #    Should Contain    ${aj}    血常规
    # 演示case1-手足口病:推荐一般治疗:冰硼散
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    冰硼散
    # 演示case1-手足口病:推荐全身治疗:解热镇痛抗炎药
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][0]['drugClassificationLists'][1][0]['drugResponseList']]
    #    # Should Contain    ${aj}    解热镇痛抗炎药
    #    Should Be Equal As Strings    ${getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][0]['drugClassificationLists'][1][0]['classification']}    解热镇痛抗炎药
    # 演示case1-手足口病:推荐全身治疗:清开灵片
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    清开灵片
    # 演示case1-手足口病:吸氧推荐等级为"供考虑"
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C。
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][1]['drugClassificationLists'][0][0]['drugResponseList']]
    #    # Should Contain    ${aj}    吸氧
    #    # Should Be Equal As Strings    ${getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][1]}    {"comment": "", "grade": 2, "drugClassificationLists": [[{"drugResponseList": [{"drugCommonId": 18688, "hasDetail": false, "drugCommonName": "吸氧", "drugGuid": "18688"}]}]], "itemName": "一般治疗", "condition": "非呼吸浅快患者不常规推荐"}
    #    Should Be Equal As Strings    ${getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][1]}    {"comment": "", "grade": 2, "drugClassificationLists": [[{"drugResponseList": [{"drugCommonName": "吸氧", "drugGuid": "18688", "hasDetail": false}]}]], "itemName": "一般治疗", "condition": "非呼吸浅快患者不常规推荐"}
    # 演示case1-手足口病:增加病例内容:"呼吸浅快,口唇发绀",吸氧等级更改为"推荐"
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C。呼吸浅快,口唇发绀
    #    ...    uuid=8752C9ADE7
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=3    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    # ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][0]['drugClassificationLists'][1][0]['drugResponseList']]
    #    # Should Contain    ${aj}    解热镇痛抗炎药
    #    # Should Be Equal As Strings    ${getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][0]}    {"comment": "", "grade": 1, "drugClassificationLists": [[{"drugResponseList": [{"drugCommonId": 18688, "hasDetail": false, "drugCommonName": "吸氧", "drugGuid": "18688"}]}]], "itemName": "一般治疗"}
    #    Should Be Equal As Strings    ${getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][0]}    {"comment": "", "grade": 1, "drugClassificationLists": [[{"drugResponseList": [{"drugCommonName": "吸氧", "drugGuid": "18688", "hasDetail": false}]}]], "itemName": "一般治疗"}
    ######################################细菌性阴道病#########################################################################
    ${getRes}    治疗方案    symptom=白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。    uuid=8457C7ADE5    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=25    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists'][0]]
    Should Contain    ${aj}    阴道分泌物常规(清洁度及滴虫)/白带常规
    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists']}    [[{"examName": "阴道分泌物常规(清洁度及滴虫)/白带常规", "examType": 3, "examDesc": "阴道分泌物pH值＞4.5", "examId": 246, "itemResultGroupId": 76663}], [{"examName": "阴道分泌物镜检", "examType": 3, "examDesc": "阴道分泌物镜检见线索细胞", "examId": 110093, "itemResultGroupId": 76662}]]
    # 演示case-细菌性阴道病:推荐实验室检查:阴道分泌物镜检
    #    [Documentation]    白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    #    ${getRes}    治疗方案    symptom=白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    #    ...    uuid=8457C7ADE5
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=25    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists'][1]]
    #    Should Contain    ${aj}    阴道分泌物镜检
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists']}    [[{"examName": "阴道分泌物常规(清洁度及滴虫)/白带常规", "examType": 3, "examDesc": "阴道分泌物pH值＞4.5", "examId": 246, "itemResultGroupId": 76663}], [{"examName": "阴道分泌物镜检", "examType": 3, "examDesc": "阴道分泌物镜检见线索细胞", "examId": 110093, "itemResultGroupId": 76662}]]
    # 演示case-细菌性阴道病:推荐局部用药:甲硝唑栓
    #    [Documentation]    白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    #    ${getRes}    治疗方案    symptom=白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    #    ...    uuid=8457C7ADE5
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=25    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    甲硝唑栓
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists']}    [[{"examName": "阴道分泌物常规(清洁度及滴虫)/白带常规", "examType": 3, "examDesc": "阴道分泌物pH值＞4.5", "examId": 246, "itemResultGroupId": 76663}], [{"examName": "阴道分泌物镜检", "examType": 3, "examDesc": "阴道分泌物镜检见线索细胞", "examId": 110093, "itemResultGroupId": 76662}]]
    # 演示case-细菌性阴道病:推荐局部用药:甲硝唑片
    #    [Documentation]    白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    #    ${getRes}    治疗方案    symptom=白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。
    #    ...    uuid=8457C7ADE5
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=25    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][1]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    甲硝唑片
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists']}    [[{"examName": "阴道分泌物常规(清洁度及滴虫)/白带常规", "examType": 3, "examDesc": "阴道分泌物pH值＞4.5", "examId": 246, "itemResultGroupId": 76663}], [{"examName": "阴道分泌物镜检", "examType": 3, "examDesc": "阴道分泌物镜检见线索细胞", "examId": 110093, "itemResultGroupId": 76662}]]
    # ######################################婴儿腹泻##############################################################################
    # 演示case-婴儿腹泻:推荐实验室检查-:粪便常规
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists'][0]]
    #    Should Contain    ${aj}    粪便常规
    # 演示case-婴儿腹泻:推荐实验室检查-鉴别检查:⾎常规
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][1]['examLists'][0]]
    #    Should Contain    ${aj}    血常规
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][1]['examLists'][0]}    血常规
    # 演示case-婴儿腹泻:推荐实验室检查-鉴别检查:⾎⽓分析
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][1]['examLists'][1]]
    #    Should Contain    ${aj}    血气分析
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][1]['examLists'][0]}    血常规
    # 演示case-婴儿腹泻:推荐实验室检查-鉴别检查:血电解质
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][0]['examLists'][1]]
    #    Should Contain    ${aj}    血电解质
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][1]['examLists'][0]}    血常规
    # 演示case-婴儿腹泻:推荐实验室检查-鉴别检查:粪便轮状病毒检测
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][0]['examLists'][0]]
    #    Should Contain    ${aj}    粪便轮状病毒检测
    #    # Should Be Equal As Strings    ${getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][1]['examGroupList'][1]['examLists'][0]}    血常规
    # 演示case-婴儿腹泻:推荐辅助检查:心电图
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][1]['examRuleGroupList'][0]['examGroupList'][0]['examLists'][0]]
    #    Should Contain    ${aj}    心电图
    # 演示case-婴儿腹泻:推荐一般治疗:口服补液盐溶液
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    口服补液盐溶液
    # 演示case-婴儿腹泻:推荐药物治疗:蒙脱⽯散
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][1]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    蒙脱石散
    # 演示case-婴儿腹泻:推荐药物治疗:双歧杆菌三联活菌肠溶胶囊
    #    [Documentation]    腔溃疡伴起疱3天。患儿3天前晨起发热，之后口腔出现溃疡，伴疼痛，影响进食，出现水疱，未经诊治。右颊、舌部、下唇可余处溃疡面，直径2~3mm，上覆假膜，周围黏膜充血。掌、指腹、足底可散在透明水疱。患儿烦躁、流涎，体温37.6°C
    #    ${getRes}    治疗方案    symptom=因发热、呕吐、腹泻1天.1天前，患⼉儿母亲腹泻后，患⼉出现发热，体温最⾼高达38.9℃，伴呕吐，呕吐呈非喷射性，较频繁，为胃内容物，不含胆汁及咖啡样物；⼤便3～4次，为⻩色水样便，不含黏液及脓⾎.精神反应较差，全⾝⽆⾎点、淤点及淤斑，⼼率140次/分，律齐，⼼音有力
    #    ...    uuid=8752C0A1E6
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=4    ageType=月    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][1]['drugRuleGroupList'][1]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    双歧杆菌三联活菌肠溶胶囊
    # ######################################湿疹#######################################
    # 演示case-湿疹:推荐局部治疗:硼酸洗液
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][1]['drugRuleGroupList'][3]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    硼酸洗液
    # 演示case-湿疹:推荐局部治疗:氧化锌油
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][1]['drugRuleGroupList'][5]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    氧化锌油
    # 演示case-湿疹:推荐局部治疗:钙调神经磷酸酶抑制剂
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['classification'] for aj in $getRes['body']['drugRegimenItemList'][1]['drugRuleGroupList'][2]['drugClassificationLists'][0]]
    #    Should Contain    ${aj}    钙调神经磷酸酶抑制剂
    # 演示case-湿疹:推荐物理治疗:紫外线疗法
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][3]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    紫外线疗法
    # 演示case-湿疹:推荐全⾝治疗:抗组胺药
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['classification'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][0]['drugClassificationLists'][1]]
    #    Should Contain    ${aj}    抗组胺药
    # 演示case-湿疹:推荐物理治疗:维生素C颗粒
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    维生素C颗粒
    # 演示case-湿疹:推荐全⾝治疗:糖⽪质激素
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['classification'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][1]['drugClassificationLists'][0]]
    #    Should Contain    ${aj}    糖皮质激素（口服剂型）
    # 演示case-湿疹:推荐全⾝治疗:免疫抑制药
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['classification'] for aj in $getRes['body']['drugRegimenItemList'][2]['drugRuleGroupList'][2]['drugClassificationLists'][0]]
    #    Should Contain    ${aj}    免疫抑制药
    # 演示case-湿疹:推荐全身用药:雷公藤多苷片
    #    [Documentation]    四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ${getRes}    治疗方案    symptom=四肢反复起红斑丘疹3年，加重半⽉。3年前患者不明原因出现四肢起红斑、丘疹，伴剧烈瘙痒，皮疹反复发作，以夏季较重，曾于当地医院⽤药，具体不详，病情仍 时轻时重，半⽉前皮疹加重，数量增多，瘙痒加重。自患病以来精神、⾷欲尚可，睡眠正常，⼤⼩便⽆改变，体重⽆明显变化。四肢见较多红斑、丘疹、水疱、 抓痕，散在丘疱疹、糜烂、炎性渗出
    #    ...    uuid=8653C9A8E4
    #    ...    previousHistory=    personalHistory=
    #    ...    allergyHistory=    familyHistory=
    #    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    #    ...    examInfo=    heartRate=    age=32    ageType=岁    confirmDiagnosis=
    ...    # confirmDiagnosisMap=
    #    ...    presentHistory=
    #    ${aj}    Evaluate    [aj['drugCommonName'] for aj in $getRes['body']['drugRegimenItemList'][0]['drugRuleGroupList'][0]['drugClassificationLists'][0][0]['drugResponseList']]
    #    Should Contain    ${aj}    雷公藤多苷片
