#!/bin/bash

#########################################################################
# Exercício 3 - Instruções Condicionais                                 #
#									#
# Nome: OperacoesValores.sh						#
#									#
# Autor: Alex de Sousa Pereira (alexdesousapereiraa@gmail.com      	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: O script recebe dois valores inseridos pelo usuário	#				
#	     e exibe um menu para que uma das operações básicas 	#
#	     seja realizada						#
#									#
# Uso: ./OperacoesValores.sh						#
#									#
#########################################################################

# Lendo variáveis 

echo "Informe o valor 01:"

read VAR01

echo "Informa o valor 02:"

read VAR02

echo "Escola uma das operações:"

echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo "Q = Sair"
echo
read -p "Opção:" OPCAO
echo

# Condicões de seleção

case $OPCAO in
	1)
		echo "A soma de "$VAR01 + $VAR02" é igual a: "$(expr $VAR01 + $VAR02)"."
		;;
	2)
		echo "A subtração de "$VAR01 - $VAR02" é igual a: "$(expr $VAR01 - $VAR02)"."
		;;
	3)
		echo "A multiplicação  de "$VAR01 x $VAR02"  é igual a: "$(expr $VAR01 "*" $VAR02)"."
		;;
	4)
		if [ $(expr $VAR01 % $VAR02) -eq 0 ]
		then
			echo "A divisão  de "$VAR01 / $VAR02"  é igual a: "$(expr $VAR01 / $VAR02)"."
		else
			echo "Divisão com resto = "$(expr $VAR01 % $VAR02)"."
			echo
			echo "A divisão  de "$VAR01 / $VAR02"  é igual a: "$(expr $VAR01 / $VAR02)"."
		fi
		;;
	Q)
		echo "Saindo"
		echo
		sleep 1
		exit 0
		;;
	*)
		echo "Opção inválida"
		exit 2
		;;
esac

# Fim do Script
