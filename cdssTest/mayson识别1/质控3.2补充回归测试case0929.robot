*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

*** Test Cases ***
质控3.2补充回归测试case0929
    出院后定期检查眼底    定期眼科检查
    餐后血糖13.8mmol/l    血糖>=0
    血糖升高    血糖>=0
    血糖降低    血糖>=0
    空腹血糖2.8mmol/l    血糖>=0
    补体C3降低    补体C3>=0
    补体C3：80mg/dl    补体C3>=0
    补体C3升高    补体C3>=0
    补体C4：40mg/dl    补体C4>=0
    补体C4升高    补体C4>=0
    补体C4降低    补体C4>=0
    补体C4：8mg/dl    补体C4>=0
    BP：120/60mmHg    收缩压>=0
    收缩压正常    收缩压>=0
    收缩压升高    收缩压>=0
    BP：120/60mmHg    舒张压>=0
    舒张压正常    舒张压>=0
    动脉血氧分压升高    PaO2>=0
    动脉血氧饱和度升高    SaO2>=0
    血氧饱和度降低    SpO2>=0
    SpO2：94%    SpO2>=0