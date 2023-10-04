# Entrada de dados
saldo_total = int(input())
valor_saque = int(input())

#saldo_total = 1000
#valor_saque = 200

# TODO: Criar as condições necessárias para impressão da saída, vide tabela de exemplos.
if valor_saque <= saldo_total:
  print(f"Saque realizado com sucesso. Novo saldo: {saldo_total - valor_saque}")
else:
  print(f"Saldo insuficiente. Saque nao realizado!")