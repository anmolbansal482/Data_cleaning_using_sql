

select PropertyAddress
from `housing _data_for_cleaning`;

select 
SUBSTRING(PropertyAddress, 1, Locate(',', PropertyAddress) -1 ) as Address,
	SUBSTRING(PropertyAddress, Locate(',', PropertyAddress) +1) as City
from `housing _data_for_cleaning`;

Alter table `housing _data_for_cleaning`
Add PropertySplitAddress varchar(255);

Update `housing _data_for_cleaning`
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, Locate(',', PropertyAddress) -1);


Alter table `housing _data_for_cleaning`
Add PropertySplitCity varchar(255);

Update `housing _data_for_cleaning`
SET PropertySplitCity = SUBSTRING(PropertyAddress, Locate(',', PropertyAddress) +1);

-- Splitting OwnerAddredd data

select 
SUBSTRING(OwnerAddress, 1, Locate(',', OwnerAddress) -1 ) as OwnerAddress,
	SUBSTRING(OwnerAddress, Locate(',', OwnerAddress) +1, 15) as City,
		SUBSTRING(OwnerAddress, Locate(',', OwnerAddress) +17) as State
from `housing _data_for_cleaning`;

Alter table `housing _data_for_cleaning`
Add OwnerSplitAddress varchar(255);

Update `housing _data_for_cleaning`
SET OwnerSplitAddress = SUBSTRING(OwnerAddress, 1, Locate(',', OwnerAddress) -1);

Alter table `housing _data_for_cleaning`
Add OwnerSplitCity varchar(255);

Update `housing _data_for_cleaning`
SET OwnerSplitCity = SUBSTRING(OwnerAddress, Locate(',', OwnerAddress) +1, 15);

Alter table `housing _data_for_cleaning`
Add OwnerSplitState varchar(255);

Update `housing _data_for_cleaning`
SET OwnerSplitState = SUBSTRING(OwnerAddress, Locate(',', OwnerAddress) +17);

/* Splitting city and address using parse

select 
parsename(replace(OwnerAddress, ',', '.') ,1)
from `housing _data_for_cleaning`;

Add OwnerSplitAddress varchar(255);

Update `housing _data_for_cleaning`
SET OwnerSplitAddress = SUBSTRING(OwnerAddress, 1, Locate(',', OwnerAddress) -1);

Alter table `housing _data_for_cleaning`
Add OwnerSplitCity varchar(255);

Update `housing _data_for_cleaning`
SET OwnerSplitCity = SUBSTRING(OwnerAddress, Locate(',', OwnerAddress) +1, 15);

Alter table `housing _data_for_cleaning`
Add OwnerSplitState varchar(255);

Update `housing _data_for_cleaning`
SET OwnerSplitState = SUBSTRING(OwnerAddress, Locate(',', OwnerAddress) +17); */