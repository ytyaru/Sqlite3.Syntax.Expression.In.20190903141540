.echo on
-- **** スカラー値 ****
-- integer
select 3 in (1,3,5);
select 4 in (1,3,5);
select 0xA in (0xA, 0xB);
select 0xA in (0xC, 0xB);

-- real
select 3.14 in (3.14, 3.15, 3.16);
select 3.14 in (3.13, 3.15);
select 3.14 in (3.140);
select 3.14 in (3.1401);

-- text
select 'A' in ('A','B');
select 'A' in ('C','B');
select 'A' in ('A ',' A');
select 'A' in ('a');
select 'A' collate nocase in ('a');

-- blob
select x'FF' in (x'00', x'FF');
select x'FF' in (x'00', x'11');

-- NULL
select NULL in (0, 'NULL', x'00');
select 0 in (1, 'NULL', x'00');
select 0 in (0, 'NULL', x'00');
-- 右が空
select 1 in ();

-- **** 行値 ****
select (1,'A',x'FF') in (select 1,'A',x'FF' union select 2,'B',x'00');
select (1,'A',x'FF') in (select 0,'A',x'FF' union select 2,'B',x'00');
-- 列数が一致しないとエラー
select (1,'A',x'FF') in (select 1,'A',x'FF',1.2 union select 2,'B',x'00');

