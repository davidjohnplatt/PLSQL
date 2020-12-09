DECLARE

mUserName                   VARCHAR2(30);
CURSOR drive_cursor IS
  SELECT * 
    FROM user_tables;
    
FUNCTION getUsername RETURN VARCHAR2 IS
  lUser                     VARCHAR2(30);
BEGIN
  SELECT USER
    INTO lUser 
    FROM dual;
  RETURN lUser;
EXCEPTION
 WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('gu'||SQLERRM);
END;
/******************************************************************************/
BEGIN
  mUserName := getUsername;
  FOR i IN drive_cursor LOOP
    DBMS_OUTPUT.PUT_LINE(i.table_name);
  END LOOP;
EXCEPTION
 WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
