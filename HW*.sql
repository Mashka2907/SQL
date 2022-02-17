--Компьютерная фирма
--------------------
--Схема БД состоит из четырех таблиц:
--"Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот 
--или 'Printer' - принтер). Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. 
--В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model 
--(внешний ключ к таблице Product), скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), 
--размер диска - hd (в гигабайтах), скорость считывающего устройства - cd (например, '4x') и цена - price. 
--Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах). 
--В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), 
--тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price."

--Запросы
--1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
select model, speed, hd from PC where price < 500;
--2. Найдите производителей принтеров.
select maker  from  product where product.type = 'printer' group by maker;
--3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
select model, ram, screen from laptop where price > 1000;
--4. Найдите все записи таблицы Printer для цветных принтеров.
select * from printer where color = 'y';
--5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
select model, speed, hd from pc where (cd = '12x' or cd = '24x') and price<600;
--6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. "
select distinctT product.maker, laptop.speed from product inner join laptop on product.model=laptop.model and laptop.hd>=10;
--7. Найдите производителей ПК с процессором не менее 450 Мгц.
select distinct maker from product inner join pc on product.model = pc.model and pc.speed >= 450;
--8. Найдите среднюю скорость ПК.
select avg (speed) from pc;
--9. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
select avg (speed) from laptop where price > 1000;
--10. Найдите среднюю скорость ПК, выпущенных производителем A.
Select avg(speed) from pc inner join product on pc.model= product.model where maker = 'A' group by maker;
--11. Найдите размеры жестких дисков, совпадающих у двух и более PC.
select hd  from pc group by hd having count(model)>1;
--12. Найдите модели принтеров, имеющих самую высокую цену.
select distinct model, price from printer where price = (select max(price) from printer);
--13. Найти цену ПК в диапозоне от 600 до 850 дол.
select price from pc where price between 600 and 850;
--14. Найти все принтеры, если в названии типа принтера вторая 'a'.
select * from printer where type like '_a%';
--15. Найти модели ПК-блокнотов, если их цена 700 и 850 дол.
select model, price from laptop where price in (700, 950);
