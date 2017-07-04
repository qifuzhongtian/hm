*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
# Suite Setup    Delete All Sessions
Suite Teardown    Delete All Sessions

*** Test Cases ***
1.血氧饱和度为89% -> 血氧饱和度降低
    [Documentation]    断言:"[allCallbackWords]包含:血氧饱和度降低"
    ${getRes}    病例识别    symptom=血氧饱和度为89%
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}    血氧饱和度降低

2.嗜酸性粒细胞计数1.03×10^9／L -> 嗜酸性粒细胞增多
    [Documentation]    断言:"[allCallbackWords]包含:嗜酸性粒细胞增多"
    ${getRes}    病例识别    symptom=嗜酸性粒细胞计数1.03×10^9／L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}    嗜酸性粒细胞增多

3.血钾<3.5mmol/L -> 血钾降低
    [Documentation]    断言:"[allCallbackWords]包含:血钾减低"
    ${getRes}    病例识别    symptom=血钾<3.4mmol/L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}    血钾减低


4.CRP 36mg/L -> C反应蛋白升高
    [Documentation]    断言:"[allCallbackWords]包含:C反应蛋白升高"
    ${getRes}    病例识别    symptom=CRP 36mg/L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}    C反应蛋白升高

5.PPD试验：局部硬结直径5mm（+） -> PPD阳性
    [Documentation]    断言:"[allCallbackWords]包含: ppd阳性"
    ${getRes}    病例识别    symptom=PPD试验：局部硬结直径5mm（+）
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     ppd阳性


6.总胆红素450.4μmol／L -> 血清总胆红素升高
    [Documentation]    断言:"[allCallbackWords]包含: 血清总胆红素升高"
    ${getRes}    病例识别    symptom=总胆红素450.4μmol／L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     血清总胆红素升高


7.空腹血糖:3mmol／L->空腹血糖降低
    [Documentation]    断言:"[allCallbackWords]包含: 空腹血糖降低"
    ${getRes}    病例识别    symptom=空腹血糖: 3mmol／L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     空腹血糖降低


8.空腹血糖:6.6mmol／L->空腹血糖升高
    [Documentation]    断言:"[allCallbackWords]包含: 空腹血糖升高"
    ${getRes}    病例识别    symptom=空腹血糖: 6.6mmol／L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     空腹血糖升高

9.血红蛋白: 170g／L->血红蛋白增高
    [Documentation]    断言:"[allCallbackWords]包含: 血红蛋白增高"
    ${getRes}    病例识别    symptom=血红蛋白: 170g／L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     血红蛋白增高


10.高密度脂蛋白胆固醇为0.2mmol/L->高密度脂蛋白胆固醇降低
    [Documentation]    断言:"[allCallbackWords]包含: 高密度脂蛋白胆固醇降低"
    ${getRes}    病例识别    symptom=高密度脂蛋白胆固醇为0.2mmol/L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     高密度脂蛋白胆固醇降低

11.高密度脂蛋白胆固醇为3mmol/L->高密度脂蛋白胆固醇增高
    [Documentation]    断言:"[allCallbackWords]包含: 高密度脂蛋白胆固醇增高"
    ${getRes}    病例识别    symptom=高密度脂蛋白胆固醇为3mmol/L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     高密度脂蛋白胆固醇增高

12.PLT:90-血小板计数减少
    [Documentation]    断言:"[allCallbackWords]包含: 血小板计数减少"
    ${getRes}    病例识别    symptom=PLT:90
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     血小板计数减少

13.血清肌酐：120umol/L->血清肌酐升高
    [Documentation]    断言:"[allCallbackWords]包含: 血清肌酐升高"
    ${getRes}    病例识别    symptom=血清肌酐：120umol/L
    ...    gender=    age=    ageType=
    ${aj}    Evaluate    [aj for aj in $getRes['body']['allCallbackWords']]
    Should Contain    ${aj[:3]}     血清肌酐升高
