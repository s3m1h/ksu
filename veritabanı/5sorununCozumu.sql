create database ornek;
use ornek;


create table notlar(

ogr_no int,
ders_kodu varchar(10),
primary key (ogr_no,ders_kodu),
vize int not null,
final int not null,

constraint fk_ogr_no foreign key(ogr_no) references ogrenciler(ogr_no),
constraint fk_ders_kodu foreign key(ders_kodu) references dersler(ders_kodu)

);
create table dersler(
ders_kodu varchar(2) primary key ,
adi varchar(50) not null
);
create table ogrenciler(
ogr_no int primary key auto_increment,
adi varchar(50),
bolum_id int not null,
constraint fk_bolumid foreign key(bolum_id) references bolumler(bolum_id)
);
create table bolumler(
bolum_id int primary key auto_increment,
adi varchar(50) not null
);

insert into ornek.ogrenciler values (1,'ali er',2),(2,'ayse er',1),(3,'fatma er',1);
insert into ornek.dersler values ('B1','VTYS'),('B2','programlama'),('B3','otomata'),('E3','elektrik devreleri');
insert into ornek.notlar values (1,'B1',70,65),(1,'B2',50,65),(1,'B3',90,85);
insert into ornek.notlar values (2,'B1',50,65),(2,'E3',60,65),(2,'B3',70,85);
insert into ornek.notlar values (3,'B1',50,0),(3,'E3',60,65),(3,'B2',70,85);

-- 1. soru
SELECT ogr_no, max(vize) as enyuksekvize
from ornek.notlar
where vize > 70
group by ogr_no;

-- 2.soru
select adi,count(*) as ogrenci_sayisi
from ornek.dersler d
join ornek.notlar n
using (ders_kodu)
group by d.ders_kodu;

-- 3. soru
select adi from ogrenciler o
join notlar n 
using (ogr_no)
where exists(select ders_kodu from ornek.ogrenciler where ders_kodu = 'E3');


-- 4.soru
select  * from ornek.notlar where ogr_no in
(select ogr_no from ornek.ogrenciler o
join bolumler b
using (bolum_id)
where b.adi = 'bilgisayar');

-- 5.soru
select ogr_no,bolum_id, dateiff(year,"2022-06-07",kayit_tarihi) as kayit_tarihi from ornek.ogrenciler;


select * from ornek.ogrenciler;