# Gestión de Usuarios

## Parte 1: Gestión de Usuarios

### 1. Creación de Usuarios
Para crear tres usuarios, se usan los siguientes comandos:

sudo useradd usuario1
sudo useradd usuario2
sudo useradd usuario3

### 2. Asignando contraseñas 

Se usa el siguiente comando 
echo 'usuario1:passd1' | sudo chpasswd
echo 'usuario2:passd2' | sudo chpasswd
echo 'usuario3:passd3' | sudo chpasswd

### 3.  Información de usuarios 
Se usa el siguiente comando:

id usuario 1

- Resultado 
uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1)

### 4. Eliminación de Usuarios
Se usa el siguiente comando conservando su directorio actual :

sudo userdel --retain-home usuario3
Eliminando usuario sin directorio 
sudo userdel -r -f -Z usuario3

## Parte 2: Gestión de Grupos
### 1. Creación de Grupos
Con el siguiente comando se crean los dos grupos :

sudo groupadd grupo1
sudo groupadd grupo2

### 2. Agregar usuarios a grupos 
Agregando usuarios a grupos con el siguiente comando :

sudo usermod -aG grupo1 usuario1
sudo usermod -aG grupo2 usuario2

### 3. Verificando membresía
Con el siguiente comando se verifica:
groups usuario1
groups usuario2
- Resultado :
usuario1 : usuario1 grupo1
usuario2 : usuario2 grupo2

### 4. Elimando grupo
Con el siguiente comando se elimina el grupo 2:
sudo groupdel grupo2

## Parte 3: Gestión de Permisos

### 1. Creación de Archivos y Directorios
- Se crea el archivo de usuario 1:
sudo su - usuario1
echo "contenido escrito usuario 1" > archivo1.txt

- Se crea el directorio 
mkdir directorio1
- se crea el archivo en el directorio 1
echo "contenido del archivo número 2" > directorio1/archivo2.txt

### 2. Verificar permisos 
Se verifica con el siguiente comando :
ls -l /home/marcos/usuario1/archivo1.txt
ls -ld /home/marcos/directorio1
-Resultado 
-rw-r--r-- 1 usuario1 usuario1 20 Aug  4 10:00 /home/usuario1/archivo1.txt

drwxr-xr-x 2 usuario1 usuario1 4096 Aug  4 10:00 /home/marcos/directorio1

### 3. Modificar Permisos usando chmod con Modo Numérico
Se modifica con el siguiente comando :

chmod 640 /home/marcos/archivo1.txt
ls -l /home/marcos/archivo1.txt

-Resultado 
-rw-r----- 1 usuario1 usuario1 20 Aug  4 10:04 /home/marcos/archivo1.txt

### 4. Modificar Permisos usando chmod con Modo Simbólico
Con los  siguientes comandos :
chmod u+x /home/marcos/directorio1/archivo2.txt
ls -l /home/marcos/directorio1/archivo2.txt

-Resultado 
-rwxr-xr-x 1 usuario1 usuario1 20 Aug  4 10:12 /home/marcos/directorio1/archivo2.txt

### 5. Cambiar el Grupo Propietario
Con los siguientes comandos :

sudo chgrp grupo1 /home/marcos/directorio1/archivo2.txt

ls -l /home/marcos/directorio1/archivo2.txt

-Resultado 
-rwxr-xr-x 1 usuario1 grupo1 20 Aug  4 10:20 /home/marcos/directorio1/archivo2.txt

### 6. Configurar Permisos de Directorio

chmod 740 /home/marcos/directorio1

ls -ld /home/marcos/directorio1

-Resultado 
drwxr----- 2 usuario1 usuario1 4096 Aug  4 10:30 /home/marcos/directorio1

### 7. Comprobación de Acceso

Usando el siguiente comando:
sudo su - usuario2
cat /home/marcos/archivo1.txt
cat /home/marcos/directorio1/archivo2.txt
-Resultado 
Se muestra el contenido del archivo 1
# contenido escrito usuario 1
cat: /home/marcos/directorio1/archivo2.txt: Permission denied


### 8. Verificación Final
 Con el siguiente comando se verifica:
ls -l /home/marcos/archivo1.txt
ls -l /home/marcos/directorio1/archivo2.txt

- Resultado 
-rw-r----- 1 usuario1 usuario1 20 Aug  4 10:45 /home/marcos/archivo1.txt
drwxr----- 2 usuario1 usuario1 4096 Aug  4 10:45 /home/marcos/directorio1




# Reflexión: (Opcional)
Contestar las siguientes preguntas:

## ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
Es importante conocer para manipular permisos en archivos directorios,  el uso de grupos y usuarios, la forma de ir conociendo y manipulando el sistema operativo para conocer mejor Ubuntu que es en este caso.

## ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?
No había usado Ubuntu del todo pero solo conocía el comando 
ls para los directorios 
De ahí no conozco aparte de los que aprendí a utilizar en este documento.
