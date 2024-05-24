*** Settings ***
Documentation       Documentacao da API: VIACEP

Resource            ../resources/services.robot

Suite Setup         Conectar a API


*** Test Cases ***
Realizando um GET no VIACEP com sucesso
    Quando consultar o CEP                                  54759475
    Então ira visuazilar o Status Code                      200
    E verificar os campos de retorno do cep solicitado

Realizando um GET no VIACEP com CEP inexistente
    Quando consultar o CEP                                  99999999
    Então ira visuazilar o Status Code                      200
    E validara a mensagem de erro para o CEP inexistente    True
    
Realizando um GET no VIACEP com 9 digitos 
    Quando consultar o CEP                                  999999999
    Então ira visuazilar o Status Code                      400

Realizando um GET no VIACEP com 7 digitos 
    Quando consultar o CEP                                  1234567
    Então ira visuazilar o Status Code                      400

Realizando um GET no VIACEP com alfanumericos
    Quando consultar o CEP                                  ABCDE475
    Então ira visuazilar o Status Code                      400

Realizando um GET no VIACEP com espaço entre os digitos 
    Quando consultar o CEP                                  54759 475
    Então ira visuazilar o Status Code                      400

Realizando um GET no VIACEP com carecteres especiais  
    Quando consultar o CEP                                  54759+-@
    Então ira visuazilar o Status Code                      400