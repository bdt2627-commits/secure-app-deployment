# Purani image ki jagah naya version use karein jo zyada secure ho
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Production stage mein minimal image use karein
FROM node:20-alpine
WORKDIR /app
# Root user avoid karna best security practice hai
RUN adduser -D appuser
USER appuser
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "index.js"]