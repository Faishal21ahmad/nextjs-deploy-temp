# Deploy Next.js dengan Docker

## Struktur Direktori
``` sh
/container-apps
  ├─ /app                 # Project Next.js
  ├─ Dockerfile           # Dockerfile (Dev & Prod)
  └─ docker-compose.yml   # Docker Compose config
```

---
## Instalasi Project Baru
``` sh
npx create-next-app@15 ./app 
```

---
## Menjalankan Development
``` sh
cd app
npm run dev
```

---
## Set Mode
### Mode Development (Hot Reload)
Digunakan saat coding. Container akan auto-reload setiap kali file berubah.  
Edit file sesuai petunjuk pada:
- `Dockerfile` → aktifkan bagian **development**
- `docker-compose.yml` → aktifkan bagian `volumes`
### Mode Production (Optimized Image)
Digunakan untuk deploy ke server. Image lebih kecil & cepat karena **multi-stage build**.  
Edit file sesuai petunjuk pada:
- `Dockerfile` → aktifkan bagian **production**
- `docker-compose.yml` → set `NODE_ENV=production`

---
## Jalankan Aplikasi
### Build & Run
``` sh
docker compose up -d --build
```

-----
## Menghentikan Aplikasi 
### Stop & Hapus Container
``` sh
docker compose down -v
```

---
## Akses Aplikasi
Buka browser: [http://localhost:3003](http://localhost:3003)