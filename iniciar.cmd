@echo off
setlocal
title Asistente USB ADB - Samsung Galaxy A11

echo Asistente de conexion USB ADB
echo =============================
echo.
echo Este programa no activa ni desbloquea la Depuracion USB.
echo Primero debes activarla en el telefono y aceptar el aviso de autorizacion.
echo.
echo En el Galaxy A11:
echo   1. Ajustes ^> Acerca del telefono ^> Informacion de software.
echo   2. Pulsa "Numero de compilacion" 7 veces e introduce tu PIN si lo pide.
echo   3. Vuelve a Ajustes ^> Opciones de desarrollador.
echo   4. Activa "Depuracion por USB" y conecta el telefono con un cable de datos.
echo   5. Desbloquea el telefono y acepta "Permitir depuracion por USB".
echo      Acepta la clave RSA solo si confias en esta computadora.
echo.
pause

where adb.exe >nul 2>&1
if errorlevel 1 goto no_adb

echo.
echo Iniciando el servidor ADB...
adb start-server
if errorlevel 1 goto adb_error

echo.
echo Dispositivos detectados:
adb devices -l
echo.
echo Interpreta el estado asi:
echo   device       Telefono autorizado.
echo   unauthorized Desbloquea el telefono y acepta el aviso RSA.
echo   offline      Desconecta y vuelve a conectar el cable; revisa el modo USB.
echo   Sin numero   Revisa el cable de datos, el puerto USB y los controladores Samsung.
echo.
echo Para instrucciones y soluciones, consulta README.md.
goto finish

:no_adb
echo.
echo No se encontro adb.exe en PATH.
echo Descarga Android SDK Platform-Tools desde:
echo https://developer.android.com/tools/releases/platform-tools
echo Extrae la carpeta y agrega su ruta al PATH de Windows. Luego vuelve a ejecutar este archivo.
goto finish

:adb_error
echo.
echo ADB no pudo iniciar. Revisa la instalacion de Platform-Tools.

:finish
echo.
pause
endlocal
