# ============================
# MODE: DEVELOPMENT
# ============================
# Untuk mode development, cukup pakai 1 stage saja.
# Aktifkan bagian ini dengan cara uncomment (hapus tanda #)
# supaya ada hot reload dsb.

# FROM node:24-alpine AS dev
# WORKDIR /app
# COPY ./app/package*.json ./
# RUN npm install
# COPY ./app .
# EXPOSE 3000
# CMD ["npm", "run", "dev"]

# ============================
# MODE: PRODUCTION
# ============================
# Untuk mode production, gunakan multi-stage build di bawah 
# supaya image lebih kecil & lebih cepat.

FROM node:24-alpine AS builder
WORKDIR /app
COPY ./app/package*.json ./
RUN npm ci --include=dev
COPY ./app .
RUN npm run build && rm -rf .next/cache

FROM node:24-alpine AS runner
WORKDIR /app

# Hanya copy files yang diperlukan untuk runtime
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package*.json ./

# Install deps tanpa devDependencies
RUN npm ci --omit=dev

EXPOSE 3000
CMD ["npm", "start", "--", "-p", "3000", "-H", "0.0.0.0"]
