    #!/bin/bash

#########################################################################
# 									#
# HoraAtual.sh - Traz uma mensagem de acordo horário do dia		#
#									#
# Autor: Alex de Sousa Pereira alexdesousapereiraa@gmail.com            #
# Data Criação: DD/MM/YYYY						#
#									#
# Descrição: Script de de exemplo do comando IF     			#
#	     A partir de uma entrada do usuário, será trazido o 	#
#	     horario do dia com uma mensagem.                           #
#									#
# Exemplo de uso: ./HoraAtual.sh				        #
#									#
#########################################################################


HORA=$(date +%H) # Hora atual
MIN=$(date +%M) # Minuto atual

# Definindo mensagem de bom dia, boa tarde ou boa noite

if [ $HORA -ge 06 -a $HORA -lt 12 ] 
then
	echo "Bom dia!"
elif [ $HORA -ge 12 -a $HORA -lt 18 ]
then
	echo "Boa Tarde!"
else
	echo "Boa Noite"
fi

# IF para definir AM/PM
if [ $HORA -ge 12 ]
then
	AMPM=PM
else
	AMPM=AM
fi

echo
echo "A hora atual é: $HORA:$MIN $AMPM"

# Fim do Script

