# **Actividad 4*
#### **Sistemas Operativos 1**
___

## **INDICE**
  - [**CARNET NOMBRE**](#usuario)
  - [**SERVICIO ACTIVIDAD 4**](#servicio-actividad-4)
  - [**HABILITAR SERVICIO**](#habilitar-servicio)
  - [**VERIFICAR LOGS**](#verificar-logs)

  
___
## **USUARIO**


201907156 - Marcos Arnoldo Itzep Ixmay


___
## **SERVICIO ACTIVIDAD 4**

Este servicio ejecuta un script que imprime un saludo y la fecha actual infinitamente con una pausa de un segundo.

### Instalación

1. Copiar el script `actividad4.sh` al directorio accesible en tu sistema: `/usr/local/bin`.

2. Crear un archivo de unidad de systemd con el nombre: `actividad4.service` en el directorio `/etc/systemd/system/` con el siguiente contenido:

```cmd
[Unit]
Description=Servicio Actividad 4, imprime un saludo y la fecha actual

[Service]
Type=simple
ExecStart=/usr/local/bin/actividad4.sh
Restart=always

[Install]
WantedBy=multi-user.target
```


4. Recarga las unidades de systemd:

```bash
sudo systemctl daemon-reload
```

___

## **HABILITAR SERVICIO**


1. Habilitar el servicio para que se inicie con el sistema:
``cmd
sudo systemctl enable actividad4.service
```

2. Iniciar servicio
```cmd
sudo systemctl start actividad4.service
```
___

## **VERIFICAR LOGS**
Se puede usar `journalctl` para ver los registros generados por el servicio:
```cmd
journalctl -u actividad4.service
```
Para ver los registros en tiempo real, se utiliza:
```cmd
journalctl -u actividad4.service -f
```