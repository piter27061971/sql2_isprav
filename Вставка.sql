insert into musik_ispolnitel(name_isp)
values
('Иванов Иван'),
('Рубашкин Иван'),
('Токарев Василий'),
('Шишкин Николай'),
('Коровин Николай');

insert into musik_ispolnitel(name_isp)
values
('Немо'),
('Буратино');



INSERT INTO musik_ganr(ganr) 
values
('Классика'),
('Джаз'),
('Шансон'),
('Бардовая музыка'),
('Народное пение');

insert into musik_albom(name_albom, god_vipuska)
values
('Нежный сентябрь','2017-12-01'),
('Злобный октябрь', '2019-03-01'),
('Хитрый июль', '2022-02-04'),
('Сердитый сентябрь', '2018-01-17'),
('Маэстро', '2020-09-07'),
('Золушка', '2017-03-07');

insert into musik_trek(name_trek,dlitelnost, id_albom)
values
('Нежность',120, (select id from musik_albom where(name_albom='Нежный сентябрь')) );

insert into musik_trek(name_trek,dlitelnost, id_albom)
values
('Любовь',300, (select id from musik_albom where(name_albom='Хитрый июль')) );

insert into musik_trek(name_trek,dlitelnost, id_albom)
values
('Ностальгия',350, (select id from musik_albom where(name_albom='Нежный сентябрь')) ),
('Победа',400, (select id from musik_albom where(name_albom='Золушка')) ),
('Измена',300, (select id from musik_albom where(name_albom='Маэстро')) ),
('Бросок',120, (select id from musik_albom where(name_albom='Сердитый сентябрь')) ),
('Тюльпан',150, (select id from musik_albom where(name_albom='Хитрый июль') ));

insert into musik_trek(name_trek,dlitelnost, id_albom)
values
('Мой выбор',350, (select id from musik_albom where(name_albom='Нежный сентябрь')) ),
('my name',410, (select id from musik_albom where(name_albom='Хитрый июль')) ),
('my friend',300, (select id from musik_albom where(name_albom='Нежный сентябрь')) ),
('Мой друг',120, (select id from musik_albom where(name_albom='Злобный октябрь')) ),
('Мой только мой',150, (select id from musik_albom where(name_albom='Хитрый июль') ));


insert into sbornik(nazvan, god_vipuska, trek)
values
('Моя любовь','2022-12-15',(select id from musik_trek where name_trek='Мой выбор')),
('Жизнь','2024-11-06',(select id from musik_trek where name_trek='Мой друг')),
('Нежность','2019-12-16',(select id from musik_trek where name_trek='Ностальгия')),
('Измена','2024-12-05',(select id from musik_trek where name_trek='Победа')),
('Свадьба','2024-11-01',(select id from musik_trek where name_trek='Тюльпан')),
('Разлука','2023-10-15',(select id from musik_trek where name_trek='Победа')),
('Прости меня','2024-09-12',(select id from musik_trek where name_trek='Тюльпан'));


insert into ganr_ispolnitel(ganr_id,ispolnitel_id)
values
((select id from musik_ganr where ganr= 'Классика' ),(select id from musik_ispolnitel where name_isp='Иванов Иван'));


insert into ganr_ispolnitel(ganr_id,ispolnitel_id)
values
((select id from musik_ganr where ganr= 'Джаз' ),(select id from musik_ispolnitel where name_isp='Иванов Иван')),
((select id from musik_ganr where ganr= 'Шансон' ),(select id from musik_ispolnitel where name_isp='Иванов Иван')),
((select id from musik_ganr where ganr= 'Джаз' ),(select id from musik_ispolnitel where name_isp='Рубашкин Иван')),
((select id from musik_ganr where ganr= 'Народное пение' ),(select id from musik_ispolnitel where name_isp='Рубашкин Иван')),
((select id from musik_ganr where ganr= 'Народное пение' ),(select id from musik_ispolnitel where name_isp='Токарев Василий')),
((select id from musik_ganr where ganr= 'Бардовая музыка' ),(select id from musik_ispolnitel where name_isp='Немо')),
((select id from musik_ganr where ganr= 'Шансон' ),(select id from musik_ispolnitel where name_isp='Буратино'));


insert into ispolnitel_albom (ispolnitel_id, albom_id)
values
((select id from musik_ispolnitel where name_isp= 'Немо' ),(select id from musik_albom where name_albom='Маэстро'));


insert into ispolnitel_albom (ispolnitel_id, albom_id)
values
((select id from musik_ispolnitel where name_isp= 'Немо' ),(select id from musik_albom where name_albom='Золушка')),
((select id from musik_ispolnitel where name_isp= 'Буратино' ),(select id from musik_albom where name_albom='Маэстро')),
((select id from musik_ispolnitel where name_isp= 'Токарев Василий' ),(select id from musik_albom where name_albom='Маэстро')),
((select id from musik_ispolnitel where name_isp= 'Рубашкин Иван' ),(select id from musik_albom where name_albom='Хитрый июль')),
((select id from musik_ispolnitel where name_isp= 'Иванов Иван' ),(select id from musik_albom where name_albom='Сердитый сентябрь'));





