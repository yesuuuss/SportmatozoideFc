# Sportmatozoide FC - Comparador de jugadores

Página estática (HTML + JavaScript) para comparar jugadores por temporada. Los datos viven en Supabase; el sitio se publica en Netlify.

## Configuración de Supabase

1. Crea un proyecto en supabase.com.
2. En *SQL Editor*, ejecuta el bloque de tablas y políticas RLS (`players`, `season_stats`).
3. En *Authentication → Providers → Email*, desactiva "Allow new users to sign up".
4. En *Authentication → Users*, crea las cuentas de quienes pueden editar.

## Cambiar la conexión

En `index.html`, dentro de `supabase.createClient(...)`, están la URL del proyecto y la publishable key. La publishable key puede ser pública porque las políticas RLS controlan las escrituras. **Nunca** pongas la clave `secret` en este archivo.

## Publicar en Netlify

1. En Netlify: *Add new site → Import an existing project → GitHub*.
2. Selecciona el repositorio `SportmatozoideFc`.
3. Deja vacío el comando de build y la carpeta de publicación en la raíz (`/`).
4. Cada cambio en `main` se publica automáticamente.

## Uso

- **Cualquiera** puede ver el comparador, elegir temporada y dos jugadores.
- **Editores** inician sesión para agregar jugadores y guardar estadísticas. Si se guarda una temporada que ya existe para ese jugador, se actualiza.
