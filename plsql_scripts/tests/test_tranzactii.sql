-- FISIER CU TRANZACTII

BEGIN  
    insert_date.insert_turneu(
        999, 
        'Lan G1', 
        'Iasi', 
        TO_DATE('2025-05-05', 'YYYY-MM-DD'),
        TO_DATE('2025-05-06', 'YYYY-MM-DD')
    );

    insert_date.insert_echipa(1, 'Nexus', 'Romania');
    insert_date.insert_echipa(1, 'ENCE', 'Finland');

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;


-- UPDATE
BEGIN
    update_date.update_meci(
        1,
        TO_DATE('2025-05-05', 'YYYY-MM-DD'),
        1,
        3,
        1,
        2,
        1
    );
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

BEGIN
    DELETE_DATE.DELETE_ECHIPE(1);
    DELETE_DATE.DELETE_ECHIPE(10000); -- nu exista id
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;


-- TRANZACTIE CU SAVEPOINT
BEGIN
    -- inseram turneu
    insert_date.insert_turneu(
        20,
        'CS2 2025',
        'Cluj-Napoca',
        TO_DATE('2025-08-10', 'YYYY-MM-DD'),
        TO_DATE('2025-08-20', 'YYYY-MM-DD')
    );

    -- inseram echipa
    insert_date.insert_echipa(200, 'ECHIPA1', 'Cipru');
    insert_date.insert_echipa(201, 'ECHIPA2', 'Elvetia');

    SAVEPOINT DUPA_ECHIPE;

    BEGIN
        -- inseram jucatori
        insert_date.insert_jucatori(300, 'Nume1 Prenume1', 'J1', 200); -- valid, jucator la echipa 200
        insert_date.insert_jucatori(301, 'Nume2 Prenume2', 'J2', 201); -- valid

        -- invalid
        insert_date.insert_jucatori(302, 'Invalid Player', 'J3', 999);

        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Eroare la inserarea jucatorilor: ' || SQLERRM);
                ROLLBACK TO DUPA_ECHIPE;
    END;
    COMMIT;

END;