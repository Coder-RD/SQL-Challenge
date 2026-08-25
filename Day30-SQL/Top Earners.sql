SELECT 
MAX(months*salary),
Count(*) 
From Employee
WHERE months*salary=(
    select MAX(months*salary)
    From Employee
);
