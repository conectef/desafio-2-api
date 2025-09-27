# Projeto de Testes da API ViaCEP com Robot Framework

## 📄 Descrição do Projeto

Este projeto realiza **testes automatizados da API ViaCEP** utilizando **Robot Framework**.
A API ViaCEP é um serviço público que fornece informações de endereços a partir de um **CEP** (Código de Endereçamento Postal).

O objetivo deste projeto é validar:

- CEPs válidos: verificar se os dados retornados estão corretos.
- CEPs inexistentes: garantir que a resposta indica erro (`"erro": true`).
- CEPs inválidos: testar CEPs com menos ou mais de 8 dígitos.
- CEPs com caracteres especiais: verificar tratamento correto de entradas não numéricas.

---

## 📂 Estrutura do Projeto

Projeto/
├── resources/ # Arquivos de suporte
│ ├── variables.robot # Variáveis globais (URL base, ambiente de teste)
│
├── tests/ # Casos de teste em Robot Framework
│ └── viacep_api.robot # Suite completa de testes
│
├── results/ # Diretório onde os relatórios serão gerados
│
├── requirements.txt # Dependências Python do projeto
└── README.md # Documentação do projeto


---

## 📦 Dependências

Certifique-se de ter Python 3 instalado.
Para instalar as bibliotecas necessárias:

```bash
pip install -r requirements.txt

robotframework
robotframework-requests
robotframework-collections

## 🏃‍♂️ Executando os Testes

Navegue até a pasta do projeto:

```bash
robot -d results tests/viacep_api.robot


## ✅ Conclusão

Este projeto serve como **ambiente de teste completo** para praticar testes automatizados de API.
Com ele é possível validar **comportamentos funcionais e não funcionais** (tratamento de erros e formatos inválidos) de forma clara e organizada.

