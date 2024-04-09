SELECT 
    id, 
    active, 
    created_at, 
    updated_at, 
    birthdate, 
    first_name, 
    last_name, 
    email, 
    phone, 
    role, 
    first_access_at, 
    sum_of_rating, 
    count_of_rating 
FROM 
    person 
WHERE 
    block_by_admin = 0 
    AND block_by_panic = 0 
    AND block_by_rating = 0 
    AND block_by_charge = 0;
