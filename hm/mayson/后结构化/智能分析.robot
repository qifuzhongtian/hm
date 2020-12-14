*** Settings ***
Suite Teardown    Delete All Sessions
Resource          ../../cdss.robot
Library           Collections
Library           RequestsLibrary
Library           String
Library           DateTime

*** Variables ***

*** Test Cases ***
后结构化智能分析
    [Documentation]
    [Setup]    Run Keywords    获取时间戳
    ...    AND    获取随机数
    ${getRes}    智能分析    progress_text=入院日期：2020.04.30。出院日期：2020.05.08。入院情况：患者因上腹胀痛半月就诊于苏州市一院，2020.04.26胃镜：胃窦溃疡、幽门管溃疡、十二指肠球部溃疡。病理：（幽门粘膜）中度慢性浅表活动性炎伴肠化及溃疡形成。（胃窦粘膜）腺癌。2020.04.26胸部CT：两肺尖胸膜增厚伴钙化；两肺散在纤维灶；主动脉及部分管状动脉管壁钙化；肝脏多发稍低密度影，转移？。胃窦弯侧及腹膜后多发淋巴结肿大。遂就诊我院，核医学报告（2020.04.28）：胃癌，FDG高代谢；肝脏多发M；胃周、肝门区、肝胃间隙、腹膜后淋巴结M；肠系膜区小结节，未见FDG代谢增高。现为求进一步诊治入住我科。病程中患者腹痛较前好转，饮食睡眠可，大小便正常，近期体重无明显下降。2020.04.28门诊血常规：WBC:5.7*10^9/L,GRAN#:3.2*10^9/L,RBC:4.30*10^12/L,HGB:137g/l,PLT:227*10^9/L。2020.04.28VITROS4600-2(202004289000152)：ALT(ST):33.9U/L,ASTST:57.2U/L,UREAST:6.64mmol/L,CREAST:67umol/L。2020.4.30胸部CT:两肺散在微小结节，一般随访。两肺散在慢性炎症可能，随访。两肺尖胸膜钙化灶。右侧部分肋骨致密影，随访。腹部情况请查腹。甲状腺情况请结合专项检查。入院诊断：胃癌伴肝、腹膜后淋巴结转移 cTxNxM1 IV期。诊疗经过：患者入院后，完善相关检查，排除化疗禁忌后，于2020.05.06日行患者C1 XELOX方案，具体为：奥沙利铂针 260mg d1+卡培他滨片 2000mg bid d1-14,q3w，经过顺利，目前恢复可，暂未见骨髓抑制等不良反应出现，予今日出院。出院情况：患者一般情况可，饮食睡眠正常，大小便正常，无发热盗汗，无胸痛咳嗽，无明显恶心、呕吐及发热等不良反应，经上级医师诊视同意出院。出院诊断：胃癌伴肝、腹膜后淋巴结转移 cTxNxM1 IV期。出院医嘱：1、均衡饮食，加强营养，注意休息，避免受凉；2、口服卡培他滨满14天，至此化疗周期的第15天晨最后一顿（早2片，晚2片），如果中间漏用或者停用不用补，保证停服休息一周；3、每周查血常规2次，如白细胞小于2.0×10^9/L，中性粒细胞低于1.0×10^9/L，血小板小于75×10^9/L时，或出现严重腹泻（24小时内大于6次），停服卡培他滨，及时到医院就诊。每周查肝肾功电解质1次，如有异常对症处理。每日监测血压2次，每周复查尿常规1次。4、下次治疗前门诊找赵晓莹医师预约MRI检查，下次化疗时间2020.05.27，入院前一天在门诊行血常规、肝肾功能、心电图检查，并短信联系赵晓莹医师。5、化疗期间监测血压情况，如出现明显化疗相关不良事件，如出血等，请及时至门诊或者急诊就诊。    progress_type=${10}
    ${aj}    Evaluate    [aj['fieldName'] for aj in $getRes['body']['contentResults']]
    Should Contain    ${aj}    入院诊断
