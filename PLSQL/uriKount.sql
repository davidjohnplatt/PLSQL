DECLARE

kount                        NUMBER                := 0;
mark                         NUMBER                := 0;

CURSOR drive_cursor IS
  select uri
    from content_encoding;
--    where rownum < 5;
    
BEGIN
  FOR i IN drive_cursor LOOP
    kount := LENGTH(i.uri);
    mark := LENGTH(i.uri);
--    DBMS_OUTPUT.PUT_LINE(LENGTH(i.uri));
    LOOP
      kount := kount - 1;
--     DBMS_OUTPUT.PUT_LINE(SUBSTR(i.uri,kount,1));
      IF SUBSTR(i.uri,kount,1) = '/' THEN
        EXIT;
      END IF;
    END LOOP;
    IF mark - kount > 36 THEN
      DBMS_OUTPUT.PUT_LINE(i.uri);
    END IF;
  END LOOP;
END;