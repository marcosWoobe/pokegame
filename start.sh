#!/bin/bash

# script pra rodar novamente o server automático em caso de crash
echo "Iniciando o Server (ANT-ROLL)"

cd /root/gameVks/
mkdir -p crashs

#configs necessárias para o Anti-rollback
ulimit -c unlimited
set -o pipefail

while true 		#repetir pra sempre
do
 	#roda o server e guarda o output ou qualquer erro no logs
	#PS: o arquivo skz_roll deve estar na pasta do tfs	
	gdb --batch -return-child-result --command=skz_roll --args ./tfs 2>&1 | awk '{ print strftime("%F %T - "), $0; fflush(); }' | tee "crashs/$(date +"%F %H-%M-%S.log")"
	if [ $? -eq 0 ]; then							 
		echo "Exit code 0, aguardando 5 segundos..."	 #pra ser usado no backup do banco de dados
		sleep 5	#3 minutos						
	else											
		echo "Crash!! Reiniciando o servidor em 5 segundos AUTOMATICAMENTE (O arquivo de log está guardado na pasta crashs)"
		echo "Se quiser encerrar o servidor, pressione CTRL + C..."		
		sleep 5										
	fi												
done;