# Hotel Nearby — หาโรงแรมใกล้ๆ

Frontend-only MVP: ค้นหาโรงแรมใกล้ตำแหน่งคุณ แล้วกดเปิดลิงก์ไปจองได้เลย

**Live:** https://travel-assistant-hotel-mvp.pages.dev

**Playbook:** `docs/PLAYBOOK.md`

## Features

- 📍 รับพิกัด GPS จากเบราว์เซอร์ หรือใส่เอง
- 🏨 ค้นหาโรงแรมผ่าน 4 providers: Google Maps, Google Hotels, Booking.com, Agoda
- 📏 เลือกรัศมี 2 / 5 / 10 / 20 km
- 💾 จำพิกัดล่าสุดใน localStorage
- 📱 PWA — ติดตั้งบนหน้าจอมือถือได้, ใช้งาน offline ได้
- 🚀 ใช้งานได้ภายใน 3-4 คลิก

## How It Works

1. กด "ใช้พิกัดปัจจุบัน" → ยอมรับ GPS
2. เลือกรัศมีการค้นหา
3. กดเปิด provider ที่ต้องการ → เปิดหน้าค้นหาโรงแรม
4. จองบน provider โดยตรง

## Tech Stack

- Pure HTML + CSS + JavaScript (no framework)
- PWA with Service Worker (network-first caching)
- Cloudflare Pages deployment
- No backend, no API keys required

## Search Providers

| Provider | Description |
|----------|-------------|
| Google Maps | ค้นหาโรงแรมบนแผนที่ |
| Google Hotels | เปรียบเทียบราคาจาก Google |
| Booking.com | จองโรงแรมราคาดี |
| Agoda | ดีลพิเศษในเอเชีย |

## Development

```bash
# Serve locally
npx serve .

# Or just open index.html in browser
open index.html
```

## Deployment

Auto-deploy to Cloudflare Pages on push to `main` via GitHub Actions.

Requires GitHub secrets:
- `CF_ACCOUNT_ID`
- `CF_API_TOKEN`
