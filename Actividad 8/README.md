# **Actividad 8**
#### **Sistemas Operativos 1**
___

## **INDICE**
  - [**CARNET - NOMBRE**](#usuario)

  
___
# **USUARIO**

201907156 - Marcos Arnoldo Itzep Ixmay
# Instalacion en un ambiente local de Kubernetes utlizando minikube.
```sh
## descargar anteriormente en el sitio oficial minikube para el sistema operativo requerido
# iniciar minikube
minikube start
#verificación de instalación
kubectl get nodes
```

# Despliegue de un contenedor.
## 1. Crear un archivo de despliegue en Kubernete con extension .yaml
```sh
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-prueba
spec:
  replicas: 1
  selector:
    matchLabels:
      app: maritzep
  template:
    metadata:
      labels:
        app: maritzep
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
```

## 2. Comando para desplegar el contenedor
```
kubectl apply -f nginx-deployment.yaml
```
## 3. Comando para verificar el despliegue
```
kubectl get pods
```
## 4. Para acceder al servicio por navegador en el puerto 80
```
kubectl expose deployment nginx-deployment --type=NodePort --port=80
minikube service nginx-deployment
```


# ¿En un ambiente local de Kubernetes existen los nodos masters y workers, como es que esto funciona?

>En un entorno local de Kubernetes como Minikube, Kind o Docker Desktop, técnicamente el clúster mantiene un nodo principal y nodos de trabajo, aunque en estas situaciones ambos roles suelen fusionarse en un único nodo para facilitar la arquitectura. El nodo "principal" gestiona la gestión plana, que abarca la API, el planificador y el controlador. Los trabajadores operan los contenedores. En entornos locales, generalmente un único nodo desempeña ambas funciones.


