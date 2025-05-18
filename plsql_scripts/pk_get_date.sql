CREATE OR REPLACE PACKAGE GET_DATE AS
    PROCEDURE GET_ECHIPE;
    PROCEDURE GET_JUCATORI;
    PROCEDURE GET_MECIURI;
    PROCEDURE GET_PARTICIPARI;
    PROCEDURE GET_TURNEE;
END GET_DATE;
/

CREATE OR REPLACE PACKAGE BODY GET_DATE AS
    PROCEDURE GET_ECHIPE
    IS BEGIN
        FOR rec in (SELECT * FROM ECHIPE) LOOP
            DBMS_OUTPUT.PUT_LINE(
                rec.id || ' ' ||
                rec.nume || ' ' ||
                rec.tara
            );
        END LOOP;
    END GET_ECHIPE;

    PROCEDURE GET_JUCATORI IS BEGIN
        FOR rec in (SELECT * FROM JUCATORI) LOOP
            DBMS_OUTPUT.PUT_LINE(
                rec.id || ' ' ||
                rec.nume || ' ' ||
                rec.porecla || ' ' ||
                rec.id_echipa
            );
        END LOOP;
    END GET_JUCATORI;

    PROCEDURE GET_MECIURI IS BEGIN
        FOR rec in (SELECT * FROM MECIURI) LOOP
            DBMS_OUTPUT.PUT_LINE(
                rec.id || ' ' ||
                rec.data || ' ' ||
                rec.scor1 || ' ' ||
                rec.scor2 || ' ' ||
                rec.id_echipa1 || ' ' ||
                rec.id_echipa2 || ' ' ||
                rec.id_turneu
            );
        END LOOP;
    END GET_MECIURI;

    PROCEDURE GET_PARTICIPARI IS BEGIN
        FOR rec in (SELECT * FROM PARTICIPARI) LOOP
            DBMS_OUTPUT.PUT_LINE(
                rec.id || ' ' ||
                rec.punctaj || ' ' ||
                rec.id_turneu || ' ' ||
                rec.id_echipa  
            );
        END LOOP;
    END GET_PARTICIPARI;
    
    PROCEDURE GET_TURNEE IS BEGIN
        FOR rec in (SELECT * FROM TURNEE) LOOP
            DBMS_OUTPUT.PUT_LINE(
                rec.id || ' ' ||
                rec.nume || ' ' ||
                rec.locatie || ' ' ||
                rec.data_start || ' ' ||
                rec.data_final
            );
        END LOOP;
    END GET_TURNEE;
END GET_DATE;
/ 
