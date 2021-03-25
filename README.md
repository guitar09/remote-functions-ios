<h2>Remote Functions</h2>

É um processador de Java Script onde você pode alterar comportamentos e regras de negócio da sua aplicação sem ter a necessidade de gerar uma nova build(APK).


<h2>Tipos de Retorno</h2>

Os possíveis tipos de retornos das suas funções em Java Script:

* StringFunc
* IntFunc
* DoubleFunc
* BooleanFunc

<h2>Exemplo Simples</h2>

Buscando o retorno de uma função simples em Java Script que retorna uma String

        //Aqui você busca suas funções Java Script de um WebService ou do Banco de dados etc
        let jsRepository = "function nome() { return 'Higor';} nome();";
        
        do {
            let retornoString = try ControllerFunction(function: jsRepository).build() as StringFunc
            print(retornoString.toResult())
        }catch {
            
        }
  
<h2>Funções com Parâmetros</h2>

Você pode criar funções para substituição de parâmetros, basta criar seus parâmetros com colchetes([ ]). Veja um exemplo:

        //Aqui você busca suas funções Java Script de um WebService ou do Banco de dados etc
        let jsRepository = "
        
         function isSaqueAprovado() 
          {   var LIMITE_MAXIMO_SAQUE = 800; 
              var saqueAprovado = [VALOR_SAQUE] <= LIMITE_MAXIMO_SAQUE; 
              return saqueAprovado;
          } 
          
          isSaqueAprovado();"
        
        do {
            let retornoBoolean = try ControllerFunction(function: jsRepository)
                .addParam(param: "VALOR_SAQUE", paramSet: "1000")
                .build() as BooleanFunc
            print(retornoBoolean.toResult())
        }catch {
            
        }
        
Nessa função isSaqueAprovado() poderíamos alterar a regra de negócio ao mudar o valor da constante LIMITE_MAXIMO_SAQUE, sendo que essa função Java Script teria que vir de algum endpoint do seu sistema.

<h2>Multiplas Funções com Parâmetros</h2>
  
          //Aqui você busca suas funções Java Script de um WebService ou do Banco de dados etc
        let jsRepository = "
        
         function isSaqueAprovado() {   
              var LIMITE_MAXIMO_SAQUE = 800; 
              var saqueAprovado = [VALOR_SAQUE] <= LIMITE_MAXIMO_SAQUE; 
              return saqueAprovado;
          } 
           
          function calculaFake() {
              var PERCENTUAL_TAXA = 0.03;
              return ([VALOR_TOTAL] + [VALOR_BONUS]) * PERCENTUAL_TAXA;
           }
           
           #FUNCTION_NAME#
              
          ;"
        
        do {
            let retornoBoolean = try ControllerFunction(function: jsRepository)
                .addParam(param: "VALOR_SAQUE", paramSet: "1000")
                .nameFunction(nameFunction: "isSaqueAprovado()")
                .build() as BooleanFunc
            print(retornoBoolean.toResult())
        }catch {
            
        }
        
        do  {
            let retornoDouble = try ControllerFunction(function: jsRepository)
                .addParam(param: "VALOR_TOTAL", paramSet: "500")
                .addParam(param: "VALOR_BONUS", paramSet: "10")
                .nameFunction(nameFunction: "calculaFake()")
                .build() as DoubleFunc
            
            print(retornoDouble.toResult())
        }catch {
            
        }
        
Quando você utilizar um Java Script com diversas funções utilize a tag de #FUNCTION_NAME# no final do seu arquivo de funções, assim você pode substituir o nome das suas funções através do método .nameFunction() na criação do seu objeto Controller.

<h2>Métodos Adicionais</h2>

Você pode realizar a verificação se todos os seus parâmetros foram substituidos nas suas funções em Java Script através do método:

    .forceReplaceAllParams(replaceAllParams: true)
      
Você pode imprimir uma String do seu Java Script para verificar algum problema através do método:

    .printFunction()
