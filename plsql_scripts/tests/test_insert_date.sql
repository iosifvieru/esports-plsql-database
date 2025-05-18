-- testarea functiilor din package-ul insert_date
BEGIN
    insert_date.insert_echipa(100, 'Natus Vincere', 'Ukraine');
    insert_date.insert_echipa(101, 'FaZe Clan', 'United States');
    insert_date.insert_echipa(102, 'G2', 'Germany');
END;
/

BEGIN
    insert_date.INSERT_JUCATORI(1000, 'Mihai Ivan', 'iM', 100);
    insert_date.INSERT_JUCATORI(1001, 'Finn Andersen', 'karrigan', 101);
    insert_date.INSERT_JUCATORI(1002, 'Wiktor Wojtas', 'TaZ', 102);
END;
/

BEGIN
    insert_date.INSERT_JUCATORI(1003, 'test', 'test', 100);
END;

BEGIN
    insert_date.INSERT_TURNEU(1, 'PGL 2025', 'Cluj Napoca', TO_DATE('2025-06-10', 'YYYY-MM-DD'), TO_DATE('2025-06-12', 'YYYY-MM-DD'));
END;
/

BEGIN
    -- inserare echipa Natus Vincere (id 100) ca participand la turneul PGL 2025(id 1)
    insert_date.INSERT_PARTICIPARI(1, 0, 1, 100);
END;
/

BEGIN
    insert_date.INSERT_MECIURI(3, TO_DATE('2025-06-10', 'YYYY-MM-DD'), 13, 2, 100, 101, 1);
END;
/

-- test inserare turneu cu data start > data_final pt. trigger - this should fail
BEGIN
    insert_date.INSERT_TURNEU(2, 'IESF 2024', 'Iasi', TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-08', 'YYYY-MM-DD'));
END;

-- test inserare turneu normal -- this should pass
BEGIN
    insert_date.INSERT_TURNEU(3, 'CS2 Major 2026', 'Berlin', TO_DATE('2026-02-1', 'YYYY-MM-DD'), TO_DATE('2026-02-07', 'YYYY-MM-DD'));
END;

-- test inserare meci cu data invalida -- this should fail
BEGIN
    insert_date.INSERT_MECIURI(3, TO_DATE('2025-06-10', 'YYYY-MM-DD'), 13, 2, 100, 101, 3);
END;


BEGIN
    -- inserare echipa Natus Vincere (id 100) ca participand la turneul PGL 2025(id 1)
    insert_date.INSERT_PARTICIPARI(2, 0, 3, 100);
END;
/

-- test
BEGIN
    insert_date.INSERT_MECIURI(5, TO_DATE('2026-02-2', 'YYYY-MM-DD'), 13, 2, 100, 101, 3);
END;
/
