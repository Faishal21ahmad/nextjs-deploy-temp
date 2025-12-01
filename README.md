# Deploy Next.js dengan Docker

## Struktur Direktori
``` sh
/container-apps
  ├─ /app                 # Project Next.js
  ├─ .dockerignore        # Pengecualian file file
  ├─ Dockerfile           # Dockerfile (Dev & Prod)
  └─ docker-compose.yml   # Docker Compose config
```

---
## Instalasi Project Baru
``` sh
npx create-next-app@lastest ./app 
```

---
## Menjalankan Project Baru
``` sh
cd app
npm run dev
```

## Tambahkan list Config 
Buka file `next.config.ts` tambahkan code di bawah:
``` ts
output: "standalone",
``` 
lebih lengkap:
``` ts
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone",
};

export default nextConfig;
```


---
## Jalankan Container/Aplikasi
### Build & Run
``` sh
docker compose up -d --build
```

-----
## Menghentikan Container/Aplikasi 
### Stop & Hapus Container
``` sh
docker compose down -v
```

---
## Akses Container/Aplikasi
Buka browser: [http://localhost:3000](http://localhost:3000)