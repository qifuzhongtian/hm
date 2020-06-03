*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
通用识别
    [Documentation]    断言:""
    ${getRes}    通用识别    contents={"content":"主诉:视物成双1月余，发作性四肢抽搐伴意识不清11天。","type":2},{"content":"现病史:患者1月余前(6月初)无明显诱因出现视物成双，上下视明显，伴全身乏力，精神状态差","type":10},{"content":"体格检查:一般情况:T:37.3℃ P:92次/分 R:22次/分 BP:117/69mmHg。发育正常，营养良好，身高162厘米，体重75公斤。。神志药物镇静状态","type":3},{"content":"辅助检查:2019-06-20 青县人民医院:头颅MRI:双侧下丘脑异常信号，建议复查。。","type":20},{"content":"既往史:患者近半年来间断节食，服用代餐，口服减肥药， ","type":13},{"content":"传染病史:否认肝炎、结核、SARS、禽流感史及密切接触史。。","type":130},{"content":"个人生活史:原籍出生，无外地久居史，","type":15},{"content":"家族史:父亲体健，母亲体健，兄弟姐妹体健，否认家族遗传病史及类似疾病","type":16},{"content":"初步诊断:颅内病变。 韦尼克氏脑病（Wernicke脑病）？。 自身免疫性脑炎？","type":86}
    ${aj}    Evaluate    [aj['contentType'] for aj in $getRes['body']['contentResults']]
    Should Contain    ${aj}    ${2}


