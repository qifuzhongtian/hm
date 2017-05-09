*** Settings ***
Resource          ../cdss接口关键字.robot
Library           Collections
Library           RequestsLibrary

# 字段名 类型 是否必须 说明
#


*** Test Cases ***
6.1常见体格检查
    [Documentation]    断言:"bodyPart=一般检查"
    常见体格检查    ['body']['commonPhysicalMore'][0]['bodyPart']    一般检查


