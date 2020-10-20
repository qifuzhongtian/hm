*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***
# ${assert}

*** Test Cases ***
治疗方案:演示case-细菌性阴道病:推荐实验室检查:阴道分泌物常规(清洁度及滴虫)白带常规
    [Documentation]    cdss/athena/v_1_0/regimen
    ${getRes}    治疗方案    symptom=白带多呈绿色伴外阴痒一⽉月余，外阴瘙痒加剧⼀周。既往体健。⽩带多呈绿⾊伴外阴痒一⽉月余，发病后⾃用盐⽔清洗外阴和口服阿莫西林和阿奇霉素，⽆明显效果，近周来外阴瘙痒加剧。肛周外阴潮湿并轻度浸渍，⼤小阴唇及阴道壁均轻度充血，阴道后穹隆和宫颈为弥漫性充血并⻅散在瘀点及糜烂面，呈草莓状外观。后穹隆有较多稀薄灰⻩色泡沫状的⽩带。    uuid=8457C7ADE5    previousHistory=    personalHistory=    allergyHistory=
    ...    familyHistory=    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=
    ...    examInfo=    heartRate=    age=25    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=
    ...    presentHistory=
    ${aj}    Evaluate    [aj['examName'] for aj in $getRes['body']['examRegimenItemList'][0]['examRuleGroupList'][0]['examGroupList'][0]['examLists'][0]]
    Should Contain    ${aj}    阴道分泌物常规(清洁度及滴虫)/白带常规

