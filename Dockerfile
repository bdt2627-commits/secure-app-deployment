# Stage 1: Build stage
FROM node:18-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Production stage (Minimal Image)
FROM node:18-alpine
WORKDIR /app
# Root user avoid karne ke liye (Security Practice)
RUN adduser -D appuser
USER appuser
COPY --from=build /app .
EXPOSE 3000
CMD ["node", "index.js"]