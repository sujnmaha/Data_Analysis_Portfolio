select *
from PortfolioProject..CovidDeaths
order by 3,4

--select *
--from PortfolioProject..CovidVaccinations
--order by 3,4

select location,date,total_cases,new_cases,total_deaths,population
from PortfolioProject..CovidDeaths
order by 1,2

--Looking at the Total Cases VS Total Deaths

select location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
order by 1,2

--Looking at the Total Cases VS Population
--Shows what percentage of population got Covid

Select location, date, total_cases, population,(total_cases/population)*100 as InfectedPercentage
From PortfolioProject..CovidDeaths
Where location	like '%state%'
Order by 1,2

--Looking at Countries with Highest Infection Rate compared to Population

Select location, population, Max (total_cases) as HighestInfectionCount, Max(total_cases/population)*100 as InfectedPercentage
From PortfolioProject..CovidDeaths
Group by location,population
Order by InfectedPercentage desc

--Looking at the Countries with the highest death count per population

Select location, population, Max(cast(total_deaths as int)) as HighestDeathCount, Max(total_deaths/population)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
Group by location,population
Order by HighestDeathCount desc

--Breaking Things Down by Continent
--Showing continents with Highest Death Counts

Select continent, Max(cast(total_deaths as int)) as HighestDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null
Group by continent
Order by HighestDeathCount desc

--Global Numbers

Select location,sum(cast(total_deaths as int)) as TotalDeaths
From PortfolioProject..CovidDeaths
Where continent is not null
Group by location
Order by TotalDeaths desc

Select SUM(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, Sum(cast(new_deaths as int))/SUM(new_cases)*100 as 
DeathPercentage
From PortfolioProject..CovidDeaths
Where continent is not null
Order by 1,2

--Joining Two Tables

Select *
From PortfolioProject..CovidDeaths Dea
Join PortfolioProject..CovidVaccinations Vac
	On Dea.location = Vac.location
	and Dea.date = Vac.date


Select Dea.continent as Continent, Dea.location, Dea.date,Dea.population,Vac.new_vaccinations,sum(cast(Vac.new_vaccinations as bigint)) Over (Partition by dea.location Order by dea.location,dea.date) as CumulativePeopleVaccinated
From PortfolioProject..CovidDeaths Dea
Join PortfolioProject..CovidVaccinations Vac
On Dea.location=Vac.location
and Dea.date=Vac.date
Where dea.continent is not null
Order by 1,2,3

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, CumulativePeopleVaccinated) 
as
(
Select Dea.continent as Continent, Dea.location, Dea.date,Dea.population,Vac.new_vaccinations,sum(cast(Vac.new_vaccinations as bigint)) Over (Partition by dea.location Order by dea.location,dea.date) as CumulativePeopleVaccinated
From PortfolioProject..CovidDeaths Dea
Join PortfolioProject..CovidVaccinations Vac
On Dea.location=Vac.location
and Dea.date=Vac.date
Where dea.continent is not null
--Order by 1,2,3
)

Select *, (CumulativePeopleVaccinated/Population)*100 as PercentagePeopleVaccinated
From PopvsVac

--Temp Table

Drop Table if exists #PercentagePeopleVaccinated
Create Table #PercentagePeopleVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
CumulativePeopleVaccinated numeric
)
Insert into #PercentagePeopleVaccinated
Select Dea.continent as Continent, Dea.location, Dea.date,Dea.population,Vac.new_vaccinations,sum(cast(Vac.new_vaccinations as bigint)) Over (Partition by dea.location Order by dea.location,dea.date) as CumulativePeopleVaccinated
From PortfolioProject..CovidDeaths Dea
Join PortfolioProject..CovidVaccinations Vac
On Dea.location=Vac.location
and Dea.date=Vac.date
Where dea.continent is not null
--Order by 1,2,3

Select *, (CumulativePeopleVaccinated/Population)*100 as PercentagePeopleVaccinated
From #PercentagePeopleVaccinated

--Creating View to Store Data for Later Visualizations

Use PortfolioProject
Go
Create view PercentagePeopleVaccinated as
Select Dea.continent as Continent, Dea.location, Dea.date,Dea.population,Vac.new_vaccinations,sum(cast(Vac.new_vaccinations as bigint)) Over (Partition by dea.location Order by dea.location,dea.date) as CumulativePeopleVaccinated
From PortfolioProject..CovidDeaths Dea
Join PortfolioProject..CovidVaccinations Vac
On Dea.location=Vac.location
and Dea.date=Vac.date
Where dea.continent is not null
--Order by 1,2,3