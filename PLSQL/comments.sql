--
--  Table comments.  Make changes between the ''s in the output.  execute
--  the script to post comments back to the database.
-- 
SELECT 'COMMENT ON TABLE '||LOWER(owner)||'.'||LOWER(table_name)||' IS '||''''||comments||''''||';'
  FROM dba_tab_comments
 WHERE owner = 'QP_ROGERS_ADMIN'
   AND table_name = 'ADMIN_ROLE';
--
--  query output follows
--   
COMMENT ON TABLE qp_rogers_admin.admin_role IS 'The role table';

--
--  Column comments. Make changes between the ''s in the output.  execute
--  the script to post comments back to the database.
--
SELECT 'COMMENT ON COLUMN '||LOWER(owner)||'.'||LOWER(table_name)||'.'||LOWER(column_name)||' IS '||''''||comments||''''||';'
  FROM dba_col_comments
 WHERE owner = 'QP_ROGERS_ADMIN'
   AND table_name = 'ADMIN_ROLE';
--
--  query output follows
--      
COMMENT ON COLUMN qp_rogers_admin.admin_role.role_id IS 'Primary key for the Role table';
COMMENT ON COLUMN qp_rogers_admin.admin_role.name IS '';
COMMENT ON COLUMN qp_rogers_admin.admin_role.created_datetime IS '';
--
--  If permission problems are encountered when updating the comments
--  return the completed scripts to IT.  We will post them for you
--

 