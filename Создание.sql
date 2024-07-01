create table if not exists  musik_ganr(
id SERIAL primary key,
ganr varchar(120) unique not null
);
create table if not exists musik_ispolnitel(
id serial primary key,
name_isp varchar(150) unique not null
);
create table if not exists musik_albom(
id serial primary key,
name_albom varchar(150),
god_vipuska date not null
);
create table if not exists musik_trek(
id serial primary key,
id_albom integer not null references musik_albom(id),
name_trek varchar(150) unique not null , 
dlitelnost integer not null
);
create table if not exists ganr_ispolnitel(
ganr_id integer references musik_ganr(id),
ispolnitel_id integer references musik_ispolnitel(id),
constraint id1 primary key (ganr_id, ispolnitel_id)
);
create table if not exists ispolnitel_albom(
ispolnitel_id integer references musik_ispolnitel(id),
albom_id integer references musik_albom(id),
constraint id2 primary key (ispolnitel_id, albom_id)
);
create table if not exists sbornik(
nazvan varchar(150),
god_vipuska date not null,
trek integer not null references musik_trek(id)
);
