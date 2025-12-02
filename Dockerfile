FROM node:20-alpine
# Establece el directorio de trabajo
WORKDIR /app
# Copia archivos de dependencias para aprovechar caching
COPY package.json yarn.lock ./
# Instala dependencias (producción)
RUN yarn install --production --frozen-lockfile || npm ci --only=production
# Copia el resto del código
COPY . .
# Puerto que expone la app (Render provee PORT vía env)
ENV PORT 10000
EXPOSE 10000
# Comando por defecto para arrancar la app
CMD ["node", "app.js"]