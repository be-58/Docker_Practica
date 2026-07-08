# Dockerfile
FROM node:22

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Actualizar npm a la última versión (corrige bug "Exit handler never called")
RUN npm install -g npm@latest

# Copiar archivos al contenedor
COPY package*.json ./
COPY index.js .

# Instalar dependencias
RUN npm install --no-audit --no-fund

# Copiar el resto de los archivos
COPY users.json .       

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]