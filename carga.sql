-- -----------------------------------------------------
-- Carga do banco de dados
-- -----------------------------------------------------

INSERT INTO 6319_7627.LOCATION(iso_code, country, continent)
SELECT DISTINCT iso_code, location, continent
FROM sin220.owid_covid;

INSERT INTO 6319_7627.HUMAN_INFO(life_expectancy, human_development_index, population, population_density, median_age, aged_65_older, aged_70_older, cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, obs_date, location_iso_code)
SELECT DISTINCT life_expectancy, human_development_index, population, population_density, median_age, aged_65_older, aged_70_older, cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.ECONOMIC_INFO(gdp_per_capita, extreme_poverty, handwashing_facilities, hospital_beds_per_thousand, obs_date, location_iso_code)
SELECT DISTINCT gdp_per_capita, extreme_poverty, handwashing_facilities, hospital_beds_per_thousand, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.POLICY_RESPONSES(stringency_index, obs_date, location_iso_code)
SELECT DISTINCT stringency_index, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.CONFIRMED_CASES(total_cases, new_cases, new_cases_smoothed, total_cases_per_million, new_cases_per_million, new_cases_smoothed_per_million, obs_date, location_iso_code)
SELECT DISTINCT total_cases, new_cases, new_cases_smoothed, total_cases_per_million, new_cases_per_million, new_cases_smoothed_per_million, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.CONFIRMED_DEATHS(total_deaths, new_deaths, new_deaths_smoothed, total_deaths_per_million, new_deaths_per_million, new_deaths_smoothed_per_million, obs_date, location_iso_code)
SELECT DISTINCT total_deaths, new_deaths, new_deaths_smoothed, total_deaths_per_million, new_deaths_per_million, new_deaths_smoothed_per_million, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.MORTALITY(excess_mortality, excess_mortality_cumulative, excess_mortality_cumulative_absolute, excess_mortality_cumulative_per_million, obs_date, location_iso_code)
SELECT DISTINCT excess_mortality, excess_mortality_cumulative, excess_mortality_cumulative_absolute, excess_mortality_cumulative_per_million, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.HOSPITAL_ICU(icu_patients, icu_patients_per_million, hosp_patients, hosp_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million, weekly_hosp_admissions, weekly_hosp_admissions_per_million, obs_date, location_iso_code)
SELECT DISTINCT icu_patients, icu_patients_per_million, hosp_patients, hosp_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million, weekly_hosp_admissions, weekly_hosp_admissions_per_million, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.TESTS_POSITIVITY(total_tests, new_tests, total_tests_per_thousand, new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, positive_rate, tests_per_case, tests_units, obs_date, location_iso_code)
SELECT DISTINCT total_tests, new_tests, total_tests_per_thousand, new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, positive_rate, tests_per_case, tests_units, date, iso_code
FROM sin220.owid_covid;

INSERT INTO 6319_7627.VACCINATIONS(total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters, new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred, people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred, total_boosters_per_hundred, new_vaccinations_smoothed_per_million, new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred, obs_date, location_iso_code)
SELECT DISTINCT total_vaccinations, people_vaccinated, people_fully_vaccinated, total_boosters, new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred, people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred, total_boosters_per_hundred, new_vaccinations_smoothed_per_million, new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred, date, iso_code
FROM sin220.owid_covid;
