-- Visión, misión, sede, horario y tabla de posiciones.
-- Ejecutar una sola vez en Supabase → SQL Editor (después de modulos.sql).

alter table equipo_info add column if not exists vision text;
alter table equipo_info add column if not exists mision text;
alter table equipo_info add column if not exists sede text;
alter table equipo_info add column if not exists horario text;

create table if not exists tabla_posiciones (
  id bigint generated always as identity primary key,
  torneo text not null default 'Torneo San Cristóbal',
  equipo text not null,
  pj int default 0,
  pg int default 0,
  pe int default 0,
  pp int default 0,
  gf int default 0,
  gc int default 0,
  pts int default 0,
  unique (torneo, equipo)
);

alter table tabla_posiciones enable row level security;

create policy "lectura tabla_posiciones" on tabla_posiciones for select using (true);
create policy "escritura tabla_posiciones" on tabla_posiciones for all to authenticated using (true) with check (true);
