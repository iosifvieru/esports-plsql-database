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