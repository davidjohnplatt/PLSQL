DECLARE
    queue_options       DBMS_AQ.DEQUEUE_OPTIONS_T;
    message_properties  DBMS_AQ.MESSAGE_PROPERTIES_T;
    message_id          RAW(2000);
    my_message          message_typ;
BEGIN
    DBMS_AQ.DEQUEUE(
        queue_name => 'raw_queue',
        dequeue_options => queue_options,
        message_properties => message_properties,
        payload => my_message,
        msgid => message_id );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(
        'Dequeued no: ' || my_message.sender_id);
    DBMS_OUTPUT.PUT_LINE(
        'Dequeued title: ' || my_message.subject);
    DBMS_OUTPUT.PUT_LINE(
        'Dequeued text: ' || my_message.text);
END;