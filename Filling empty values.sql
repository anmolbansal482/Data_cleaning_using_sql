-- Filling the empty values of property address with reference to parcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress -- , IFNULL(a.PropertyAddress,b.PropertyAddress)
from `housing _data_for_cleaning` a
JOIN `housing _data_for_cleaning` b
	on a.ParcelID = b.ParcelID
    AND a.UniqueID != b.UniqueID
    where a.PropertyAddress is not null;
    
Update `housing _data_for_cleaning` a
JOIN `housing _data_for_cleaning` b
	on a.ParcelID = b.ParcelID
    AND a.UniqueID != b.UniqueID
SET a.PropertyAddress = IFNULL(a.PropertyAddress, b.PropertyAddress)
where a.PropertyAddress is null;