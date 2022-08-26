###############################################
#                                             #
#           Script de Soma de Valores         #
#                                             #
#    Autor: Alex de Sousa Pereira             #
#                                             #
###############################################

# Defininindo as variéves de ambiente:

read -p "Informe o valor da variável 01: " VAR01

echo ""

read -p "Informe o valor da variável 02: " VAR02

echo ""

# Fazendo Script

echo "A soma de "$VAR01 + $VAR02" é igual a "$(expr $VAR01 + $VAR02)"."

# FIM DO SCRIPT
