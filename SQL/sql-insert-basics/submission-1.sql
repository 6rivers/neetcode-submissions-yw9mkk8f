CREATE TYPE account_type AS ENUM ('checking', 'savings', 'cd', 'money_market');

CREATE TABLE bank_accounts (
    id INTEGER PRIMARY KEY,
    account_type account_type,
    balance INTEGER
);
-- Do not modify above this line --

INSERT INTO bank_accounts (account_type, balance, id) 
    VALUES ('checking', 1000, 1),
        ('savings', 2000, 2),
        ('cd', 3000, 3),
        ('money_market', 4000, 4);








-- Do not modify below this line --
SELECT * FROM bank_accounts;
