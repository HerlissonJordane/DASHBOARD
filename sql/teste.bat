@echo off
setlocal enabledelayedexpansion

:: Par�metros de conex�o
set server=SIPAK
set database=SIPAK_DINHO
set username=sa
set password=pa

:: Nome do arquivo de log
set logFile=Log.txt

:: Limpa o arquivo de log se ele j� existir
echo. > %logFile%

for %%f in (*.sql) do (
  echo Executando script: %%f
  sqlcmd -S %server% -d %database% -U %username% -P %password% -i "%%f" >> %logFile% 2>>&1

  if !errorlevel! == 0 (
    echo Script %%f executado com sucesso >> %logFile%
  ) else (
    echo Erro na execu��o de %%f: C�digo de erro !errorlevel! >> %logFile%
  )
)

:: Exibir o log
type %logFile%
