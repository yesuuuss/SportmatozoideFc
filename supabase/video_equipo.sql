-- Enlace de video del equipo (YouTube).
-- Ejecutar una sola vez en Supabase → SQL Editor.

alter table equipo_info add column if not exists video_url text;
