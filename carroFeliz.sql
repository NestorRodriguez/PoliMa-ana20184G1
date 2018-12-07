-- USER SQL
ALTER USER "carro"
DEFAULT TABLESPACE "SYSTEM"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS

-- ROLES
ALTER USER "carro" DEFAULT ROLE "CONNECT";

create table carro(
placa varchar2(30) PRIMARY KEY,
color VARCHAR2(30),
clindraje varchar2(30),
modelo VARCHAR2(30)
);

create table comprador(
id_comprador varchar2(30) PRIMARY KEY,
nombre_comprador VARCHAR2(30),
telefono_comprador varchar2(30),
correo_comprador VARCHAR2(30)
);

create table vendedor(
id_vendedor varchar2(30) PRIMARY KEY,
nombre_vendedor VARCHAR2(30),
telefono_vendedor varchar2(30),
correo_vendedor VARCHAR2(30)
);

create table carrocomprador(
placaa varchar2(30) REFERENCES carro (placa),
ide_comprador varchar2(30) REFERENCES comprador (id_comprador)
);

create table carrovendedor(
plaquita varchar2(30) REFERENCES carro (placa),
ide_vendedor varchar2(30) REFERENCES vendedor (id_vendedor)
);
 
