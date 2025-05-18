
-- PACKAGE HEADER
create or replace PACKAGE insert_date AS
  -- insert echipa
  PROCEDURE insert_echipa(
    v_id Echipe.id%type,
    v_nume Echipe.nume%type,
    v_tara Echipe.tara%type
  );

  -- insert jucatori
  PROCEDURE insert_jucatori(
    v_id Jucatori.id%type,
    v_nume Jucatori.nume%type,
    v_porecla Jucatori.porecla%type,
    v_id_echipa Jucatori.id_echipa%type
  );

  -- insert meci
  PROCEDURE insert_meciuri(
    v_id Meciuri.id%type,
    v_data Meciuri.data%type,
    v_scor1 Meciuri.scor1%type,
    v_scor2 Meciuri.scor2%type,
    v_id_echipa1 Meciuri.id_echipa1%type,
    v_id_echipa2 Meciuri.id_echipa2%type,
    v_id_turneu Meciuri.id_turneu%type
  );

  -- insert participari
  PROCEDURE insert_participari(
    v_id Participari.id%type,
    v_punctaj Participari.punctaj%type,
    v_id_turneu Participari.id_turneu%type,
    v_id_echipa Participari.id_echipa%type
  );

  -- insert turneu
  PROCEDURE insert_turneu(
    v_id Turnee.id%type,
    v_nume Turnee.nume%type,
    v_locatie Turnee.locatie%type,
    v_data_start Turnee.data_start%type,
    v_data_final Turnee.data_final%type
  );
END insert_date;
/

-- PACKAGE BODY
create or replace PACKAGE BODY insert_date AS 
  -- insert echipa
  PROCEDURE insert_echipa(
    v_id Echipe.id%type,
    v_nume Echipe.nume%type,
    v_tara Echipe.tara%type
  ) IS
  BEGIN
    INSERT INTO Echipe (id, nume, tara) 
    VALUES (
      v_id, v_nume, v_tara
    );
  END insert_echipa;

  -- insert jucatori
  PROCEDURE insert_jucatori(
    v_id Jucatori.id%type,
    v_nume Jucatori.nume%type,
    v_porecla Jucatori.porecla%type,
    v_id_echipa Jucatori.id_echipa%type
  ) IS
  BEGIN
    INSERT INTO JUCATORI (ID, NUME, PORECLA, ID_ECHIPA)
    VALUES
    (
      v_id, v_nume, v_porecla, v_id_echipa
    );
  END insert_jucatori;

  -- insert meci
  PROCEDURE insert_meciuri(
    v_id Meciuri.id%type,
    v_data Meciuri.data%type,
    v_scor1 Meciuri.scor1%type,
    v_scor2 Meciuri.scor2%type,
    v_id_echipa1 Meciuri.id_echipa1%type,
    v_id_echipa2 Meciuri.id_echipa2%type,
    v_id_turneu Meciuri.id_turneu%type
  ) IS
  BEGIN
    INSERT INTO MECIURI (ID, DATA, SCOR1, SCOR2, ID_ECHIPA1, ID_ECHIPA2, ID_TURNEU)
    VALUES
    (
      v_id, v_data, v_scor1, v_scor2, v_id_echipa1, v_id_echipa2, v_id_turneu
    );

    -- tratare exceptie din trigger
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare la inserarea meciului, data invalida.');
  END insert_meciuri;

  -- insert participari
  PROCEDURE insert_participari(
    v_id Participari.id%type,
    v_punctaj Participari.punctaj%type,
    v_id_turneu Participari.id_turneu%type,
    v_id_echipa Participari.id_echipa%type
  ) IS
  BEGIN
    INSERT INTO PARTICIPARI (ID, PUNCTAJ, ID_TURNEU, ID_ECHIPA)
    VALUES
    (
      v_id, v_punctaj, v_id_turneu, v_id_echipa
    );
  END insert_participari;

  -- insert turneu
  PROCEDURE insert_turneu(
    v_id Turnee.id%type,
    v_nume Turnee.nume%type,
    v_locatie Turnee.locatie%type,
    v_data_start Turnee.data_start%type,
    v_data_final Turnee.data_final%type
  ) IS
  BEGIN
    INSERT INTO TURNEE (ID, NUME, LOCATIE, DATA_START, DATA_FINAL)
    VALUES (
      v_id, v_nume, v_locatie, v_data_start, v_data_final
    );
  
    -- tratare exceptie din trigger
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare la inserarea turneului, data invalida.');
  END insert_turneu;
END;
/