# **Actividad 5**
#### **Sistemas Operativos 1**
___

## **INDICE**
  - [**CARNET - NOMBRE**](#usuario)
  - [**TIPOS DE KERNEL Y SUS DIFERENCIAS**](#kernel)
  - [**USER VS KERNEL MODEL**](#user-kernel_model)
  - [**INTERRUPTIONS VS TRAPS**](#interruptions-traps)

  
___
# **USUARIO**

201907156 - Marcos Arnoldo Itzep Ixmay

___
# **KERNEL**

## Kernel Microkernel

En un sistema operativo con kernel monolítico, todos los servicios (como la gestión de procesos, memoria y comunicación entre procesos) se ubican en un único espacio de memoria. En otras palabras, el kernel es un solo fragmento de código que lleva a cabo todas las funciones.

Ejemplos: Linux, BSD.

Beneficios: Alto rendimiento y rapidez, debido a la ausencia de comunicación entre distintos módulos del kernel.

Inconvenientes: La dificultad puede complicar el mantenimiento y la depuración. Un fallo en el núcleo puede resultar en la falta de estabilidad de todo el sistema. 


## Kernel Microkernel

Un microkernel reduce las características del núcleo del sistema operativo. Sólo las funciones críticas (tales como la intercomunicación entre procesos y el manejo de interrupciones) son gestionadas en el núcleo. Los extras, tales como la gestión de red y el sistema de archivos, son llevados a cabo como procesos independientes en el espacio de usuario.

Ejemplos: Minix y QNX.

Beneficios: Mayor versatilidad y menor complejidad en el mantenimiento. Los servicios con problemas no impactan directamente en la base del sistema.

Inconvenientes: Existe la posibilidad de una sobrecarga de comunicación mayor entre el núcleo y los servicios del espacio de usuario, lo cual podría impactar en la eficacia.

## Kernel Híbrido

Fusiona características de los kernels monolíticos y microkernels. Trata de preservar la eficacia del núcleo monolítico al mismo tiempo que se mejora la modularidad del microkernel. Algunas características esenciales permanecen en el núcleo, a la vez que otras funcionan en el espacio del usuario.

Ejemplos: Windows NT, macOS.

Beneficios: Se enfoca en lograr un balance entre eficiencia y flexibilidad.

Inconvenientes: La complejidad puede alcanzar niveles elevados y la eficiencia puede ser diferente según cómo se lleve a cabo. 

## Exokernel

Un exokernel es un tipo de kernel extremadamente minimalista que ofrece la menor cantidad de abstracción necesaria sobre el hardware. Confía mucho en el software de usuario para gestionar la mayor parte del control del hardware.

Ejemplos: MIT's Exokernel.

Beneficios: Proporciona mucha flexibilidad y posibilita a los creadores del sistema operativo crear abstracciones más específicas.

Desventajas: Es necesario invertir más esfuerzo por parte del usuario para manejar el hardware y puede ser menos conveniente para aplicaciones que no necesitan un control tan preciso. 
___
# **USER-KERNEL_MODEL**

## USER MODE
Es la forma en que funcionan las aplicaciones utilizadas por los usuarios. En esta modalidad, se limita el acceso a los recursos de hardware y a las partes críticas del sistema. Las apps no cuentan con autorización para llevar a cabo acciones que podrían impactar en todo el sistema. 

## KERNEL MODEL
Es la forma en que funciona el núcleo del sistema operativo. De esta manera, el sistema operativo puede acceder sin restricciones a todos los componentes del hardware y llevar a cabo tareas privilegiadas. 


|VS | VENTAJAS  | DESVENTAJAS|
| -------------| ------------- |-------------|
|User| El aislamiento de las aplicaciones, lo que ayuda a mantener la estabilidad y seguridad del sistema operativo. Los errores en el código de usuario no afectan directamente al sistema operativo .  |  Las aplicaciones deben realizar llamadas al sistema (syscalls) para acceder a recursos protegidos, lo que puede implicar un coste en términos de rendimiento.    |
|Kernel Mode|Permite una gestión eficiente de los recursos del sistema y el control completo del hardware.| Un fallo en el código central puede resultar en la falta de estabilidad del sistema o incluso en una avería completa. Realizar operaciones en modo núcleo puede resultar en mayor gasto en cuanto a seguridad y estabilidad.
  |

___
# **INTERRUPTIONS-TRAPS**
## INTERRUPTIONS
Son señales enviadas por hardware o software que requieren la atención inmediata del sistema operativo. Las interrupciones pueden ser generadas por dispositivos de hardware (como un teclado o un disco duro) o por el sistema operativo mismo.

## TRAPS
Son eventos generados por el sistema operativo en respuesta a errores o condiciones especiales durante la ejecución de un programa. A menudo se usan para manejar errores de software, como intentos de acceso a memoria no permitida.

|VS | PROPÒSITO  | MANEJO|
| -------------| :------------- |:-------------|
|INTERRUPTIONS |Facilitan que el sistema operativo responda eficazmente a acontecimientos externos, como la recepción de datos de un dispositivo de entrada.   | El proceso en curso es interrumpido temporalmente por el sistema operativo, el cual guarda su estado y responde a la interrupción. Posteriormente, reanuda el procedimiento y sigue adelante con su funcionamiento. |
|TRAPS| Facilitar al sistema operativo el manejo controlado de errores y situaciones excepcionales.  | El sistema operativo detiene la ejecución del programa que provocó el error, gestiona la situación (como enviando una señal o terminando el proceso) y luego puede seguir con el funcionamiento del sistema o la ejecución de otros procesos.
|