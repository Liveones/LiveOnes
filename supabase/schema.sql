create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  name text,
  rank text default 'ROOKIE',
  created_at timestamptz default now()
);

create table if not exists trades (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  symbol text,
  side text,
  pnl numeric default 0,
  result text,
  risk numeric,
  rr numeric,
  setup text,
  notes text,
  traded_at timestamptz default now(),
  created_at timestamptz default now()
);

alter table profiles enable row level security;
alter table trades enable row level security;

create policy "Users can read own profile" on profiles for select using (auth.uid() = id);
create policy "Users can insert own profile" on profiles for insert with check (auth.uid() = id);
create policy "Users can update own profile" on profiles for update using (auth.uid() = id);

create policy "Users can read own trades" on trades for select using (auth.uid() = user_id);
create policy "Users can insert own trades" on trades for insert with check (auth.uid() = user_id);
create policy "Users can update own trades" on trades for update using (auth.uid() = user_id);
create policy "Users can delete own trades" on trades for delete using (auth.uid() = user_id);