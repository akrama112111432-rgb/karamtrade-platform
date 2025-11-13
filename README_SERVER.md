Karem Pro - Server README

1. Copy .env.example to .env and fill keys (STRIPE, OPENAI, ADMIN_SECRET)
2. npm install
3. node migrate.js
4. npm start

Endpoints:
  GET / -> health
  POST /register {name,email}
  POST /create-checkout-session {user_id,plan}
  POST /webhook/stripe
  POST /api/ai/chat (headers x-user-id, x-subscriber)
  POST /api/human/chat (headers x-user-id, x-subscriber)
