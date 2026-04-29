CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT
);


-- TODO: Remove this block --
INSERT INTO users (name) 
  VALUES ('Alex'),
         ('Jane'),
         ('Bob');
-- TODO: Remove this block --
-- cf45f6df-ae80-4e58-9eae-0caf0cf14379
-- a9b13957-0e4a-4a91-9efb-762e9f30c761
-- fc4aee1a-d49c-430e-9c09-01f6cff3b48e


-- Do not modify below this line --
SELECT * FROM users;
