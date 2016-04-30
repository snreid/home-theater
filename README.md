# home-theater
To import all the things:
```sql
COPY home_theater_infos (dvd_title, studio, released, status, sound,
versions, price, rating, year, genre, aspect, upc, dvd_releasedate,
home_theater_info_id, timestamp) FROM
'/.../dvd_csv/dvd_csv copy.csv' DELIMITER ',' CSV
HEADER QUOTE '"';
```
