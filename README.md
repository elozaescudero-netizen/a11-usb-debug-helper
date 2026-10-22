# Asistente USB ADB para Samsung Galaxy A11

Este repositorio contiene `iniciar.cmd`, un asistente para Windows que comprueba si ADB esta disponible y muestra el estado de los dispositivos conectados por USB.

## Importante

Android no permite que un programa de PC active la Depuracion USB cuando esta apagada. Sin root, sin una autorizacion ADB previa y sin interactuar con el telefono, no existe un metodo compatible para saltarse esa proteccion. Este asistente no modifica ajustes del telefono, no obtiene root y no elude la pantalla de autorizacion.

## Requisitos

- Windows.
- Un cable USB que admita transferencia de datos.
- Android SDK Platform-Tools instalado y `adb.exe` disponible en el `PATH`.
- Acceso para desbloquear el Galaxy A11 y aceptar la autorizacion en pantalla.

Descarga Platform-Tools desde la pagina oficial de Android: <https://developer.android.com/tools/releases/platform-tools>.

## Preparar el telefono

1. En el telefono, abre **Ajustes > Acerca del telefono > Informacion de software**.
2. Pulsa **Numero de compilacion** siete veces. Introduce el PIN si se solicita.
3. Vuelve a **Ajustes**, abre **Opciones de desarrollador** y activa **Depuracion por USB**.
4. Conecta el telefono al PC con un cable de datos y desbloquea la pantalla.
5. Cuando aparezca el dialogo de autorizacion RSA, revisa que confias en esa computadora y pulsa **Permitir**.

Los nombres de los menus pueden variar ligeramente segun la version de Android.

## Ejecutar

Haz doble clic en `iniciar.cmd` o ejecútalo desde CMD. El asistente inicia el servidor ADB y ejecuta `adb devices -l`.

- `device`: el telefono esta conectado y autorizado.
- `unauthorized`: desbloquea el telefono y acepta el dialogo RSA.
- `offline`: reconecta el cable y revisa la conexion USB.
- Si no aparece ningun dispositivo, prueba otro cable/puerto y, si hace falta, instala los controladores USB oficiales de Samsung.

La autorizacion RSA permite a esa computadora usar ADB con el telefono. No la aceptes en equipos que no controles.
