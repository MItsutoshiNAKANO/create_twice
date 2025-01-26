# CREATE TABLE IF NOT EXISTS same_name(...) を2回繰り返すと42P07を返すのはなぜ?

ECPGを使っていて気になったことがあります。
`CREATE TEMPORARY TABLE IF NOT EXISTS same_name(dummy INTEGER)`と
同名のテーブルを2回以上`CREATE TABLE IF NOT EXISTS`すると、
2回目以降のCREATEで、sqlstateが42P07になります。

sqlcaは0で、sqlerrmcは
`relation "same_name" already exists, skipping`と
単なる警告であるのは解ります。
またsqlstateをいきなり見ず、
sqlcaを見るかWHENEVERを使えば回避できます。

しかし、以下を見ると、
sqlstateだけでエラー・非エラーを区別できるべきようにも思えます。

* <https://www.postgresql.org/docs/current/ecpg-errors.html#ECPG-SQLSTATE-SQLCODE>
* <https://www.postgresql.org/docs/16/ecpg-errors.html#ECPG-SQLSTATE-SQLCODE>
* <https://www.postgresql.jp/docs/16/ecpg-errors.html#ECPG-SQLSTATE-SQLCODE>

私がsqlstateに対して誤解しているのか、バグなのかどちらでしょうか?

RHEL 9のPostgreSQL 16.0上でこれに気づき、
WSLのUbuntu 24.04.1のPostgreSQL 16.6で以下のプログラムを書き、
再現させました。

<https://github.com/MItsutoshiNAKANO/create_twice>
