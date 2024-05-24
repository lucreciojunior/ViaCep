*** Settings ***

Resource    base.robot


*** Keywords ***
Quando consultar o CEP
    [Arguments]                        ${CEP}
    ${RESPOSTA}    Get in              ${CEP}
    Set Global Variable                ${RESPOSTA}
    Log                                ${RESPOSTA}

E verificar os campos de retorno do cep solicitado
    Set Global Variable                ${campo}    ${RESPOSTA.json()}
    Dictionary Should Contain Key      ${campo}    cep
    Dictionary Should Contain Value    ${campo}    54759-475
    Dictionary Should Contain Key      ${campo}    logradouro
    Dictionary Should Contain Value    ${campo}    Rua Manoel Honorato da Costa
    Dictionary Should Contain Key      ${campo}    complemento
    Dictionary Should Contain Value    ${campo}    ${EMPTY}
    Dictionary Should Contain Key      ${campo}    bairro
    Dictionary Should Contain Value    ${campo}    Vila da Fábrica
    Dictionary Should Contain Key      ${campo}    localidade
    Dictionary Should Contain Value    ${campo}    Camaragibe
    Dictionary Should Contain Key      ${campo}    uf
    Dictionary Should Contain Value    ${campo}    PE
    Dictionary Should Contain Key      ${campo}    ibge
    Dictionary Should Contain Value    ${campo}    2603454
    Dictionary Should Contain Key      ${campo}    gia
    Dictionary Should Contain Value    ${campo}    ${EMPTY}
    Dictionary Should Contain Key      ${campo}    ddd
    Dictionary Should Contain Value    ${campo}    81
    Dictionary Should Contain Key      ${campo}    siafi
    Dictionary Should Contain Value    ${campo}    2629
    Log                                ${campo}

  
E o body não pode está vazio
    Should Not Be Empty               ${RESPOSTA.json()}

Então ira visuazilar o Status Code
    [Arguments]                       ${statusCode}
    Should Be Equal As Strings        ${RESPOSTA.status_code}        ${statusCode}
    Log                               ${statusCode}

E validara a mensagem de erro para o CEP inexistente
    [Arguments]                      ${mensagem}
    Set Global Variable              ${campoErro}        ${RESPOSTA.json()}[erro]    
    Should Be Equal As Strings       ${campoErro}        ${mensagem}
    Log                              ${mensagem}

E validara o Reason com valor
    [Arguments]                       ${reason}
    Should Be Equal As Strings        ${RESPOSTA.reason}        ${reason}
    Log                               ${reason}