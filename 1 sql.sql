SELECT * FROM sakila.actor;

select * from sakila.actor where first_name like "%IAN%" ;
# Here modulus symbo(%) in both sides indicate that the date can be there in both sides.
# LIKE Operator is use when you know half information

select * from sakila.actor where first_name like "IAN%" ;
# if  i put % symbol at the last, it indicates that before 'IAN' there should not be any data.
# if  i put % symbol at the first, it indicates that after 'IAN' there should not be any data.
# 
