-- Власники з послідовністю букв "am"
select * from user_profiles where name like "%am%";

-- Найбільша витрата Audi
select cars.id as car_id, car_brands.title as brand, MAX(expenses.totalCost) as max_expense from cars
inner join car_brands on cars.carBrandId = car_brands.id
inner join expenses on cars.id = expenses.carId where car_brands.title = 'Audi' group by  cars.id, car_brands.title order by max_expense desc
limit 1;

-- Моделі Audi та BMW
select car_brands.id as car_id, COUNT(car_models.id) as count_models from car_models
inner join car_brands on car_models.carBrandId = car_brands.id where car_brands.title in ('Audi', 'BMW') group by car_brands.id;

-- Car model, car_brand, user_count
select car_brands.title as car_brand, car_models.title as car_models, count(distinct userId) as user_count from cars
inner join car_brands on cars.carBrandId = car_brands.id
inner join car_models on cars.carModelId = car_models.id
group by car_brands.title, car_models.title;

-- Імена юзерів, у яких є машини
select distinct name from user_profiles
inner join cars on user_profiles.id = cars.userid;