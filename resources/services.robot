*** Settings ***
Documentation       Documentacao da API: VIACEP

Library             FakerLibrary
Library             Collections
Library             RequestsLibrary

Resource            Utils.robot

*** Variables ***
${token}
${base_url}         https://viacep.com.br/ws/

*** Keywords ***
# # SETUP E TEARDOWN
Conectar a API
    Create Session    apiViacep       ${base_url}

Get in
    [Arguments]                        ${CEP}
    ${response}         GET            ${base_url}${CEP}/json/    
    ...                                expected_status=any
    [Return]                           ${response}



