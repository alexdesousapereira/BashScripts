#!/bin/bash

#########################################################################
# Exercício 2 - Gerando Logs e Enviando E-mails                         #
#									#	
# Nome: MonitoraFS.sh							#
#									#
# Autor: Alex de Sousa Pereira                                       	#
# Data: DD/MM/AAAA							#
#									#
# Descrição: Ao ser executado o processo verifica as partições	 	#
# e caso a % de utilização de alguma delas esteja acima do limite	#
# um e-mail é enviado							#
#									#
# Uso: ./MonitoraFS.sh							#
#									#
#########################################################################

EMAIL=alexdesousapereiraa@gmail.com # email
LIMITE=10 # tempo limite
ARQ_TEMP=/tmp/monitora-particao.tmp #arquivo temporario para guardar email
LOG=/var/log/scripts/$(basename $0).log # arquivo log com o nome do script

for loop in $(df -h |grep sda|tr -s " " |tr -s ' ' ':')
do
	USO=$(echo $loop|cut -d":" -f5|tr -d "%") # Pega o tempo de uso para cada linha do arquivo
	if [ $USO -ge $LIMITE ]
	then
		PARTICAO=$(echo $loop|cut -d":" -f6)

		# Gera e Envia E-mail
		echo "Atencao! A Particao $PARTICAO esta com uso acima do limite configurado" >> $ARQ_TEMP # joga mensagem no email
		echo >> $ARQ_TEMP # joga mensagem no email
		echo "Limite = $LIMITE%" >> $ARQ_TEMP # joga mensagem no email
		echo >> $ARQ_TEMP # joga mensagem no email
		df -h $PARTICAO >> $ARQ_TEMP # joga mensagem no email

		mail -s "[$0] - Verificar Particao $PARTICAO" $EMAIL < $ARQ_TEMP # envia email
		
		# Gera LOG		
		echo "$(date "+%d/%m/%Y %H:%M") - Particao $PARTICAO - Uso $USO%" >> $LOG # Gera log
		rm -f $ARQ_TEMP # apaga arquivo temporario
	fi
done

