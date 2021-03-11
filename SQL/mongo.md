# MONGO



### 실행 - cmd창

`mongod --dbpath C:\mongo\data\db`



### Robo3T

create database

create collections

insert document

view document



### 문법(mongo ==> rdms)



##### 검색) `db.user.find({condition},{column}).limit(5)`

`db.user.find()` ==> `select * from user`

`db.user.find({},{user_id : 1, _id : 0})` ==> `select user_id , _id(invisible) from user`

`db.user.find({gender : 'm'},{})` => `select * from where gender = 'm'`



