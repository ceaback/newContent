*** Settings ***
Library           String
Library           DateTime
Library           OperatingSystem
Library           JsonValidator
Library           Collections
Library           RequestsLibrary
Library           FakerLibrary   
Library           curlify
Library           ../utils/generate.py

Resource    ../utils/baseURL.robot
Resource    ../resources/pages.robot
Resource    ../resources/slides.robot
Resource    ../resources/modules.robot
Resource    ../resources/appLauncher.robot
Resource    ../utils/session.robot

####inputs###
# Resource    ../api/inputs/inputs_page.robot

###Variaveis***
Resource    ../utils/variables.robot
