# Açaí Moví

Loja de delivery construída com React + Vite + Supabase.

## Rodar localmente

```bash
npm install
npm run dev
```

## Supabase

1. Crie um projeto no Supabase.
2. Abra o SQL Editor.
3. Execute `supabase/schema.sql`.
4. Copie `.env.example` para `.env.local`.
5. Preencha:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_PUBLISHABLE_KEY`
6. Rode novamente `npm run dev`.

## GitHub

```bash
git init
git add .
git commit -m "estrutura inicial Açaí Moví"
git branch -M main
git remote add origin SEU_REPOSITORIO
git push -u origin main
```

## Pagamento

O frontend já permite escolher Pix, cartão e dinheiro, mas **não considera Pix/cartão como pagos**. A integração real deve ser feita com um gateway e confirmação server-side/webhook antes de colocar em produção.

## Observação

Os dados dos produtos e complementos estão inicialmente no frontend para o site funcionar imediatamente. O SQL também cria as tabelas do Supabase para a próxima etapa de migração do catálogo para o banco.
