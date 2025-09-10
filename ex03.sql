select 
student_name,
score,
case 
	when score >= 90 then 'A'
    when score >= 80 then 'B'
    when score >= 70 then 'C'
    else 'F'
END as grade
from students;