SELECT user_id, email
FROM Users
WHERE 
    -- Contains exactly one @ symbol
    (LENGTH(email) - LENGTH(REPLACE(email, '@', ''))) = 1
    -- Ends with .com (case-insensitive)
    AND REGEXP_LIKE(email, '\.com$', 'i')
    -- Local part (before @) contains only alphanumeric and underscore
    AND REGEXP_LIKE(
        SUBSTR(email, 1, INSTR(email, '@') - 1),
        '^[A-Za-z0-9_]+$'
    )
    -- Domain part (after @ and before .com) contains only letters
    AND REGEXP_LIKE(
        SUBSTR(
            email, 
            INSTR(email, '@') + 1, 
            INSTR(email, '.com') - INSTR(email, '@') - 1
        ),
        '^[A-Za-z]+$'
    )
ORDER BY user_id;