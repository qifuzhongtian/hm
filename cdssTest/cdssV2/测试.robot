*** Settings ***
Suite Teardown    Delete All Sessions    # Suite Setup    Delete All Sessions
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           DateTime
Library           DatabaseLibrary

*** Test Cases ***
18.妇产科室演示病例15例-9
    [Documentation]    主诉:'阴道接触性出血1年、不规则阴道流血5个月。1年前同房后出现少量阴道出血，未予重视，未做任何处理。5个月前发生不规则阴道流血，无发热及腹痛。查体:宫颈中度糜烂、下唇长大呈菜花状，直径约4c m'
    ${getRes}    智能诊断2.3    symptom=阴道接触性出血1年、不规则阴道流血5个月。1年前同房后出现少量阴道出血，未予重视，未做任何处理。5个月前发生不规则阴道流血，无发热及腹痛。查体:宫颈中度糜烂、下唇长大呈菜花状，直径约4c m    previousHistory=    personalHistory=G4P1    allergyHistory=    familyHistory=
    ...    weight=    gender=0    bodyTempr=    lowBldPress=    highBldPress=    examInfo=
    ...    heartRate=    age=50    ageType=岁    confirmDiagnosis=    confirmDiagnosisMap=    presentHistory=
    ${aj}    Evaluate    [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases'][0]['subDiseases']]
    ${assert}    set variable    asdf
    Run Keyword if    '${assert}' in @{aj}    log    haha
    ...    ELSE    Set variable    ${aj} Evaluate [aj['diseaseName'] for aj in $getRes['body']['diseaseGroups'][0]['diseases']]
    log    ${aj}
    Should Contain    ${aj[:10]}    子宫颈癌


# 1.连接数据库
#     Connect To Database Using Custom Params    pymysql    atabase='his', user='enginer', password='dataisbest', host='10.117.64.153', port=3306
#     ${a} \ \     query    select * from table
#     Disconnect From Database
