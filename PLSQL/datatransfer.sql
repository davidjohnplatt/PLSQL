copy from qp_rogers_admin/qp_rogers_admin@qpsit to 
qp_mmp2_admin/qp_mmp2_infract10n@qplay insert content_provider using select 
* from content_provider WHERE CONTENT_PROVIDER_ID > 42;

copy from qp_rogers_admin/qp_rogers_admin@qpsit to qp_mmp2_admin/qp_mmp2_infract10n@qplay insert PROFILE using select * from PROFILE WHERE PROFILE_ID IN (420,421,422,423,424,425);

copy from qp_rogers_admin/qp_rogers_admin@qpsit to dba_admin/killer1@qplay 
insert PROFILE_BAK using select * from PROFILE WHERE PROFILE_ID BETWEEN 360 
AND 365;

copy from qp_rogers_admin/qp_rogers_admin@qpsit to qp_mmp2_admin/qp_mmp2_infract10n@qplay insert component using select * from component WHERE component_ID IN(420,421,422,423,424,425);

copy from qp_rogers_admin/qp_rogers_admin@qpsit to dba_admin/killer1@qplay 
insert component_bak using select * from component WHERE component_ID 
BETWEEN 360 AND 365;

copy from qp_rogers_admin/qp_rogers_admin@qpsit to 
qp_mmp2_admin/qp_mmp2_infract10n@qplay insert content_provider using select 
* from content_provider WHERE content_provider_ID >53;

copy from qp_rogers_admin/qp_rogers_admin@qpsit to qp_mmp2_admin/qp_mmp2_infract10n@qplay insert component_listeners using select * from component_listeners WHERE src_component_ID IN (420,421,422,423,424,425);

copy from qp_rogers_admin/qp_rogers_admin@qpsit to 
qp_mmp2_admin/qp_mmp2_infract10n@qplay insert ENCODING_PROFILE using select 
* from ENCODING_PROFILE WHERE ENCODING_PROFILE_ID > 139;

update qp_mmp2_admin.profile set data = replace(data,'e6501','192.168.10.128')where data like '%e6501%';

update qp_mmp2_admin.profile set data = replace(data,'7017','7130')where data like '%7017%';

update qp_mmp2_admin.profile set data = replace(data,'usr/local/ingestion_services/cp/','mobile/content/mmp2/') where data like '%usr/local/ingestion_services/cp/%';

update qp_mmp2_admin.content_encoding set uri = 
replace(uri,'//69.46.111.254:554/','//216.220.63.206/')
where uri like '%//69.46.111.254:554/%';

--Profile table update

DECLARE
CURSOR C1 IS
SELECT PROFILE_ID ID,DATA DATABAK,NAME NAMEBAK,DESCRIPTION DESCBAK
FROM PROFILE_BAK
WHERE PROFILE_ID BETWEEN 360 AND 365;
BEGIN
FOR RC1 IN C1
LOOP
DBMS_OUTPUT.PUT_LINE(RC1.ID);
UPDATE QP_MMP2_ADMIN.PROFILE SET DATA = RC1.DATABAK,NAME=RC1.NAMEBAK,
DESCRIPTION=RC1.DESCBAK
WHERE PROFILE_ID=RC1.ID;
END LOOP;
END;
/

component
DECLARE
CURSOR C1 IS
SELECT component_ID ID,component_name componentname,module_id 
moduleid,profile_id profileid,description DESCBAK
FROM component_BAK
WHERE component_ID BETWEEN 340 AND 345;
BEGIN
FOR RC1 IN C1
LOOP
DBMS_OUTPUT.PUT_LINE(RC1.ID);
UPDATE QP_MMP2_ADMIN.component SET component_name = 
RC1.componentname,module_id=rc1.moduleid,
profile_id=rc1.profileid,
DESCRIPTION=RC1.DESCBAK
WHERE component_ID=RC1.ID;
END LOOP;
END;
/
--Content_provider table update

DECLARE
CURSOR C1 IS
SELECT CONTENT_PROVIDER_ID ID
EXTERNAL_ID EXT_ID
NAME  NAMEBAK
DESCRIPTION  DESCBAK
CREATED_DATETIME  CRTDATE
FROM CONTENT_PROVIDER_BAK
WHERE CONTENT_PROVIDER_ID   BETWEEN  AND ;
BEGIN
FOR RC1 IN C1
LOOP
DBMS_OUTPUT.PUT_LINE(RC1.ID);
UPDATE QP_MMP2_ADMIN.CONTENT_PROVIDER   SET EXTERNAL_ID = 
RC1.EXT_ID,NAME=RC1.NAMEBAK,
DESCRIPTION=RC1.DESCBAK
WHERE CONTENT_PROVIDER_ID=RC1.ID;
END LOOP;
END;
/

--Encoding_profile table update

DECLARE
CURSOR C1 IS
ENCODING_PROFILE_ID  id
NAME   NAMEBAK
DESCRIPTION   DESCBAK
INPUT_ENCODING_FORMAT INENCFOR
OUTPUT_ENCODING_FORMAT OUTENCFOR
FROM ENCODING_PROFILE_BAK
WHERE ENCODING_PROFILE_ID BETWEE  AND;
BEGING
FOR RC1 IN C1
LOOP
UPDATE QP_MMP2_ADMIN.ENCODING_PROFILE SET NAME = RC1.NAMEBAK, 
DESCRIPTION=RC1.DESCBAK,
INPUT_ENCODING_FORMAT = RC1.INENCFOR, OUTPUT_ENCODING_FORMAT=RC1.OUTENFOR;
END LOOP;
END;
/

