###POC CMS  ###

Realizar automação de forma que não tenha dependência de cenários e possa rodar paralelamente

***Setup***
- Realizar instalação Python 3
- Ter o VS Code instalado
- Ter o Robot Framework Instalado

***libs utilizadas**
- pip install robot framework
- pip install robotframework-requests
- pip install curlify
- pip install robotframework-faker
- pip install robotframework-jsonlibrary

***Criando as libs***
pip install -r requirements.txt

***Rodando os testes***
- robot -d Result  -L trace  caminho arquivo teste.robot
- robot -d Result  -L debug  api/tests/pages/
- robot -d Result  -L trace  api/tests/pages/
- robot -d Result  -L info  api/tests/pages/

***Sugestão de Extensões***
- Material Icon Theme
- Python
- Python Debugger
- Robot Framework Language
- Robot Code

***Mais alguns detalhes para execução***
 
# -i -> Executa teste segundo tag
    # robot -d ./results -i regression  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -i performance  .\src\1_general_section\executando_testes.robot
    # robot -d ./results -i smoke .\src\1_general_section\executando_testes.robot
