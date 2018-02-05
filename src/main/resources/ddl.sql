CREATE TABLE OLIMMSPROD.project
(
  projectCode    VARCHAR2(25),
  intro          CLOB,
  scope          CLOB,
  sanctionDate   DATE,
  duration       INTEGER,
  estimateValue  NUMBER(22,2),
  noOfPackages   INTEGER,
  unit           VARCHAR2(50)
)
STORAGE    (
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCACHE
NOPARALLEL
NOMONITORING;

CREATE UNIQUE INDEX OLIMMSPROD.PK_PROJECT ON OLIMMSPROD.PROJECT
(PROJECTCODE)
LOGGING
TABLESPACE OLIMMSPROD_DAT
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            FREELISTS        1
            FREELIST GROUPS  1
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL;


ALTER TABLE OLIMMSPROD.PROJECT ADD (
  CONSTRAINT PK_PROJECT
  PRIMARY KEY
  (PROJECTCODE)
  USING INDEX OLIMMSPROD.PK_PROJECT
  ENABLE VALIDATE);



CREATE TABLE OLIMMSPROD.project
(
  projectCode    VARCHAR2(25),
  id            LONG,
  index         VARCHAR(20),
  requirement   CLOB,  
  remarks       CLOB
)
STORAGE    (
            BUFFER_POOL      DEFAULT
           );
