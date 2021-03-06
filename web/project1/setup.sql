CREATE TABLE users
(
    user_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
    password varchar(255) NOT NULL,
    email varchar(255) UNIQUE NOT NULL
);

create TABLE category
(
    category_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
    category_name varchar(255) UNIQUE NOT NULL,
    amount_budgeted float NOT NULL,
    user_id int REFERENCES users (user_id)
);

create TABLE transactions
(
    transaction_id SERIAL UNIQUE NOT NULL PRIMARY KEY,
    transaction_date date NOT NULL,
    cost float NOT NULL,
    business_name varchar(255) NOT NULL,
    category_id int REFERENCES category (category_id),
    user_id int REFERENCES users (user_id)

);

insert into users
    (password, email)
    VALUES (
        'myPass', 'email@gmail.com'
);

insert into category
    (category_name, amount_budgeted)
    VALUES (
        'rent', 1000
);

insert into category
    (category_name, amount_budgeted)
    VALUES (
        'food', 300
);

insert into transactions
    (transaction_date, cost, business_name, category_id)
    VALUES (
        CURRENT_DATE, 200, 'landlord', (SELECT category_id 
                                        FROM category
                                        WHERE category_name = 'rent')
);

UPDATE users 
SET email = 'mike@gmail.com'
WHERE user_name = 'My username';

insert into transactions
    (transaction_date, cost, business_name, category_id)
    VALUES (
        CURRENT_DATE, 600, 'new landlord', (SELECT category_id 
                                        FROM category
                                        WHERE category_name = 'rent')
);
