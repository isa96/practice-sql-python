# 1623. All Valid Triplets that can represent a country

SELECT a.student_name AS member_A, b.student_name AS member_B, c.student_name AS member_C
FROM schoolA a, schoolB b, schoolC c
WHERE a.student_name != b.student_name AND a.student_name != c.student_name AND b.student_name != c.student_name
AND a.student_id != b.student_id AND a.student_id != c.student_id AND b.student_id != c.student_id
