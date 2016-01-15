

drop table poloniex_ticks ;
create table poloniex_ticks (
  id serial primary key,
  last decimal,
  lowest_ask  decimal,
  highest_bid  decimal,
  percent_change  decimal,
  base_volume  decimal,
  quote_volume  decimal,
  is_frozen  decimal,
  high24hr  decimal,
  low24hr  decimal,
  created_at timestamp,
  updated_at timestamp
);
-- select * from poloniex_ticks where created_at = (select max(created_at) from poloniex_ticks);

drop table poloniex_btcltc_ticks ;
create table poloniex_btcltc_ticks (
  id serial primary key,
  last decimal,
  lowest_ask  decimal,
  highest_bid  decimal,
  percent_change  decimal,
  base_volume  decimal,
  quote_volume  decimal,
  is_frozen  decimal,
  high24hr  decimal,
  low24hr  decimal,
  created_at timestamp,
  updated_at timestamp
);
-- select * from poloniex_btcltc_ticks where created_at = (select max(created_at) from poloniex_btcltc_ticks);


drop table bitstamp_ticks ;
create table bitstamp_ticks (
  id serial primary key,
  high decimal,
  last decimal,
  ts timestamp,
  bid decimal,
  vwap decimal,
  volume decimal,
  low decimal,
  ask decimal,
  open decimal,
  created_at timestamp,
  updated_at timestamp
);
-- select * from bitstamp_ticks where ts = (select max(ts) from bitstamp_ticks);





