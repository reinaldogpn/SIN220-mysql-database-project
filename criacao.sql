-- -----------------------------------------------------

-- Projeto desenvolvido para a discplina de Banco de Dados (SIN220)
-- na Universidade Federal de Viçosa (UFV/CRP).

-- Normalização de dataset com dados sobre COVID-19.
-- Ref.: https://github.com/owid/covid-19-data/tree/master/public/data

-- Autores: 

-- Gabriel Sávio (6319)
-- Reinaldo Gonçalves P. Neto (7627)

-- -----------------------------------------------------
-- Criação do banco de dados
-- -----------------------------------------------------

DROP DATABASE IF EXISTS 6319_7627;
CREATE DATABASE 6319_7627;
USE 6319_7627;

-- -----------------------------------------------------
-- Criação das tabelas
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS 6319_7627.LOCATION 
(
  iso_code VARCHAR(10) NOT NULL,
  country VARCHAR(100) NOT NULL,
  continent VARCHAR(15) NOT NULL,
  PRIMARY KEY(iso_code)
);

CREATE TABLE IF NOT EXISTS 6319_7627.HUMAN_INFO
(
	id INT NOT NULL AUTO_INCREMENT,
	life_expectancy DOUBLE,
	human_development_index DOUBLE,
	population DOUBLE,
	population_density DOUBLE,
	median_age DOUBLE,
	aged_65_older DOUBLE,
	aged_70_older DOUBLE,
	cardiovasc_death_rate DOUBLE,
	diabetes_prevalence DOUBLE,
	female_smokers DOUBLE,
	male_smokers DOUBLE,
    obs_date DATE NOT NULL,
	location_iso_code VARCHAR(10) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.ECONOMIC_INFO
(
	id INT NOT NULL AUTO_INCREMENT,
    gdp_per_capita DOUBLE,
	extreme_poverty DOUBLE,
    handwashing_facilities DOUBLE,
    hospital_beds_per_thousand DOUBLE,
    obs_date DATE NOT NULL,
	location_iso_code VARCHAR(10) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.POLICY_RESPONSES
(
	id INT NOT NULL AUTO_INCREMENT,
	stringency_index DOUBLE,
    obs_date DATE NOT NULL,
    location_iso_code VARCHAR(10) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.CONFIRMED_CASES 
(
  id INT NOT NULL AUTO_INCREMENT,
  total_cases DOUBLE,
  new_cases DOUBLE,
  new_cases_smoothed DOUBLE,
  total_cases_per_million DOUBLE,
  new_cases_per_million DOUBLE,
  new_cases_smoothed_per_million DOUBLE,
  obs_date DATE NOT NULL,
  location_iso_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.CONFIRMED_DEATHS 
(
  id INT NOT NULL AUTO_INCREMENT,
  total_deaths DOUBLE,
  new_deaths DOUBLE,
  new_deaths_smoothed DOUBLE,
  total_deaths_per_million DOUBLE,
  new_deaths_per_million DOUBLE,
  new_deaths_smoothed_per_million DOUBLE,
  obs_date DATE NOT NULL,
  location_iso_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.MORTALITY
(
  id INT NOT NULL AUTO_INCREMENT,
  excess_mortality DOUBLE,
  excess_mortality_cumulative DOUBLE,
  excess_mortality_cumulative_absolute DOUBLE,
  excess_mortality_cumulative_per_million DOUBLE,
  obs_date DATE NOT NULL,
  location_iso_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.HOSPITAL_ICU
(
  id INT NOT NULL AUTO_INCREMENT,
  icu_patients DOUBLE,
  icu_patients_per_million DOUBLE,
  hosp_patients VARCHAR(100),
  hosp_patients_per_million VARCHAR(100),
  weekly_icu_admissions VARCHAR(100),
  weekly_icu_admissions_per_million VARCHAR(100),
  weekly_hosp_admissions VARCHAR(100),
  weekly_hosp_admissions_per_million VARCHAR(100),
  obs_date DATE NOT NULL,
  location_iso_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.TESTS_POSITIVITY
(
  id INT NOT NULL AUTO_INCREMENT,
  total_tests DOUBLE,
  new_tests DOUBLE,
  total_tests_per_thousand DOUBLE,
  new_tests_per_thousand DOUBLE,
  new_tests_smoothed DOUBLE,
  new_tests_smoothed_per_thousand DOUBLE,
  positive_rate DOUBLE,
  tests_per_case DOUBLE,
  tests_units VARCHAR(100) NOT NULL,
  obs_date DATE NOT NULL,
  location_iso_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS 6319_7627.VACCINATIONS
(
  id INT NOT NULL AUTO_INCREMENT,
  total_vaccinations DOUBLE,
  people_vaccinated DOUBLE,
  people_fully_vaccinated DOUBLE,
  total_boosters DOUBLE,
  new_vaccinations DOUBLE,
  new_vaccinations_smoothed DOUBLE,
  total_vaccinations_per_hundred DOUBLE,
  people_vaccinated_per_hundred DOUBLE,
  people_fully_vaccinated_per_hundred DOUBLE,
  total_boosters_per_hundred DOUBLE,
  new_vaccinations_smoothed_per_million DOUBLE,
  new_people_vaccinated_smoothed DOUBLE,
  new_people_vaccinated_smoothed_per_hundred DOUBLE,
  obs_date DATE NOT NULL,
  location_iso_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(id)
);

-- -----------------------------------------------------
-- Criação das chaves estrangeiras (foreign keys)
-- -----------------------------------------------------

ALTER TABLE 6319_7627.HUMAN_INFO
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.ECONOMIC_INFO
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.POLICY_RESPONSES
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.CONFIRMED_CASES
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);
    
ALTER TABLE 6319_7627.CONFIRMED_DEATHS
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.MORTALITY
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.HOSPITAL_ICU
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.TESTS_POSITIVITY
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);

ALTER TABLE 6319_7627.VACCINATIONS
ADD FOREIGN KEY(location_iso_code) REFERENCES LOCATION(iso_code);
-- -----------------------------------------------------