-- Generado por Oracle SQL Developer Data Modeler 18.3.0.268.1208
--   en:        2018-12-10 10:36:23 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g

CREATE USER CARROFELIZ IDENTIFIED BY "123456"
DEFAULT TABLESPACE "USERS" 
TEMPORARY TABLESPACE "TEMP";

CREATE TABLE carro (
    placa        INTEGER NOT NULL,
    color        VARCHAR2(20),
    cilindraje   INTEGER,
    modelo       INTEGER
);

ALTER TABLE carro ADD CONSTRAINT carro_pk PRIMARY KEY ( placa );

CREATE TABLE carrocomprador (
    carro_placa            INTEGER NOT NULL,
    vendedor_id_vendedor   INTEGER NOT NULL
);

ALTER TABLE carrocomprador ADD CONSTRAINT carrocomprador_pk PRIMARY KEY ( carro_placa );

CREATE TABLE carrovendedor (
    carro_placa              INTEGER NOT NULL,
    comprador_id_comprador   INTEGER NOT NULL
);

ALTER TABLE carrovendedor ADD CONSTRAINT carrovendedor_pk PRIMARY KEY ( carro_placa );

CREATE TABLE comprador (
    id_comprador         INTEGER NOT NULL,
    nombre_comprador     VARCHAR2(20),
    telefono_comprador   INTEGER,
    correo_comprador     VARCHAR2(20)
);

ALTER TABLE comprador ADD CONSTRAINT comprador_pk PRIMARY KEY ( id_comprador );

CREATE TABLE vendedor (
    id_vendedor         INTEGER NOT NULL,
    nombre_vendedor     VARCHAR2(20),
    telefono_vendedor   INTEGER,
    correo_vendedor     VARCHAR2(20)
);

ALTER TABLE vendedor ADD CONSTRAINT vendedor_pk PRIMARY KEY ( id_vendedor );

ALTER TABLE carrocomprador
    ADD CONSTRAINT carrocomprador_carro_fk FOREIGN KEY ( carro_placa )
        REFERENCES carro ( placa );

ALTER TABLE carrocomprador
    ADD CONSTRAINT carrocomprador_vendedor_fk FOREIGN KEY ( vendedor_id_vendedor )
        REFERENCES vendedor ( id_vendedor );

ALTER TABLE carrovendedor
    ADD CONSTRAINT carrovendedor_carro_fk FOREIGN KEY ( carro_placa )
        REFERENCES carro ( placa );

ALTER TABLE carrovendedor
    ADD CONSTRAINT carrovendedor_comprador_fk FOREIGN KEY ( comprador_id_comprador )
        REFERENCES comprador ( id_comprador );

ALTER TABLE carrocomprador
    ADD CONSTRAINT carrocomprador_carro_fk FOREIGN KEY ( carro_placa )
        REFERENCES carro ( placa );

ALTER TABLE carrocomprador
    ADD CONSTRAINT carrocomprador_vendedor_fk FOREIGN KEY ( vendedor_id_vendedor )
        REFERENCES vendedor ( id_vendedor );

ALTER TABLE carrovendedor
    ADD CONSTRAINT carrovendedor_carro_fk FOREIGN KEY ( carro_placa )
        REFERENCES carro ( placa );

ALTER TABLE carrovendedor
    ADD CONSTRAINT carrovendedor_comprador_fk FOREIGN KEY ( comprador_id_comprador )
        REFERENCES comprador ( id_comprador );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
