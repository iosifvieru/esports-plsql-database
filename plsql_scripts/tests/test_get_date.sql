BEGIN
    DBMS_OUTPUT.PUT_LINE('ECHIPE: ');
    GET_DATE.GET_ECHIPE();
    DBMS_OUTPUT.PUT_LINE('=====================');

    DBMS_OUTPUT.PUT_LINE('JUCATORI: ');
    GET_DATE.GET_JUCATORI();
    DBMS_OUTPUT.PUT_LINE('=====================');

    DBMS_OUTPUT.PUT_LINE('PARTICIPARI: ');
    GET_DATE.GET_PARTICIPARI();
    DBMS_OUTPUT.PUT_LINE('=====================');
    
    DBMS_OUTPUT.PUT_LINE('MECIURI: ');
    GET_DATE.GET_MECIURI();
    DBMS_OUTPUT.PUT_LINE('=====================');

    DBMS_OUTPUT.PUT_LINE('TURNEE: ');
    GET_DATE.GET_TURNEE();
    DBMS_OUTPUT.PUT_LINE('=====================');
END;