DECLARE

CURSOR table_cursor IS 
  SELECT table_name,owner
    FROM dba_tables
   WHERE owner = 'QPUSER'
     AND table_name NOT LIKE 'DR$%'
   ORDER BY table_name;
     
CURSOR index_cursor IS
  SELECT index_name,owner
    FROM dba_indexes
   WHERE owner = 'QPUSER'
     AND table_name NOT LIKE 'DR$%'
     AND index_name NOT LIKE 'SYS%'
   ORDER BY index_name;

BEGIN  
  html_util.write_head;
  FOR i IN table_cursor LOOP
    html_util.desc_table(i.table_name,i.owner);
  END LOOP;
  FOR j IN index_cursor LOOP
    html_util.desc_index(j.index_name,j.owner);
  END LOOP;
  html_util.write_tail;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;