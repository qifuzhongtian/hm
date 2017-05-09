*** Settings ***
# Suite Setup       登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
Suite Setup       Run Keywords    登录接口    yinbo    e3ceb5881a0a1fdaad01296d7554868d    1
# ...               AND    新建病历    0    ${EMPTY}    ${EMPTY}
...               AND    新建病历接口    53040
Suite Teardown    RequestsLibrary.Delete All Sessions
Resource          ../../his关键字.robot
Library           Collections
Library           RequestsLibrary

*** Variables ***

*** Test Cases ***
12.保存病例5
   [Documentation]    断言:"error=0 成功"
    保存病历5    ['head']['error']    0
    ...    recordId=${recordId}    patientId=53040    patientName=接口自动保存病例1    gender=1    age=50
    ...    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90
    ...    height=181    weight=71.5    otherPhysique=
    # ...    drugIds=${drugIds_interactionList_grade1}
    ...    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病
    ...    modle=
    ...    examList=
    ...    diagnosis={"diseaseId":"138","diseaseName":"急性心肌梗死"}


# 12.保存病例
#     [Documentation]    断言:"error=0 成功"
#     保存病历    ['head']['error']    0    recordId=    patientId=53040    patientName=接口自动保存病例    gender=1
    # ...    age=50    ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90
#     ...    heartRate=90    height=181    weight=71.5    otherPhysique=    symptom=发热    previousHistory=头痛
#     ...    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病    modle=    examList=    diagnosis=
#     ...    # ...    drugIds=${drugIds_interactionList_grade1}



    # 12.保存病例2
    #    [Documentation]    断言:""
    #    保存病历1    ['body']['interactionList'][0]['grade']    2
    #    ...    recordId=    patientId=53040    patientName=接口自动保存病例    gender=1    age=50
    # ...    # ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90
    # ...    # height=181    weight=71.5    otherPhysique=
    #    # ...    drugIds=${drugIds_interactionList_grade1}
    #    ...    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏    familyHistory=心脏病
    # ...    # modle=
    #    ...    examList=
    #    ...    examId=834    examName=抗RA33抗体    total=1    patientExamId=    price=0
    # ...    # isCharged=0    dataSource=1
    # 12.保存病例3
    #    [Documentation]    断言:""
    #    保存病历2    ['body']['interactionList'][0]['grade']    2
    #    ...    recordId=    patientId=53040    patientName=接口自动保存病例    gender=1    age=50
    # ...    # ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90
    # ...    # height=181    weight=71.5    otherPhysique=
    #    # ...    drugIds=${drugIds_interactionList_grade1}
    #    ...    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏    familyHistory=心脏病
    # ...    # modle=
    #    ...    examList=
    #    ...    examId=    examName=抗RA33抗体    total=1    patientExamId=    price=0
    # ...    # isCharged=0    dataSource=1
    # 12.保存病例4,这是成功的
    #    [Documentation]    断言:"error=0 成功"
    #    保存病历4    ['head']['error']    0
    #    ...    recordId=    patientId=53040    patientName=接口自动保存病例    gender=1    age=50
    # ...    # ageType=岁    phoneNo=1333333333    temperature=37    sbp=130    dbp=90    heartRate=90
    # ...    # height=181    weight=71.5    otherPhysique=
    #    # ...    drugIds=${drugIds_interactionList_grade1}
    #    ...    symptom=发热    previousHistory=头痛    personalHistory=咽炎    allergyHistory=花粉过敏啊啊啊    familyHistory=心脏病
    # ...    # modle=
    #    ...    examList=
    #    ...    diagnosis=
    #    ...    a={"diseaseId":"138","diseaseName":"急性心肌梗死"}



