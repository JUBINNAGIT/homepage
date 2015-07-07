<h1>주빛나 홈페이지 입니다.<h1>

### database backup & restore

- backup  
```shellscript
$ mysqldump -u [User ID] -p [DB name] --databases > dump.sql
```

- restore  
```shellscript
$ mysql -u [User ID] -p [DB name] < dumb.sql
```