-- THE INSTR FUNCTION
-- INSTR, meaning in string, looks for the occurrence of a string inside another string, returning the
-- starting position of the search string within the target string. Unlike the other string functions,
-- INSTR does not return another string, but a number instead. This query displays course
-- descriptions and the position in which the first occurrence of the string 'er', if any, in the
-- DESCRIPTION column appears:
SELECT description, INSTR(description, 'er')
FROM course;

-- The lengt function pag 171
SELECT LENGTH('Hello there')
FROM dual;
