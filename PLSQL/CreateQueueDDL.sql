BEGIN
  DBMS_AQADM.STOP_QUEUE(
      queue_name        => 'test_raw_queue');
END;



BEGIN
   DBMS_AQADM.DROP_QUEUE(
      queue_name         => 'test_raw_queue');
END;

BEGIN
  DBMS_AQADM.DROP_QUEUE_TABLE(
      queue_table            => 'raw_test_tab');
END;

BEGIN     
   DBMS_AQADM.CREATE_QUEUE_TABLE(
      queue_table            => 'raw_test_tab',
      queue_payload_type     => 'raw');
END;

BEGIN     
   DBMS_AQADM.CREATE_QUEUE( 
      queue_name          => 'raw_test_queue', 
      queue_table         => 'raw_test_tab'); 
END;

BEGIN      
   DBMS_AQADM.START_QUEUE (
      queue_name         => 'raw_test_queue');
END;

BEGIN
   DBMS_AQADM.START_QUEUE( 
      queue_name         => 'raw_queue', 
      dequeue            => TRUE, 
      enqueue            => FALSE); 
END;
