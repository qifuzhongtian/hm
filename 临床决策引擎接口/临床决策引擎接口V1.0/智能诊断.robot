*** Settings ***
Resource          ../惠每决策引擎接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
2.1智能诊断接口
    [Documentation]    断言error:""
    智能诊断    0    symptom=发热    previousHistory=
    ...    personalHistory=    allergyHistory=    familyHistory=    weight=    gender=    bodyTempr=    lowBldPress=    highBldPress=    heartRate=    age=    ageType=    height=    waistline=    presentHistory=    leukocyte=    proteolipin=    erythrocyte=    glucose=    nitrite=    ph_value=    ketone_bodies=    vc=    urobilinogen=    proportion=    bilirubin=    hemoglobin=    fasting_glucose=    tc=    tg=    hdlc=    ldlc=    confirmDiagnosis=    confirmDiagnosisMap=
    ...    examItems=[{id:1,value:},{id:2,value:},{id:3,value:},{id:4,value:},{id:5,value:},{id:6,value:},{id:7,value:},{id:8,value:},{id:9,value:},{id:10,value:},{id:11,value:},{id:12,value:},{id:13,value:},{id:14,value:},{id:15,value:},{id:16,value:},{id:17,value:},{id:18,value:}]