
$databaseUrlSecure = Read-Host "Informe a DATABASE_URL" -AsSecureString
$masterKeySecure = Read-Host "Informe a MASTER_KEY" -AsSecureString

$databaseUrl = [System.Net.NetworkCredential]::new("", $databaseUrlSecure).Password
$masterKey = [System.Net.NetworkCredential]::new("", $masterKeySecure).Password

$secret = @{
    apiVersion = "v1"
    kind = "Secret"
    metadata = @{
        name = "auth-service-secret"
        namespace = "microservices"
    }
    type = "Opaque"
    stringData = @{
        DATABASE_URL = $databaseUrl
        MASTER_KEY = $masterKey
    }
} | ConvertTo-Json -Depth 10

$secret | kubectl apply -f -
