--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)

--SECTION 1 – COUNT Aggregations (10 Questions)

--1. How many total properties are in the database?

  select count (*) as Num_Of_Properties
  from property_details

--2. How many properties are listed in each province?

   select province,count (*) as  Property_Per_Province 
   from property_details
   group by province

--3. How many properties are listed in each city?
 select city,count (*) as Property_Per_City
   from property_details
   group by city
--4. How many properties have more than 2 bedrooms?

    select count (*)  as Property_With_2Bedrooms
    from property_details
    where BEDROOMS > 2
    
--5. How many properties have 2 or more bathrooms?
    select count (*)  as Property_With_2_Or_More_Bedrooms
    from property_details
    where BEDROOMS >= 2
    
--6. How many properties have parking for at least 2 cars?
   
   select count (*) as Property_With_Atleast2_Cars
    from property_details
    where parking =2

--7. How many properties are priced above R3,000,000?
      
      select count (*) as Property_Above_3m
      from property_details
      where PROPERTY_PRICE > '3000000'

--8. How many properties are in Gauteng?
        
        select count (*) as Properties_In_Gauteng 
        from property_details
        where PROVINCE = 'gauteng' 

--9. How many properties per province have floor size greater than 200?
      
      select province, count (*) as  Property_FloorSize_Greater_than_200_per_Province
      from property_details
      where FLOOR_SIZE >'200'
      group by province


--10. How many distinct provinces are in the table?

   select count (distinct province) as ProvinceCount 
   from property_details
   
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECTION 2 – SUM Aggregations (10 Questions)

--11. What is the total value of all properties combined?
   select SUM(Cast(property_price  as bigint)) as Totalvalue 
   from property_details

  
--12. What is the total property value per province?  
  
       SELECT province,
       SUM(CAST(property_price AS BIGINT)) AS TotalValue
       FROM property_details
       GROUP BY province


--13. What is the total property value per city?
     select city, sum(cast(property_price as bigint)) as total_property_value_per_city
     from property_details
     group by city


--14. What is the total monthly repayment for all properties?
       select sum(cast(monthly_repayment as bigint)) as total_monthly_repayment_for_all_properties
       from property_details

--15. What is the total monthly repayment per province?
       select province, sum(cast(monthly_repayment as bigint)) as  total_monthly_repayment_per_province
       from property_details
       group by province

--16. What is the total once-off cost for all properties?
     select top 2 * from property_details
       select sum(cast(total_once_off_costs as bigint)) as total_once_off_cost_for_all_properties
       from property_details


--17. What is the total once-off cost per province?
         
         select province, sum(cast(total_once_off_costs as bigint)) as total_once_off_cost_per_province
         from property_details
         group by province

--18. What is the total property value for Gauteng?
     

     select  sum(cast(property_price as bigint )) as total_property_value_for_Gauteng
     from property_details
     where province ='gauteng'

--19. What is the total property value for properties priced above R4,000,000?
         
        select sum(cast(property_price as bigint)) as TotalValue 
        from property_details
        where property_price > '4000000'

--20. What is the total minimum gross monthly income required per province?
          
          select province, sum(cast(min_gross_monthly_income as bigint )) as RequiredIncome
          from property_details
          group by province


          

 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECTION 3 – AVG Aggregations (10 Questions)

--21. What is the average property price overall?
      
      select avg(cast (property_price as decimal(18,2))) as Overall_price 
      from property_details

     
--22. What is the average property price per province?
       select province, avg(cast(property_price as decimal (18,2))) as avg_prty
       from property_details
       group by PROVINCE

--23. What is the average property price per city?
       select city,avg(cast(property_price as decimal (18,2))) as avg_cty
       from property_details 
       group by city 

--24. What is the average number of bedrooms per province?
        select province,avg(cast(bedrooms as decimal (18,2))) as average_number_of_bedrooms_per_province
        from property_details
        group by PROVINCE

--25. What is the average number of bathrooms per province?
       select province,avg(cast(bathrooms as decimal (18,2))) as average_number_of_bathrooms_per_province
        from property_details
        group by PROVINCE
--26. What is the average floor size per province?
        select province,avg(cast(floor_size as decimal (18,2))) as average_floor_size_per_province
        from property_details
        group by PROVINCE
        select top 1 * from property_details
--27. What is the average monthly repayment per province?
        select province,avg(cast(monthly_repayment as decimal (18,2))) as average_monthly_repayment_per_province
        from property_details
        group by PROVINCE
--28. What is the average once-off cost per province?
        select province,avg(cast(Total_Once_off_Costs as decimal (18,2))) as average_once_off_cost_per_province
        from property_details
        group by PROVINCE
--29. What is the average minimum gross monthly income per province?
        select province,avg(cast(Min_Gross_Monthly_Income as decimal (18,2))) as average_minimum_gross_monthly_income_per_province
        from property_details
        group by PROVINCE
--30. What is the average property price for properties above R3,000,000?
       select avg(cast(property_price as decimal (18,2))) as average_propertyprice_for_properties_above_3m
       from property_details
       where PROPERTY_PRICE > '3000000'
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECTION 4 – GROUP BY + Filtering (10 Questions)

--31. Which province has the highest average property price?
      select province, avg(cast(property_price as decimal  (18,2))) as highest_average_property_price
      from property_details
      group by PROVINCE 
      order by highest_average_property_price desc
      
--32. Which province has the lowest average property price?
      select province, avg(cast(property_price as decimal  (18,2))) as Lowest_average_property_price
      from property_details
      group by PROVINCE 
      order by Lowest_average_property_price asc

--33. Which city has the highest total property value?
         select  top 1 city, sum(cast(property_price as decimal(18,2))) as Highest_total_property_value
         from property_details
         group by city 
         order by Highest_total_property_value desc


--34. Which city has the lowest average property price?
         select  top 1 city, avg(cast(property_price as decimal(18,2))) as Lowest_total_property_value
         from property_details
         group by city 
         order by Lowest_total_property_value asc 

--35. How many properties per province are priced above R2,000,000?
      select province, count(*) as properties_per_province
      from property_details
      where property_price > 2000000
      group by PROVINCE

       
--36. What is the average floor size per province for properties above R3,000,000?
        select province, avg(cast(floor_size as decimal (18,2))) as average_floor_size_per_province
        from property_details
        where property_price > 3000000
        group by PROVINCE
     
--37. What is the total property value per province for properties with 3 or more bedrooms?
      select province, sum(cast(property_price as bigint)) as total_property_value
      from property_details
      where BEDROOMS >=3
      group by PROVINCE


--38. What is the average monthly repayment per province for properties above R4,000,000?
      select province, avg(cast(Monthly_Repayment as decimal(18,2))) as avg_monthly_repayment
      from property_details
      where PROPERTY_PRICE > 4000000
      group by PROVINCE


--39. How many properties per city have parking for 2 or more cars?
         select city, count(*)
         from property_details
         where PARKING >=2
         group by city

--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
       select province, avg(cast(Min_Gross_Monthly_Income as decimal(18,2))) as avg_min_gross_income
       from property_details
       where PROPERTY_PRICE > 5000000
       group by province

