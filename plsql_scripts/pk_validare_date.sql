CREATE OR REPLACE PACKAGE VALIDARE_DATE AS
  -- exceptie turneu
  e_data_invalida_turnee EXCEPTION;
  -- exceptie meci
  e_data_invalida_meci EXCEPTION;
  
  -- functii validare pt triggers
  PROCEDURE validare_turnee_data(
    v_data_start Turnee.data_start%type,
    v_data_final Turnee.data_final%type
  );

  -- functie validare data meci
  PROCEDURE validare_data_meci(
    v_id_turneu MECIURI.id_turneu%type,
    v_data MECIURI.data%type
  );
END VALIDARE_DATE;
/

-- PACKAGE BODY
create or replace PACKAGE BODY VALIDARE_DATE AS 
  -- validare turnee data
  PROCEDURE validare_turnee_data(
    v_data_start Turnee.data_start%type,
    v_data_final Turnee.data_final%type
  ) IS
  BEGIN
    IF v_data_start > v_data_final THEN
      -- dbms_output.put_line('Data de start a turneului > data de final');
      RAISE e_data_invalida_turnee;
    END IF;
  END validare_turnee_data;

  -- validare data meci
  PROCEDURE validare_data_meci(
    v_id_turneu MECIURI.id_turneu%type,
    v_data MECIURI.data%type
  ) IS
  v_data_start Turnee.data_start%type;
  v_data_final Turnee.data_final%type;
  BEGIN
    SELECT data_start, data_final INTO v_data_start, v_data_final
    FROM Turnee WHERE id = v_id_turneu;
    
    IF v_data < v_data_start OR v_data > v_data_final THEN
      -- DBMS_OUTPUT.PUT_LINE('Data meciului este invalida.');
      RAISE e_data_invalida_meci;
    END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nu exista turneu cu id-ul dat.');
  
  END validare_data_meci;
END VALIDARE_DATE;
/