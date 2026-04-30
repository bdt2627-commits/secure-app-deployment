
FROM node:20-slim AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .


FROM gcr.io/distroless/nodejs20-debian12
WORKDIR /app
COPY --from=build /app .
EXPOSE 3000
CMD ["index.js"]