FROM node:18

WORKDIR /app

# Zorg dat alleen package.json wordt gekopieerd voor caching
COPY package*.json ./

# Installeer afhankelijkheden en forceer native build (sqlite3!)
RUN npm install --build-from-source

# Nu pas de rest van de app kopiëren
COPY . .

EXPOSE 8085

CMD ["node", "index.js"]
