*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
jira相关问题回归病历
    眼科oct检查提示黄斑水肿    眼科检查
    左眼胀痛1天加重2小时到眼科就诊，测眼压：左眼眼压：25mmHg ；右眼眼压：14mmHg    眼科检查
    右侧肢体肌力 2级    偏身肌力
    儿童ALL临床危险度分型中危    儿童ALL临床危险度分型IR
    ADNaseB阳性    抗脱氧核糖核酸酶B阳性
    抗脱氧核糖核酸酶B阳性    ADNaseB阳性
    尿潜血阳性    血尿
    尿隐血++    血尿
    诊断 急性链球菌感染后肾小球肾炎    急性链球菌感染后肾炎
    避免外伤及避免意外事件发生    警惕意外事件发生
    诊断：肾积水伴肾结石    肾积水
    诊断：肾积水伴肾结石    肾结石
    定期测眼压无异常    定期眼科检查
    血清抗核抗体滴度 1:3    血清抗核抗体滴度>1:2
    补体C3 1.0 g/L    补体C3>=0
    血清补体C3下降    补体C3>=0
    川崎病冠状动脉异常危险分层 3a级    川崎病冠状动脉病变危险分层
    患者出院后按时随访    定期随访
    患者冠状动脉内径快速扩张    冠脉内径快速扩张
    补体C4升高    补体C4>=0
    系膜增殖性肾小球肾炎    肾病综合征病理分型
    舒张压91mmHg 惊厥    舒张压
    舒张压91mmHg 惊厥    惊厥
    裂隙灯检查    眼科检查
    色觉检查    眼科检查
    #建议家庭成员接种流感疫苗    流感疫苗
    抗双磷酸吡啶核苷酸酶滴度升高    抗双磷酸吡啶核苷酸酶阳性
    检查提示细菌培养链球菌阳性持续3个月    细菌培养链球菌阳性<=3个月
    急性链球菌感染后肾炎    急性链球菌感染后肾小球肾炎
    系膜毛细血管性肾小球肾炎    肾病综合征病理分型
    动脉血氧饱和度检查    SaO2
    SaO2检查未见异常    SaO2
    补体C3降低    补体C3>=0
    尿蛋白定量60mg/kg/24h    24h尿蛋白定量>=50mg/kg
    血小板 10x10^9/L    血小板<20x10^9/L
    患者近期患有出血性疾病，不能服用阿斯匹林    不能服用
    颅内压高于正常值    颅内压升高
    腿部肌力2    下肢肌力评估<3
    血常规示血白细胞不升高    血白细胞不升高
    诊断：紫癜性肾炎    紫癜性肾炎
    PSI评分：28分    PSI评分
    血常规检查提示白细胞升高    WBC升高
    #患者，男，20天，主要症状黄疸，诊断高胆红素血症    新生儿高胆红素血症
    肾癌术后，血尿，肾脏肿块，乏力1周伴咳嗽咳痰    肾癌
    患者意识模糊，神志不清。    神志不清
    患者钙拮抗剂治疗有效，继续原方案治疗    钙拮抗剂治疗有效
