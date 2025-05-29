
FROM node:22-alpine AS builder

WORKDIR /app

COPY package.json ./
RUN npm install --omit=dev


COPY server.js ./


FROM node:22-alpine


RUN addgroup -S appgroup && adduser -S appuser -G appgroup


WORKDIR /app


COPY --from=builder /app /app


RUN chown -R appuser:appgroup /app


USER appuser


ENV PORT=4000
EXPOSE 4000

# Start the app
CMD ["node", "server.js"]
