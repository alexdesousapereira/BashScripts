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
########################################################################

# Condicção Para verificar se foi inserido algum processo

TIME=10

EMAIL=alexdesousapereiraa@gmail.com

if [ $# -eq 0 ]
then
	echo "Favor informar um processo como argumento."
	echo
	echo "$0 <processo>"
	exit 1
while true
do
	if ps axu |grep $1 |grep -v grep |grep -v $0 > /dev/null
	then
		sleep $TIME
	else
		echo -e "ATENÇÃO!!!!!!! O processo $1 NÃO está em execução!"
 |mail -s "Relatorio do Script $1" $EMAIL
	sleep $TIME

