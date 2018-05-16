*** Settings ***
Test Template     识别接口
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary
Library           ExcelLibrary

*** Test Cases ***
识别接口0322
    小脑损伤    小脑损伤
    随机血糖:17mmol/L    随机血糖>=17mmol/L
    随机血糖:18mmol/L    随机血糖>=17mmol/L
    偏瘫    偏瘫
    脑卒中    脑卒中
    颅脑损伤    颅脑损伤
    阑尾炎    阑尾炎
    空腹血糖10mmol/L    空腹血糖>=10mmol/L
    空腹血糖11mmol/L    空腹血糖>=10mmol/L
    急性细菌性前列腺炎    急性细菌性前列腺炎
    骨折    骨折
    HbA1c:9%    HbA1c>=9%
    HbA1c:10%    HbA1c>=9%