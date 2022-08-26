#!/bin/bash

#########################################################################
# Exercício 1 - Instruções de Loop					#
#									#	
# Nome: ListaUsuarios.sh						#
#									#
# Autor: Alex de Sousa Pereira                                          #
# Data: DD/MM/AAAA							#
#									#
# Descrição: Listar todos os usuários (humanos) do sistema		#
#	     exibindo as principais informacoes da conta		#
#									#
# Uso: ./ListaUsuarios.sh						#
#									#
#########################################################################

#UIDs utilizados para usuários comuns

# Pega o id Minimo e Máximo  do usuário

# grep -> procura a palavra no script

# tr -> remove os espaçamentos de tab

# cut -> seleciona a segunda palavra

MIN_UID=$(grep "^UID_MIN" /etc/login.defs|tr -s "\t"|cut -f2) 

MAX_UID=$(grep "^UID_MAX" /etc/login.defs|tr -s "\t"|cut -f2)

OLDIFS=$IFS
IFS=$'\n' # troca  if para linha

#Criando o cabeçalho da saída
echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO"

for i in $(cat /etc/passwd) # execyta cada linha do arquivo
do
	USERID=$(echo $i | cut -d":" -f3) # pega o user id
	if [ $USERID -ge $MIN_UID -a $USERID -le $MAX_UID ]
	then
		USER=$(echo $i | cut -d":" -f1)
		USERDESC=$(echo $i | cut -d":" -f5 | tr -d ',')
		USERHOME=$(echo $i | cut -d":" -f6)
		echo -e "$USER\t\t$USERID\t\t$USERHOME\t\t$USERDESC"
	fi
done
IFS=$OLDIFS # retorna if para normal
