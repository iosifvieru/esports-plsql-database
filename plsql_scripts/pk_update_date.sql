CREATE OR REPLACE PACKAGE UPDATE_DATE AS
    -- update echipa
    PROCEDURE update_echipa(
        v_id Echipe.id%type,
        v_nume Echipe.nume%type,
        v_tara Echipe.nume%type
    );
    -- update jucatori
    PROCEDURE update_jucatori(
        v_id Jucatori.id%type,
        v_nume Jucatori.nume%type,
        v_porecla Jucatori.porecla%type,
        v_id_echipa Jucatori.id_echipa%type
    );
    -- update meci
    PROCEDURE update_meci(
        v_id Meciuri.id%type,
        v_data Meciuri.data%type,
        v_scor1 Meciuri.scor1%type,
        v_scor2 Meciuri.scor2%type,
        v_id_echipa1 Meciuri.id_echipa1%type,
        v_id_echipa2 Meciuri.id_echipa2%type,
        v_id_turneu Meciuri.id_turneu%type
    );
    -- update participari
    PROCEDURE update_participari(
        v_id Participari.id%type,
        v_punctaj Participari.punctaj%type,
        v_id_turneu Participari.id_turneu%type,
        v_id_echipa Participari.id_echipa%type
    );
    -- update turneu
    PROCEDURE update_turneu(
        v_id Turnee.id%type,
        v_nume Turnee.nume%type,
        v_locatie Turnee.locatie%type,
        v_data_start Turnee.data_start%type,
        v_data_final Turnee.data_final%type
    );
END UPDATE_DATE;
/

CREATE OR REPLACE PACKAGE BODY UPDATE_DATE AS
    -- update echipa
    PROCEDURE update_echipa(
        v_id Echipe.id%type,
        v_nume Echipe.nume%type,
        v_tara Echipe.nume%type
    ) IS
    BEGIN
        UPDATE Echipe
        SET
            nume = v_nume,
            tara = v_tara
        WHERE id = v_id;
    END update_echipa;

    -- update jucatori
    PROCEDURE update_jucatori(
        v_id Jucatori.id%type,
        v_nume Jucatori.nume%type,
        v_porecla Jucatori.porecla%type,
        v_id_echipa Jucatori.id_echipa%type
    ) IS 
    BEGIN
        UPDATE Jucatori
        SET 
            nume = v_nume,
            porecla = v_porecla,
            id_echipa = v_id_echipa
        WHERE id = v_id;
    END update_jucatori;

    -- update meci
    PROCEDURE update_meci(
        v_id Meciuri.id%type,
        v_data Meciuri.data%type,
        v_scor1 Meciuri.scor1%type,
        v_scor2 Meciuri.scor2%type,
        v_id_echipa1 Meciuri.id_echipa1%type,
        v_id_echipa2 Meciuri.id_echipa2%type,
        v_id_turneu Meciuri.id_turneu%type
    ) IS
    BEGIN
        UPDATE MECIURI
        SET 
            data = v_data,
            scor1 = v_scor1,
            scor2 = v_scor2,
            id_echipa1 = v_id_echipa1,
            id_echipa2 = v_id_echipa2,
            id_turneu = v_id_turneu
        WHERE id = v_id;
    END update_meci;

    -- update participari
    PROCEDURE update_participari(
        v_id Participari.id%type,
        v_punctaj Participari.punctaj%type,
        v_id_turneu Participari.id_turneu%type,
        v_id_echipa Participari.id_echipa%type
    ) IS
    BEGIN
        UPDATE Participari
        SET
            punctaj = v_punctaj,
            id_turneu = v_id_turneu,
            id_echipa = v_id_echipa
        WHERE id = v_id;
    END update_participari;

    -- update turneu
    PROCEDURE update_turneu(
        v_id Turnee.id%type,
        v_nume Turnee.nume%type,
        v_locatie Turnee.locatie%type,
        v_data_start Turnee.data_start%type,
        v_data_final Turnee.data_final%type
    ) IS
    BEGIN
        UPDATE Turnee
        SET
            nume = v_nume,
            locatie = v_locatie,
            data_start = v_data_start,
            data_final = v_data_final
        WHERE id = v_id;
    END update_turneu;
END UPDATE_DATE;
/

