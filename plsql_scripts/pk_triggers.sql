-- fisier cu triggers

-- valideaza ca data turneului e corecta
CREATE OR REPLACE TRIGGER trigger_turnee
    BEFORE UPDATE OR INSERT ON Turnee
    FOR EACH ROW
BEGIN
    -- validam datele apeland functia validare_turnee_data
    insert_date.validare_turnee_data(:NEW.data_start, :NEW.data_final);
END;
/

-- valideaza ca data meciului e valida in contextul turneului
CREATE OR REPLACE TRIGGER trigger_meci
    BEFORE UPDATE OR INSERT ON Meciuri
    FOR EACH ROW
BEGIN
    insert_date.VALIDARE_DATA_MECI(:NEW.id_turneu, :NEW.data);
END;
/

-- trigger ce actualizeaza punctajul din participari pentru fiecare meci din turneu
CREATE OR REPLACE TRIGGER trigger_punctaj
    BEFORE INSERT OR UPDATE OR DELETE ON Meciuri
    FOR EACH ROW
DECLARE
    v_old_winner NUMBER := NULL;
    v_new_winner NUMBER := NULL;
BEGIN
    -- daca actualizam / stergem un meci trebuie sa scadem 1 punct echipei castigatoare "vechi"
    IF DELETING OR UPDATING THEN
        IF :OLD.SCOR1 > :OLD.SCOR2 THEN
            v_old_winner := :OLD.id_echipa1;
        ELSIF :OLD.SCOR2 > :OLD.SCOR1 THEN
            v_old_winner := :OLD.id_echipa2;
        END IF;
    END IF;

    -- decidem castigatorul
    IF INSERTING OR UPDATING THEN
        IF :NEW.SCOR1 > :NEW.SCOR2 THEN
            v_new_winner := :NEW.id_echipa1;
        ELSIF :NEW.SCOR2 > :NEW.SCOR1 THEN
            v_new_winner := :NEW.id_echipa2;
        END IF;
    END IF;

    -- scadem 1 punct echipei care castigase inainte
    IF v_old_winner IS NOT NULL AND v_old_winner != v_new_winner THEN
        UPDATE PARTICIPARI
        SET PUNCTAJ = PUNCTAJ - 1
        WHERE id_echipa = v_old_winner AND id_turneu = :OLD.id_turneu;
    END IF;

    -- adaugam 1 punct echipei castigatoare
    IF v_new_winner IS NOT NULL AND v_old_winner != v_new_winner THEN
        UPDATE PARTICIPARI
        SET PUNCTAJ = PUNCTAJ + 1
        WHERE id_echipa = v_new_winner AND id_turneu = :NEW.id_turneu;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('eroare la punctaj: ' || SQLERRM);
END;
/
