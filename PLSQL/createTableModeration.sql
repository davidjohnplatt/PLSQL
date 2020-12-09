--moderation_metrics

CREATE TABLE MODERATION_METRICS
(
  PROVIDER_ID     VARCHAR2(150 BYTE)             NOT NULL,
  DATE_MODERATED  DATE                          NOT NULL,
  OUTCOME_ID      INTEGER                       NOT NULL,
  USER_ID         VARCHAR2(151 BYTE)             NOT NULL,
  CLIP_ID         INTEGER                       NOT NULL
);

ALTER TABLE MODERATION_METRICS ADD (
  CONSTRAINT MODERATION_METRICS_PK
 PRIMARY KEY
 (PROVIDER_ID)
    USING INDEX 
    TABLESPACE VDS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          2M
                NEXT             2M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));


CREATE UNIQUE INDEX MODERATION_METRICS_PK ON MODERATION_METRICS
(PROVIDER_ID)
--moderation_outcome


CREATE TABLE MODERATION_OUTCOME
(
  OUTCOME_ID  INTEGER                           NOT NULL,
  OUTCOME     VARCHAR2(100 BYTE)                NOT NULL
);



CREATE UNIQUE INDEX MODERATION_OUTCOME ON MODERATION_OUTCOME
(OUTCOME_ID);



ALTER TABLE MODERATION_OUTCOME ADD (
  CONSTRAINT MODERATION_OUTCOME
 PRIMARY KEY
 (OUTCOME_ID)
    USING INDEX 
    TABLESPACE VDS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          2M
                NEXT             2M
                MINEXTENTS       1
                MAXEXTENTS       2147483645
                PCTINCREASE      0
               ));

insert into moderation_outcome Values(1,'Explicit Material');

insert into moderation_outcome Values(2,'Copyright of Violation');

insert into moderation_outcome Values(3,'Poor Quality of Content');

insert into moderation_outcome Values(4,'Poor Quality of Video Playback');

insert into moderation_outcome Values(5,'Incomplete or Invalid Meta Data');

insert into moderation_outcome Values(6,'Accepted');

