-- Extract info on pets names and owner names side-by-side
SELECT p.name, o.name 
FROM pets p, owners o
WHERE p.ownerid = o.ownerid;

-- Find out which pets from this clinic had procedures performed
SELECT p.petid, p.name
FROM pets p, procedurehistory pr
WHERE p.petid = pr.petid;

-- Another way for answer number 2 
SELECT petid, name
FROM pets
WHERE petid IN (SELECT petid FROM Procedurehistory);

-- Match up all procedures performed to their descriptions
SELECT ph.proceduretype, pd.proceduresubcode, description
FROM procedurehistory ph, proceduredetails pd
WHERE ph.proceduretype = pd.proceduretype
AND ph.proceduresubcode = pd.proceduresubcode
ORDER BY 3;

-- Extract a table of individual costs incurred by owners of pets from the clinic
SELECT o.name, o.ownerid, pd.price
FROM owners o, proceduredetails pd, pets p, procedurehistory ph
WHERE p.ownerid= o.ownerid
AND p.petid = ph.petid 
AND ph.proceduretype = pd.proceduretype
AND ph.proceduresubcode = pd.proceduresubcode
ORDER BY 1,2;


