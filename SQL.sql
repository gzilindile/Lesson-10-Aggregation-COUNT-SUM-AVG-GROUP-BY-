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
         
        select sum(cast(property_price as bigint)) as kn
        from property_details
        where property_price > '4000000'

--20. What is the total minimum gross monthly income required per province?
          
          select province, sum(cast(min_gross_monthly_income as bigint )) as kk
          from property_details
          group by province


          

 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECTION 3 – AVG Aggregations (10 Questions)

--21. What is the average property price overall?
--22. What is the average property price per province?
--23. What is the average property price per city?
--24. What is the average number of bedrooms per province?
--25. What is the average number of bathrooms per province?
--26. What is the average floor size per province?
--27. What is the average monthly repayment per province?
--28. What is the average once-off cost per province?
--29. What is the average minimum gross monthly income per province?
--30. What is the average property price for properties above R3,000,000?

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SECTION 4 – GROUP BY + Filtering (10 Questions)

--31. Which province has the highest average property price?
--32. Which province has the lowest average property price?
--33. Which city has the highest total property value?
--34. Which city has the lowest average property price?
--35. How many properties per province are priced above R2,000,000?
--36. What is the average floor size per province for properties above R3,000,000?
--37. What is the total property value per province for properties with 3 or more bedrooms?
--38. What is the average monthly repayment per province for properties above R4,000,000?
--39. How many properties per city have parking for 2 or more cars?
--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
