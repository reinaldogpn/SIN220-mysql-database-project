-- -----------------------------------------------------
-- Consultas solicitadas
-- -----------------------------------------------------

-- 1. Quantos países estão na base de dados?

SELECT DISTINCT COUNT(*) AS 'Total de Países'
FROM LOCATION
WHERE iso_code NOT LIKE 'OWID%';

-- 2. Qual o total de casos para o mundo no dia 01/07/2022?

SELECT total_cases AS 'Total de casos', obs_date AS 'Data'
FROM CONFIRMED_CASES
WHERE location_iso_code = "OWID_WRL" AND obs_date = "2022-07-01";

-- 3. Quais foram os 10 países com mais casos confirmados no mês de Julho/2022 (ordem descrescente)?

SELECT L.country AS 'País', SUM(CC.new_cases) AS 'Casos'
FROM LOCATION AS L JOIN CONFIRMED_CASES AS CC ON L.iso_code = CC.location_iso_code
WHERE obs_date LIKE '2022-07-%' AND L.iso_code NOT LIKE ('OWID%')
GROUP BY L.country
ORDER BY SUM(CC.new_cases) DESC
LIMIT 10; 

-- 4. Liste os 10 países com maior e os 10 com menor expectativa de vida.

SELECT DISTINCT L.country AS 'País', H.life_expectancy AS 'Expectativa de vida (anos)'
FROM LOCATION AS L JOIN HUMAN_INFO AS H ON L.iso_code = H.location_iso_code
WHERE L.iso_code NOT LIKE ('OWID%') AND H.life_expectancy IS NOT NULL
ORDER BY H.life_expectancy DESC
LIMIT 10;

SELECT DISTINCT L.country AS 'País', H.life_expectancy AS 'Expectativa de vida (anos)'
FROM LOCATION AS L JOIN HUMAN_INFO AS H ON L.iso_code = H.location_iso_code
WHERE L.iso_code NOT LIKE ('OWID%') AND H.life_expectancy IS NOT NULL
ORDER BY H.life_expectancy
LIMIT 10;

-- 5. Liste os continentes contendo o total de casos de cada um em 2022.

SELECT L.continent AS 'Continente', SUM(CC.new_cases) AS 'Total de Casos'
FROM LOCATION AS L JOIN CONFIRMED_CASES AS CC ON L.iso_code = CC.location_iso_code
WHERE CC.obs_date LIKE "2022%" AND L.continent != ''
GROUP BY L.continent
ORDER BY SUM(CC.new_cases) DESC;

-- 6. Liste os países da Europa e inclua as informações do total de pessoas totalmente vacinadas em 2022, em valores absolutos e percentuais. 
-- Ordene o resultado em ordem decrescente pelo percentual de vacinados.

SELECT L.country AS 'País', 
	   V.people_fully_vaccinated AS 'Pessoas Totalmente Vacinadas', 
	   V.people_fully_vaccinated_per_hundred AS 'Pessoas Totalmente Vacinadas (%)'

FROM LOCATION AS L JOIN VACCINATIONS AS V ON L.iso_code = V.location_iso_code
WHERE V.obs_date = '2022-10-31' AND L.continent = 'Europe' 
								AND V.people_fully_vaccinated IS NOT NULL 
                                AND V.people_fully_vaccinated_per_hundred IS NOT NULL

ORDER BY V.people_fully_vaccinated_per_hundred DESC;

-- 7. Liste os países informando o grau de restrições que foram aplicadas à população (há um atributo com este índice (stringency) que engloba 
-- várias medidas como fechamento de escolas, proibição de viagens, . . . ) e o total de novos casos por milhão de habitantes confirmados para o mês de julho/2022.

SELECT L.country AS 'País', 
	   PR.stringency_index AS 'Índice de Rigor', 
	   SUM(CC.new_cases_per_million) AS 'Total de Novos Casos por Milhão'

FROM LOCATION AS L JOIN POLICY_RESPONSES AS PR ON L.iso_code = PR.location_iso_code
				   JOIN CONFIRMED_CASES AS CC ON L.iso_code = CC.location_iso_code

WHERE CC.obs_date LIKE "2022-07%" AND PR.obs_date LIKE "2022-07-31%" 
								  AND L.iso_code NOT LIKE "OWID%"
								  AND PR.stringency_index IS NOT NULL

GROUP BY L.country, PR.stringency_index
ORDER BY L.country;

-- 8. Quais países não possuem informação de pacientes na UTI para o mês de junho/2022?

SELECT DISTINCT L.country AS 'País', H.icu_patients AS 'Pacientes na UTI'
FROM LOCATION AS L JOIN HOSPITAL_ICU AS H ON L.iso_code = H.location_iso_code
WHERE H.obs_date LIKE "2022-07%" AND H.icu_patients = 0 AND L.iso_code NOT LIKE "OWID%";

-- 9. Qual foi o dia com a maior quantidade de novos casos registrados de COVID-19 no Brasil?

SELECT CC.obs_date AS 'Data', CC.new_cases AS 'Novos Casos'
FROM LOCATION AS L JOIN CONFIRMED_CASES AS CC ON L.iso_code = CC.location_iso_code
WHERE CC.location_iso_code = "BRA"
ORDER BY CC.new_cases DESC
LIMIT 1;

-- 10. Qual foi o dia com a maior quantidade de mortes confirmadas por COVID-19 no mundo?

SELECT CD.obs_date AS 'Data', CD.new_deaths AS 'Total de Mortes'
FROM LOCATION AS L JOIN CONFIRMED_DEATHS AS CD ON L.iso_code = CD.location_iso_code
WHERE CD.location_iso_code = "OWID_WRL"
ORDER BY CD.new_deaths DESC
LIMIT 1;
