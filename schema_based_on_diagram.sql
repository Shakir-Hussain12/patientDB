CREATE TABLE patients( id int generated always AS identity, name char(50), date_of_birth date, primary key(id) )

CREATE TABLE invoices( id int generated always AS identity, total_amount decimal, generated_at timestamp, payed_at timestamp, medical_history_id int references medical_histories(id), primary key(id) )

CREATE TABLE invoice_items( id int generated always AS identity, unit_price decimal, quantity int, total_price decimal, invoice_id int references invoices(id), treatment_id int references treatments(id), )