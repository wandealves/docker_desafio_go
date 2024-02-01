# Use a imagem oficial do Go como base
FROM golang:alpine AS builder

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /src/app

RUN go mod init github.com/wandealves/docker_desafio_go

# Copie o código fonte para o diretório de trabalho
COPY . .

# Compile o código Go
RUN go build -o main .

# Imagem final
FROM scratch

# Copie o executável compilado do estágio anterior
COPY --from=builder /src/app/main /app

# Execute o executável
CMD ["/app"]