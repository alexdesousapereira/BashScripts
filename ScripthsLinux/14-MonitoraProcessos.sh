#!/bin/bash

#########################################################################
# Exercício 2 - Instruções de Loop                                      #
#									#	
# Nome: MonitoraProcesso.sh						#
#									#
# Autor:  Alex de Sousa Pereira                                         #
# Data: DD/MM/AAAA							#
#									#
# Descrição: Processo deve rodar como Daemon, monitorando a execução 	#
# de um processo passado por parâmetro.	Exibe constantes mensagens 	#
# na tela quando o processo não está em execução			#
#									#
# Uso: ./MonitoraProcesso.sh <processo>					#
#									#
#########################################################################

TIME=5

# Condição para verificar se foi inserido algum processo.

if [ $# -eq 0 ]
then
	echo "Favor informar um processo como argumento."
	echo "./MonitoraProcesso.sh <processo>"
	exit 1
fi

# Condição verifica se o processo está em execução.

while true
do
	if ps axu |grep $1 |grep -v grep |grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo "ATENÇÃO!!!!!!! O processo $1 NÃO está em execução!"
		sleep $TIME
	fi
done
