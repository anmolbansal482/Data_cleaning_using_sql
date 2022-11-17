-- Updating empty cells to be filled with null values
UPDATE `housing _data_for_cleaning` SET PropertyAddress = NULL WHERE PropertyAddress = '';

select *
from `housing _data_for_cleaning`;	

select *
from `housing _data_for_cleaning`
-- where PropertyAddress is null
order by parcelID;



                      
	
  

