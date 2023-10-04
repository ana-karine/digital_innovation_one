ativos = []

# Entrada da quantidade de ativos
quantidadeAtivos = int(input())

#quantidadeAtivos = 3

# Entrada dos códigos dos ativos
for _ in range(quantidadeAtivos):
    codigoAtivo = input()
    ativos.append(codigoAtivo)

# TODO: Ordenar os ativos em ordem alfabética.
ativos_ordem_alfabetica = sorted(ativos.copy())

# TODO: Imprimir a lista de ativos ordenada, conforme a tabela de exemplos.
print(*ativos_ordem_alfabetica, sep = "\n")