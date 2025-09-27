*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../resources/variables.robot

*** Keywords ***
Criar Sessao API
    [Documentation]    Cria a sessão HTTP para a API ViaCEP
    Create Session    ${ambiente_teste}    ${BASE_URL}

Fechar Sessao API
    [Documentation]    Remove todas as sessões HTTP após os testes
    Delete All Sessions


*** Test Cases ***

Valid CEP Should Return Correct Data
    [Documentation]    Testa um CEP existente e verifica se os dados retornados estão corretos
    Criar Sessao API
    ${response}=    GET On Session    ${ambiente_teste}     /01001000/json/
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Should Be Equal    ${json["cep"]}          01001-000
    Should Be Equal    ${json["logradouro"]}   Praça da Sé
    Should Be Equal    ${json["bairro"]}       Sé
    Should Be Equal    ${json["localidade"]}   São Paulo
    Should Be Equal    ${json["uf"]}           SP
    Fechar Sessao API

Nonexistent CEP Should Return Error
    [Documentation]    Testa um CEP no formato correto mas que não existe
    Criar Sessao API
    ${response}=    GET On Session    ${ambiente_teste}    /99999999/json/
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json}    erro
    Should Be Equal    ${json["erro"]}    true
    Fechar Sessao API

Invalid CEP With Less Digits
    [Documentation]    Testa um CEP com menos de 8 dígitos
    Criar Sessao API
    ${response}=    Get Request    ${ambiente_teste}     /12345/json/
    Should Be Equal As Integers    ${response.status_code}    400
    Fechar Sessao API

Invalid CEP With More Digits
    [Documentation]    Testa um CEP com mais de 8 dígitos
    Criar Sessao API
    ${response}=    Get Request    ${ambiente_teste}     /123456789/json/
    Should Be Equal As Integers    ${response.status_code}    400
    Fechar Sessao API

CEP With Special Characters
    [Documentation]    Testa CEP com caracteres não numéricos
    Criar Sessao API
    ${response}=    Get Request    ${ambiente_teste}     /ABCD1234/json/
    Should Be Equal As Integers    ${response.status_code}    400
    Fechar Sessao API
