*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           ExcelLibrary
Library           String

*** Test Cases ***
识别接口0510
    下肢肌力评估2    下肢肌力评估<3
    洼田饮水试验2级    洼田饮水试验>=2级
    洼田饮水试验3级    洼田饮水试验>=2级
    洼田饮水试验1级    洼田饮水试验[1-5]级
    洼田饮水试验2级    洼田饮水试验[1-5]级
    洼田饮水试验3级    洼田饮水试验[1-5]级
    洼田饮水试验4级    洼田饮水试验[1-5]级
    洼田饮水试验5级    洼田饮水试验[1-5]级
    nihss4分    nihss>3分
    nihss0分    nihss>=0分
    nihss1分    nihss>=0分
    CHA2DS2-VASc3分    CHA2DS2-VASc>2分
    心房粘液瘤    心房粘液瘤
