
--Задание №2

-- Треков у которых длительность максимальна может быть несколь
select musik_trek.name_trek, musik_trek.dlitelnost 
from musik_trek
where (musik_trek.dlitelnost=(select max(musik_trek.dlitelnost) from musik_trek)  );


select musik_trek.name_trek, musik_trek.dlitelnost 
from musik_trek
where (musik_trek.dlitelnost>=(3.5*60)   );


select sbornik.nazvan, sbornik.god_vipuska 
from sbornik
where sbornik.god_vipuska between '2018-01-01' and '2020-12-31';


select musik_ispolnitel.name_isp 
from musik_ispolnitel
where not trim(musik_ispolnitel.name_isp) like '% %';

-- с учетом регистра запрос
select *
from musik_trek
where (( musik_trek.name_trek like '%мой%' )or ( musik_trek.name_trek like '%my%' ));

-- без учета регистра запрос

select *
from musik_trek
where (( lower(musik_trek.name_trek) like '%мой%' )or ( lower(musik_trek.name_trek) like '%my%' ));


-- Задание №3
select musik_ganr.ganr, musik_ispolnitel.name_isp from musik_ganr left outer join ganr_ispolnitel on musik_ganr.id =ganr_ispolnitel.ganr_id 
left outer join musik_ispolnitel on ganr_ispolnitel.ispolnitel_id =musik_ispolnitel.id ;

select  musik_albom.name_albom, count(musik_trek.id_albom) as kol_trek  
from musik_albom left outer join musik_trek on musik_albom.id = musik_trek.id_albom 
where (musik_albom.god_vipuska between '2019-01-01' and '2020-12-31' ) group by musik_albom.name_albom ;


select  musik_albom.name_albom, avg(musik_trek.id_albom) as sred_dlit 
from musik_albom left outer join musik_trek on musik_albom.id = musik_trek.id_albom 
group by musik_albom.name_albom ;

select  musik_ispolnitel.name_isp,  musik_albom.name_albom,  musik_albom.god_vipuska from musik_albom 
left outer join ispolnitel_albom on musik_albom.id=ispolnitel_albom.albom_id  
left outer join musik_ispolnitel on ispolnitel_albom.ispolnitel_id = musik_ispolnitel.id
where not (musik_albom.god_vipuska between '2020-01-01' and '2020-12-31'  );


select sbornik.nazvan, musik_trek.name_trek, musik_albom.name_albom, musik_ispolnitel.name_isp from sbornik 
left outer join musik_trek on sbornik.trek = musik_trek.id 
left outer join musik_albom on musik_trek.id_albom =musik_albom.id 
left outer join ispolnitel_albom on musik_albom.id = ispolnitel_albom.albom_id 
left outer join musik_ispolnitel on ispolnitel_albom.ispolnitel_id  = musik_ispolnitel.id 
where (musik_ispolnitel.name_isp='Немо');


-- Задание №4

select musik_albom.name_albom, musik_ispolnitel.name_isp 
from musik_albom
left outer join ispolnitel_albom
on  musik_albom.id =ispolnitel_albom.albom_id 
left outer join musik_ispolnitel
on ispolnitel_albom.ispolnitel_id = musik_ispolnitel.id 
where musik_ispolnitel.id
in (
select musik_ispolnitel.id 
from musik_ispolnitel 
left outer join ganr_ispolnitel
on musik_ispolnitel.id = ganr_ispolnitel.ispolnitel_id 
group by musik_ispolnitel.id
having (count(ganr_ispolnitel.ispolnitel_id)>1)
)
;

select *
from musik_trek
where 
not 
( musik_trek.id in (
select  musik_trek.id 
from musik_trek
inner join sbornik
on musik_trek.id = sbornik.trek )
)
;


select musik_trek.name_trek , musik_trek.dlitelnost, musik_ispolnitel.name_isp 
from musik_trek
left outer join musik_albom
on musik_trek.id_albom = musik_albom.id 
left outer join ispolnitel_albom
on musik_albom.id=ispolnitel_albom.albom_id 
left outer join musik_ispolnitel
on ispolnitel_albom.ispolnitel_id = musik_ispolnitel.id 
where 
( musik_trek.dlitelnost=
(select  min(musik_trek.dlitelnost)
from musik_trek))
;



with vrem1 as 
(select musik_albom.id as id_albom ,musik_albom.name_albom as name_albom,  count(musik_trek.id_albom ) as kol_trek
from musik_albom
inner join musik_trek
on musik_albom.id = musik_trek.id_albom 
group by musik_albom.id 
),
vrem2 as 
(select min(kol_trek) as min_kol_trek
from vrem1
)
select id_albom, name_albom, kol_trek
from vrem1, vrem2
where (kol_trek= vrem2.min_kol_trek )
;

