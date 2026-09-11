-- Estrutura inicial do Supabase para Açaí Moví.
create extension if not exists pgcrypto;

create table if not exists public.products (
 id uuid primary key default gen_random_uuid(),
 name text not null,
 price numeric(10,2) not null,
 required_complements integer not null default 4,
 active boolean not null default true,
 created_at timestamptz not null default now()
);

create table if not exists public.complements (
 id uuid primary key default gen_random_uuid(),
 name text not null unique,
 price numeric(10,2) not null default 0,
 active boolean not null default true,
 created_at timestamptz not null default now()
);

create table if not exists public.delivery_areas (
 id uuid primary key default gen_random_uuid(),
 name text not null unique,
 price numeric(10,2) not null,
 active boolean not null default true
);

create table if not exists public.orders (
 id uuid primary key default gen_random_uuid(),
 customer_name text not null,
 customer_phone text not null,
 delivery_type text not null check (delivery_type in ('delivery','pickup')),
 delivery_area text,
 address text,
 address_number text,
 address_complement text,
 payment_method text not null check (payment_method in ('pix','card','cash')),
 payment_status text not null default 'pending',
 status text not null default 'pending',
 subtotal numeric(10,2) not null default 0,
 delivery_fee numeric(10,2) not null default 0,
 total numeric(10,2) not null default 0,
 created_at timestamptz not null default now()
);

alter table public.products enable row level security;
alter table public.complements enable row level security;
alter table public.delivery_areas enable row level security;
alter table public.orders enable row level security;

create policy if not exists "public read active products" on public.products for select using (active = true);
create policy if not exists "public read active complements" on public.complements for select using (active = true);
create policy if not exists "public read active delivery areas" on public.delivery_areas for select using (active = true);

insert into public.products (name,price,required_complements) values
('Açaí 300 ml',18,4),('Açaí 400 ml',20,4),('Açaí 500 ml',22,4),('Marmita 1 kg',45,6)
on conflict do nothing;

insert into public.complements (name,price) values
('Banana',0),('Morango',3),('Kiwi',3),('Granola',0),('Amendoim',0),('Paçoca',0),('Leite em pó',0),('Confete',0),('Coco ralado',0),('Oreo (bolacha)',3),('Creme de avelã',3),('Leite condensado',0),('Bis',0)
on conflict (name) do nothing;
