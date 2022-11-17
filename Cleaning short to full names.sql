-- Changing Abbreviation to actual names

select Distinct(SoldAsVacant), count(SoldAsVacant)
from `housing _data_for_cleaning`
group by SoldAsVacant
order by 2;

select SoldAsVacant,
	Case When SoldAsVacant = 'Y' Then 'Yes'
		 When SoldAsVacant = 'N' Then 'No' 
         Else SoldAsVacant 
         End
From `housing _data_for_cleaning`;

Update `housing _data_for_cleaning`
SET SoldAsVacant = 
		 Case When SoldAsVacant = 'Y' Then 'Yes'
		 When SoldAsVacant = 'N' Then 'No' 
         Else SoldAsVacant 
         End;