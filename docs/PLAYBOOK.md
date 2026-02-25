# Playbook: Hotel Nearby (Frontend-only MVP)

เอกสารนี้สรุป “โครง + แนวทางต่อยอด” สำหรับโปรเจกต์ `travel-assistant-hotel-mvp` เพื่อให้คนอื่นเข้ามาอ่านแล้วทำงานต่อได้เร็ว

## เป้าหมาย

- ผู้ใช้แชร์พิกัด (GPS) แล้วกดลิงก์ไปค้นหา/จองโรงแรมบน provider ได้ทันที
- เน้น “ค้นหา + เลือก + deep link” ก่อน ไม่ทำ payment/กรอกข้อมูลผู้เข้าพักในระบบเรา

## หลักการสำคัญ

- Frontend-only (Static/PWA) ไม่มี backend
- ไม่ใช้ API key ฝั่ง client (ลดความเสี่ยงคีย์รั่ว + ไม่ต้องทำ proxy)
- เก็บข้อมูลน้อยที่สุด: เก็บเฉพาะพิกัดล่าสุด/รัศมีใน `localStorage` และให้ผู้ใช้ reset ได้
- แสดงข้อความขอความยินยอมก่อนเรียก GPS

## Flow (Minimum)

1) Landing: ผู้ใช้กด “ใช้พิกัดปัจจุบัน” (Geolocation) หรือกรอกพิกัดเอง
2) เลือกรัศมี (เช่น 2 / 5 / 10 / 20 km)
3) แสดงปุ่ม provider ให้เลือก แล้วเปิดหน้าค้นหาโรงแรมด้วย query ที่มีพิกัด
4) ผู้ใช้ทำการจองบน provider โดยตรง

## Providers (ตัวอย่าง)

- Google Maps: เปิดค้นหาโรงแรมใกล้พิกัด
- Google Hotels: เปิดหน้าเปรียบเทียบราคาใกล้พิกัด
- Booking.com / Agoda: เปิดหน้าค้นหา (แนบพิกัด/คำค้น)

หมายเหตุ: แต่ละ provider มีรูปแบบ URL ไม่เหมือนกัน และอาจเปลี่ยนได้ ควรเขียนให้แก้ไขง่าย/มี fallback

## Pages/โครง UI ที่แนะนำ

- `/` Landing: อธิบายสั้นๆ + ปุ่มรับพิกัด + input กรอก lat/lng
- (optional) `/results`: ถ้าจะทำลิสต์/แผนที่เพิ่มในอนาคต
- (optional) `/settings`: radius, language, open-in preference

## Data Handling

- `localStorage`: `lastLocation`, `radiusKm` (ไม่ต้องเก็บข้อมูลส่วนบุคคลอื่น)
- TTL แบบ “นุ่มๆ”: มีปุ่ม reset/clear และอธิบายให้ผู้ใช้เข้าใจ

## Done Criteria (MVP)

- เปิดบนมือถือได้ดี
- ขอ GPS ได้ (มี consent copy ชัดเจน)
- กดแล้วเปิดลิงก์ provider ได้จริง
- ใช้งานได้ภายใน 3-4 คลิก

## Deployment

- Deploy แบบ static ไป Cloudflare Pages (GitHub Actions)
- ถ้าจะเอาไปใช้ใน LINE: นำ URL ไปผูกเป็น LIFF ใน LINE Developers Console
