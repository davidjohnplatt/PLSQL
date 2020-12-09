SET SERVEROUTPUT ON

DECLARE

m_kount                  NUMBER                := 0;
m_kount1                 NUMBER                := 0;
m_rows                   NUMBER;
m_custnum                NUMBER(10);

loc                      VARCHAR2(40)          := '\\fileserver1\shared\cwreports';
name                     VARCHAR2(40)          := 'accounts_without_users';
omode                    VARCHAR2(1)           := 'W';
fd                       UTL_FILE.FILE_TYPE;


CURSOR drive_cursor IS
   SELECT file_name
     FROM dba_data_files
    ORDER BY file_name;

BEGIN

DBMS_OUTPUT.ENABLE(1000000);



fd := UTL_FILE.FOPEN(loc, name, omode);

FOR i IN drive_cursor LOOP
  UTL_FILE.put_line(fd,i.file_name);
END LOOP;
UTL_FILE.fclose(fd);

DBMS_OUTPUT.PUT_LINE('Processing Complete');

END;
/
