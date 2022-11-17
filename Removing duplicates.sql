-- Remove Duplicates

With RowNumCTE AS (
select *,
		Row_number() Over (
        Partition by ParcelID,
					 PropertyAddress,
                     SalePrice,
                     SaleDate,
                     LegalReference
                     Order by
						UniqueID )
                        row_num
from `housing _data_for_cleaning`)

select * -- checking all duplicate rows
from RowNumCTE
where row_num > 1
order by PropertyAddress;

-- Deleting all duplicates

DELETE 
from `housing _data_for_cleaning` using `housing _data_for_cleaning`
join RowNumCTE on `housing _data_for_cleaning`.parcelID = RowNumCTE.parcelID
where RowNumCTE.row_num > 1; 