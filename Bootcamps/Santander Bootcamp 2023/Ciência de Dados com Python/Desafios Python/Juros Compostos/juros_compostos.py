valor_inicial = float(input())
taxa_juros = float(input())
periodo = int(input())

#valor_inicial = 5000
#taxa_juros = 0.08
#periodo = 5

valor_final = valor_inicial

#TODO: Iterar, baseado no período em anos, para calculo do valorFinal com os juros.
def calculadora_juros_compostos(valor_inicial, periodo, taxa_juros): 
    valor_final = valor_inicial * ((1 + taxa_juros)**periodo)
    return valor_final

print(f"Valor final do investimento: R$ {calculadora_juros_compostos(valor_inicial, periodo, taxa_juros):.2f}")