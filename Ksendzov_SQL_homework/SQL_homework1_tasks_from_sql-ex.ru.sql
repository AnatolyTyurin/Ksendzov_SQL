SQL-ex.ru

--1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

SELECT model, speed, hd
FROM PC
WHERE price < 500

--2. Найдите производителей принтеров. Вывести: maker

SELECT DISTINCT(maker)
FROM product
WHERE type = 'Printer'

--3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
SELECT model, ram, screen
FROM laptop
WHERE price > 1000

--4. Найдите все записи таблицы Printer для цветных принтеров.

SELECT *
FROM printer
WHERE color = 'y'

--5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

SELECT DISTINCT(model), speed, hd
FROM PC
WHERE CD IN('12x','24x')
AND price < 600

--6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

SELECT Distinct(maker), speed
FROM product
JOIN laptop ON product.model = laptop.model
WHERE hd > = 10

--7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT(product.model), price
FROM product
JOIN PC ON pc.model = product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT(product.model), price
FROM product
JOIN Laptop ON laptop.model = product.model
WHERE maker = 'B'
UNION
SELECT DISTINCT(product.model), price
FROM product
JOIN Printer ON printer.model = product.model
WHERE maker = 'B'

--8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT maker
FROM product
WHERE type = 'pc'
EXCEPT
SELECT maker
FROM product
WHERE type = 'laptop'

--9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT(maker)
FROM product
JOIN PC ON pc.model = product.model
WHERE speed >= 450
AND type = 'PC'

-- 10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

SELECT model, price
FROM printer
WHERE price = (
SELECT MAX(price)
FROM printer)

-- 11. Найдите среднюю скорость ПК.

SELECT AVG(speed) AS AVG_speed
FROM pc

-- 12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

SELECT AVG(speed)
FROM laptop
WHERE price IN(SELECT price
FROM laptop
WHERE price > 1000)

-- 13. Найдите среднюю скорость ПК, выпущенных производителем A.

SELECT AVG(speed) as average_speed
FROM pc
JOIN product ON product.model = pc.model
WHERE maker IN (SELECT maker FROM product
WHERE maker = 'A')

-- 14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT ships.class, ships.name, classes.country
FROM ships
LEFT JOIN classes ON classes.class = ships.class
WHERE NUMGUNS >=10

-- 15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

SELECT hd
FROM pc
GROUP BY hd
HAVING count(hd) >1

-- 16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

SELECT DISTINCT p1.model, p2.model, p1.speed, p1.ram
FROM pc p1, pc p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model

