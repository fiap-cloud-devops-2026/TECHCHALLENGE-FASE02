#Usando uma imagem maior para compilar a aplicação, que já vem com o Go instalado.
FROM golang:1.21 AS builder

WORKDIR /app

#Copia o arquivo de dependências do Go para dentro da imagem e faz o download das dependências
COPY go.mod ./
RUN go mod download

#Nessa etapa, copiamos o código fonte da aplicação para dentro da imagem.
COPY *.go ./

RUN go mod tidy

#Compilando o binário
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping

#Usando uma imagem mais leve para rodar a aplicação, diminuindo o tamanho da imagem final
FROM alpine:latest

WORKDIR /app

#copiando o binário compilado da imagem builder para a imagem final
COPY --from=builder /docker-gs-ping /docker-gs-ping

#Comando para rodar a aplicação
CMD ["/docker-gs-ping"]