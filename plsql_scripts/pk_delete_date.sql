CREATE OR REPLACE PACKAGE DELETE_DATE AS
    invalid_data EXCEPTION;

    -- delete echipe
    PROCEDURE delete_echipe(
        v_id Echipe.id%type
    );

    -- delete jucatori
    PROCEDURE delete_jucatori(
        v_id Jucatori.id%type
    );

    -- delete meciuri
    PROCEDURE delete_meciuri(
        v_id Meciuri.id%type
    );

    -- delete participari
    PROCEDURE delete_participari(
        v_id PARTICIPARI.ID%TYPE
    );

    -- delete turnee
    PROCEDURE delete_turnee(
        v_id TURNEE.ID%TYPE
    );
END DELETE_DATE;
/

CREATE OR REPLACE PACKAGE BODY DELETE_DATE AS
    -- delete echipe
    PROCEDURE delete_echipe(
        v_id Echipe.id%type
    ) IS
    BEGIN
        DELETE FROM Echipe WHERE id = v_id;

        IF(SQL%NOTFOUND) THEN
            raise invalid_data;
        END IF;
    END DELETE_ECHIPE;

    -- delete jucatori
    PROCEDURE delete_jucatori(
        v_id Jucatori.id%type
    ) IS
    BEGIN
        DELETE FROM JUCATORI WHERE id = v_id;

        IF(SQL%NOTFOUND) THEN
            raise invalid_data;
        END IF;
    END;

    -- delete meciuri
    PROCEDURE delete_meciuri(
        v_id Meciuri.id%type
    ) IS
    BEGIN
        DELETE FROM MECIURI WHERE id = v_id;

        IF(SQL%NOTFOUND) THEN
            raise invalid_data;
        END IF;
    END;

    -- delete participari
    PROCEDURE delete_participari(
        v_id PARTICIPARI.ID%TYPE
    ) IS
    BEGIN
        DELETE FROM PARTICIPARI WHERE id = v_id;

        IF(SQL%NOTFOUND) THEN
            raise invalid_data;
        END IF;
    END;

    -- delete turnee
    PROCEDURE delete_turnee(
        v_id TURNEE.ID%TYPE
    ) IS
    BEGIN
        DELETE FROM TURNEE WHERE id = v_id;

        IF(SQL%NOTFOUND) THEN
            raise invalid_data;
        END IF;
    END;
END DELETE_DATE;
/
