ESTE TEMPLATE TEM POR OBJETIVO COLETAR DADOS SOBRE SESSOES BGP NO ROUTEROS 7
    #Importar o Template no zabbix 
    #Adicionar o script no mikrotik 
    #Criar uma communitie SNMP com acesso a escrita 
    #Verificar qual o index do script com 
    snmpwalk -On -v2c -c <communitie> <ip> .1.3.6.1.4.1.14988.1.1.8.1.1.2
    #ajustar no item json do template o numero correspondente ao script 
    ex: .1.3.6.1.4.1.14988.1.1.18.1.1.2.x onde "x" é o numero do script