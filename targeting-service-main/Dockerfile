# Usar a imagem oficial e leve do Python
FROM python:3.9-slim

# Definir o diretório de trabalho dentro do contentor
WORKDIR /app

# Copiar apenas o ficheiro de dependências primeiro (para otimizar a cache do Docker)
COPY requirements.txt .

# Instalar as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o resto do código da aplicação
COPY . .

# Expor a porta padrão configurada na aplicação
EXPOSE 8003

# Comando para arrancar a aplicação
CMD ["python", "app.py"]