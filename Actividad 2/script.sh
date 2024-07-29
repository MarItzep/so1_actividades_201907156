# Definir la variable GITHUB_USER
$GITHUB_USER = "nombre_de_usuario"

# Verificar si GITHUB_USER está definida
if (-not $GITHUB_USER) {
    Write-Output "La variable GITHUB_USER no está definida."
    exit
}

# Consultar la URL de la API de GitHub
$API_URL = "https://api.github.com/users/$GITHUB_USER"
$USER_DATA = Invoke-RestMethod -Uri $API_URL

# Extraer datos del JSON
$USER_ID = $USER_DATA.id
$CREATED_AT = $USER_DATA.created_at

# Verificar si se obtuvieron datos válidos
if (-not $USER_ID -or -not $CREATED_AT) {
    Write-Output "No se pudo obtener información del usuario $GITHUB_USER."
    exit
}

# Imprimir el mensaje
$mensaje = "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
Write-Output $mensaje

# Crear un log file en /temp/<fecha>/saludos.log
$FECHA = Get-Date -Format "yyyy-MM-dd"
$LOG_DIR = "C:\temp\$FECHA"
if (-not (Test-Path -Path $LOG_DIR)) {
    New-Item -ItemType Directory -Path $LOG_DIR
}
$LOG_FILE = "$LOG_DIR\saludos.log"
$mensaje | Out-File -FilePath $LOG_FILE -Append
