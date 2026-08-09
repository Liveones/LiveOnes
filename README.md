# LiveOnes 2.0

A static-export Next.js trading journal frontend with Supabase-ready authentication and data storage.

## Run locally
npm install
npm run dev

## Static build
npm run build

The static site is generated in `out/`.

## Supabase
Create these environment variables when connecting the frontend to Supabase:

- NEXT_PUBLIC_SUPABASE_URL
- NEXT_PUBLIC_SUPABASE_ANON_KEY

The app also has a local demo mode so the UI can be tested before Supabase is connected.

## Included
Home, Add Trade, P&L, Performance, Process, Calendar, History, Strategy, Community, Messages, Profile, Settings, Login and Signup.
