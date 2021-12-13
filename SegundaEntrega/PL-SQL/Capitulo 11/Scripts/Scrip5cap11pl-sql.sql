spool ..\Salidas\cap11_5byexample.txt
set colsep '|=|'
set pagesize 99
set linesize 130
set feedback on
set underline =


set feedback off
SHOW user
SELECT systimestamp from dual;
set feedback on


prompt ***************************************
prompt Alumno:Jesus Alberto Castillo Hernandez
prompt Asignatura: Base de datos
prompt Grupo:2CM12
prompt ***************************************

REM TRY IT YOURSELF
REM Write an anonymous PL/SQL block that finds all the courses that have at least one section that is
REM at its maximum enrollment. If no courses meet that criterion, pick two courses and create that
REM situation for each.


SET SERVEROUTPUT ON
DECLARE
   v_instid_min instructor.instructor_id%TYPE;
   v_section_id_new section.section_id%TYPE;
   v_snumber_recent section.section_no%TYPE := 0;

   -- This cursor determines the courses that have at least
   -- one section filled to capacity.
   CURSOR c_filled IS
      SELECT DISTINCT s.course_no
        FROM section s
       WHERE s.capacity = (SELECT COUNT(section_id)
                             FROM enrollment e
                            WHERE e.section_id = s.section_id);
BEGIN
   FOR r_filled IN c_filled LOOP
      -- For each course in this list, add another section.
      -- First, determine the instructor who is teaching the least
      -- number of courses. If there are more than one instructor
      -- teaching the same number of minimum courses (e.g. if there are 
      -- three instructors teaching 1 course) use any of those
      -- instructors.
      SELECT instructor_id
        INTO v_instid_min
        FROM instructor
       WHERE EXISTS (SELECT NULL
                       FROM section
                     WHERE section.instructor_id = instructor.instructor_id
                     GROUP BY instructor_id
                     HAVING COUNT(*) = (SELECT MIN(COUNT(*))
                                          FROM section
                                         WHERE instructor_id IS NOT NULL
                                        GROUP BY instructor_id)
                    )
         AND ROWNUM = 1;
      
      -- Determine the section_id for the new section
      -- Note that this method would not work in a multi-user
      -- environment. A sequence should be used instead.
      SELECT MAX(section_id) + 1
        INTO v_section_id_new
        FROM section;
      
      -- Determine the section number for the new section
      -- This only needs to be done in the real world if the
      -- system specification calls for a sequence in a parent.
      -- The sequence in parent here refers to the section_no
      -- incrementing within the course_no, and not the section_no 
      -- incrementing within the section_id.
      DECLARE
         CURSOR c_snumber_in_parent IS
            SELECT section_no
            FROM section
           WHERE course_no = r_filled.course_no
         ORDER BY section_no;
      BEGIN
         -- Go from the lowest to the highest section_no and find
         -- any gaps. If there are no gaps make the new section_no 
         -- equal to the highest current section_no + 1.
         
         FOR r_snumber_in_parent IN c_snumber_in_parent LOOP
           EXIT WHEN r_snumber_in_parent.section_no > v_snumber_recent + 1;
           v_snumber_recent := r_snumber_in_parent.section_no + 1;
         END LOOP;
         
         -- At this point, v_snumber_recent will be equal either
         -- to the value preceeding the gap or to the highest
         -- section_no for that course.
      END;
      -- Do the insert.
      INSERT INTO section
        (section_id, course_no, section_no, instructor_id)
      VALUES 
        (v_section_id_new, r_filled.course_no, v_snumber_recent, 
         v_instid_min);
      -- COMMIT;
   END LOOP;
EXCEPTION
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE ('An error has occurred');
END;

/

SPOOL off