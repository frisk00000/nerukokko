-- Supabase SQL Editorで実行する。
-- integrator.py._build_record()が送るレコード形状 {timestamp, chicken, egg} に対応。

create table if not exists public.sleep_records (
    id bigint generated always as identity primary key,
    timestamp timestamptz not null,
    chicken jsonb not null,
    egg jsonb not null,
    created_at timestamptz not null default now()
);

create index if not exists sleep_records_timestamp_idx
    on public.sleep_records (timestamp);

-- service_role キー(SUPABASE_KEY)経由での挿入を想定しRLSは無効のまま。
-- anon キーを使う場合はRLSを有効化しinsert用ポリシーを追加すること。
