DECLARE
   enqueue_options     dbms_aq.enqueue_options_t;
   message_properties  dbms_aq.message_properties_t;
   message_handle      RAW(16);
   message             message_typ;

BEGIN
   message := message_typ(1,'NORMAL MESSAGE','enqueued to msg_queue first.');

   dbms_aq.enqueue(queue_name => 'raw_queue',           
         enqueue_options      => enqueue_options,       
         message_properties   => message_properties,     
         payload              => message,               
         msgid                => message_handle);

   COMMIT;
END;