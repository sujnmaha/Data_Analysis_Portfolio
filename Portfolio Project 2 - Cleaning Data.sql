--Cleaning Data in SQL--

Select *
From PortfolioProject..NashvilleHousing

--Standardizing Date Format

Select SaleDateConverted
From PortfolioProject..NashvilleHousing

Update PortfolioProject..NashvilleHousing
Set SaleDateConverted = CONVERT(Date,SaleDate)

--Populate Property Address Data

Select *
From PortfolioProject..NashvilleHousing
Where PropertyAddress is null

--To update in a

Update a
Set Propertyaddress=ISNULL(a.propertyaddress,b.propertyaddress)
From PortfolioProject..NashvilleHousing a
Join PortfolioProject..NashvilleHousing b
On a.ParcelID=b.ParcelID
And a.[UniqueID ]<>b.[UniqueID ]
Where a.PropertyAddress is null

Select a.[UniqueID ],a.ParcelID,a.PropertyAddress,b.ParcelID,b.PropertyAddress
From PortfolioProject..NashvilleHousing a
Join PortfolioProject..NashvilleHousing b
On a.ParcelID=b.ParcelID
And	a.[UniqueID ]<>b.[UniqueID ]

--Seggregating PropertyAddress to Address, City and State

Alter TABLE PortfolioProject..NashvilleHousing
Add SplittedPropertyAddress nvarchar (255);

Update PortfolioProject..NashvilleHousing
Set SplittedPropertyAddress = Substring (PropertyAddress, 1, Charindex (',',PropertyAddress)-1)

Alter Table PortfolioProject..NashvilleHousing
Add SplittedPropertyCity nvarchar (255);

Update PortfolioProject..NashvilleHousing
Set SplittedPropertyCity = SUBSTRING (PropertyAddress, Charindex (',',PropertyAddress)+1, Len (PropertyAddress))

Select PropertyAddress,SplittedPropertyAddress,SplittedPropertyCity
From PortfolioProject..NashvilleHousing

--Using Parsename to Split

Select 
Parsename (REPLACE(OwnerAddress,',','.'),3),
Parsename (REPLACE(OwnerAddress,',','.'),2),
Parsename (REPLACE(OwnerAddress,',','.'),1)
From PortfolioProject..NashvilleHousing

Alter Table PortfolioProject..NashvilleHousing
Add OwnerSplitAddress nvarchar (255);

Update PortfolioProject..NashvilleHousing
Set OwnerSplitAddress = PARSENAME(Replace (OwnerAddress, ',','.'),3)

Alter Table PortfolioProject..NashvilleHousing
Add OwnerSplitCity nvarchar (255);

Update PortfolioProject..NashvilleHousing
Set OwnerSplitCity = PARSENAME(Replace (OwnerAddress,',','.'),2)

Alter Table PortfolioProject..NashvilleHousing
Add OwnerSplitState nvarchar (255);

Update PortfolioProject..NashvilleHousing
Set OwnerSplitState = PARSENAME (REPLACE (OwnerAddress, ',','.'), 1)

Select OwnerAddress, OwnerSplitAddress, OwnerSplitCity, OwnerSplitState
From PortfolioProject..NashvilleHousing

--Change Y and N to Yes and No

Select SoldAsVacant,
Case When SoldAsVacant = 'Y' Then 'Yes'
	 When SoldAsVacant ='N' Then 'No'
	 Else SoldAsVacant
	 End
From PortfolioProject..NashvilleHousing

Update PortfolioProject..NashvilleHousing
Set SoldAsVacant = Case When SoldAsVacant = 'Y' Then 'Yes'
						When SoldAsVacant ='N' Then 'No'
						Else SoldAsVacant
						End

Select Distinct(SoldAsVacant), COUNT(SoldAsVacant) as Count
From PortfolioProject..NashvilleHousing
Group by SoldAsVacant
Order by 2

--Delete Unused Columns

Alter Table PortfolioProject..NashvilleHousing
Drop Column OwnerAddress,PropertyAddress

Select *
From PortfolioProject..NashvilleHousing

Alter Table PortfolioProject..NashvilleHousing
Drop Column SaleDate