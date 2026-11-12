-- Módulos: anuario (fotos y descripción), información del equipo y merch.
-- Ejecutar una sola vez en Supabase → SQL Editor.

-- Campos nuevos para jugadores
alter table players add column if not exists descripcion text;
alter table players add column if not exists foto_url text;

-- Información del equipo (una sola fila)
create table if not exists equipo_info (
  id int primary key default 1 check (id = 1),
  nombre text,
  fundacion text,
  texto text
);
insert into equipo_info (id, nombre, texto)
values (1, 'Sportmatozoide FC', '')
on conflict (id) do nothing;

-- Productos de merch (la compra en línea se agregará después)
create table if not exists merch (
  id bigint generated always as identity primary key,
  nombre text not null,
  descripcion text,
  precio numeric,
  imagen_url text,
  activo boolean default true
);

alter table equipo_info enable row level security;
alter table merch enable row level security;

create policy "lectura equipo_info" on equipo_info for select using (true);
create policy "escritura equipo_info" on equipo_info for all to authenticated using (true) with check (true);

create policy "lectura merch" on merch for select using (true);
create policy "escritura merch" on merch for all to authenticated using (true) with check (true);

-- Bucket público para fotos de jugadores y productos
insert into storage.buckets (id, name, public)
values ('fotos', 'fotos', true)
on conflict (id) do nothing;

create policy "lectura fotos" on storage.objects for select using (bucket_id = 'fotos');
create policy "subir fotos" on storage.objects for insert to authenticated with check (bucket_id = 'fotos');
create policy "actualizar fotos" on storage.objects for update to authenticated using (bucket_id = 'fotos');
