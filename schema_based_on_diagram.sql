CREATE TABLE patients( id int generated always AS identity, name char(50), date_of_birth date, primary key(id) )

CREATE TABLE invoices( id int generated always AS identity, total_amount decimal, generated_at timestamp, payed_at timestamp, medical_history_id int references medical_histories(id), primary key(id) )

CREATE TABLE invoice_items( id int generated always AS identity, unit_price decimal, quantity int, total_price decimal, invoice_id int references invoices(id), treatment_id int references treatments(id), )

CREATE TABLE medical_histories (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(50) , CONSTRAINT fk_patient_id FOREIGN KEY(patient_id) REFERENCES patients(id) ON DELETE CASCADE

CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, type VARCHAR(200) NOT NULL,name VARCHAR(200) NOT NULL);

CREATE TABLE med_histories_treatment (
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    PRIMARY KEY(medical_history_id, treatment_id),
    CONSTRAINT fk_medical_histories
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
    ON DELETE CASCADE,
    CONSTRAINT fk_treatments
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
    ON DELETE CASCADE
    );


		--Create Indexes for the tables
		CREATE INDEX patient_id_med_histories ON medical_histories(patient_id ASC);

CREATE INDEX invoice_id_invoice_items ON invoice_items(invoice_id ASC);

CREATE INDEX treatment_id_invoice_items ON invoice_items(treatment_id ASC);

CREATE INDEX medical_history_id_invoices ON invoices(medical_history_id ASC);

CREATE INDEX treatment_id_med_histories_treatment_asc ON med_histories_treatment(treatment_id ASC);

CREATE INDEX medical_history_id_med_histories_treatment_asc ON med_histories_treatment(medical_history_id ASC); 