-- =========================================================
-- E.T. Radiator — Supabase Schema
-- Run this in: Supabase Dashboard → SQL Editor → New Query
-- =========================================================

-- 1. BOOKINGS TABLE
create table if not exists bookings (
  id             uuid primary key default gen_random_uuid(),
  created_at     timestamptz default now(),

  -- Customer
  first_name     text not null,
  last_name      text not null,
  phone          text not null,
  email          text,

  -- Vehicle
  vehicle_make   text,
  vehicle_model  text,
  vehicle_year   text,
  vehicle_rego   text,

  -- Booking
  service        text not null,
  preferred_date date,
  preferred_time text,
  message        text,

  -- Admin
  status         text default 'pending'
                   check (status in ('pending','confirmed','completed','cancelled')),
  notes          text
);

-- =========================================================
-- 2. ROW LEVEL SECURITY
-- =========================================================
alter table bookings enable row level security;

-- Anyone (public) can INSERT a booking (from the booking form)
create policy "public_insert_bookings"
  on bookings for insert
  to anon
  with check (true);

-- Only authenticated users (you, the admin) can SELECT
create policy "auth_select_bookings"
  on bookings for select
  to authenticated
  using (true);

-- Only authenticated users can UPDATE (confirming/cancelling)
create policy "auth_update_bookings"
  on bookings for update
  to authenticated
  using (true);

-- Only authenticated users can DELETE (if ever needed)
create policy "auth_delete_bookings"
  on bookings for delete
  to authenticated
  using (true);

-- =========================================================
-- 3. DONE
-- After running this SQL:
--   a) Go to Supabase → Authentication → Users → Add User
--   b) Enter your email (cheng.thach@gmail.com) and a strong password
--   c) This creates your admin login
--   d) Copy your Project URL and anon key from:
--      Supabase → Settings → API
--   e) Paste them into all three places marked YOUR_SUPABASE_URL
--      in: booking.html, admin/index.html, admin/dashboard.html
-- =========================================================
