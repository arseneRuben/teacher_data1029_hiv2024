/*4. Les nom complets utilisateurs de la e-pharmacie et la duree moyenne de chacun une fois connecte dans l'applications?*/
use epharmacy;
select concat(u.firstname, ' ' , u.lastname) as Nom,
sec_to_time(AVG(time_to_sec(a.onsite_time))) as temp_moyenne 
from connection_history a 
join users u on a.user_id =u.id
group by u.id;

/*5 Le role de l'utilisateur qui a passer le plus de temps etant connecte dans l'applications?*/
select r.name as Le_role,
sec_to_time(sum(time_to_sec(a.onsite_time))) as temp_total
from connection_history a
join users u on a.user_id = u.id
join roles r on u.role_id = r.id
group by r.id 
order by sum(time_to_sec(a.onsite_time))
DESC limit 1;