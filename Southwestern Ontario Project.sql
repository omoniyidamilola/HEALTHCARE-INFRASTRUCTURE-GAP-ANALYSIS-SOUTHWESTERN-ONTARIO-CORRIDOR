CREATE TABLE odhf_facility (
    index TEXT,                     
    facility_name TEXT,
    source_facility_type TEXT,       
    odhf_facility_type TEXT,         
    provider TEXT,
    unit TEXT,
    street_no TEXT,
    street_name TEXT,
    postal_code TEXT,
    city TEXT,
    province TEXT,
    source_format_str_address TEXT,  
    CSDname TEXT,
    CSDuid TEXT,
    Pruid TEXT,
    latitude TEXT,
    longitude TEXT
);

-- Check total table
SELECT *
FROM odhf_facility;

-- Check the total row count
SELECT count(*) FROM odhf_facility;

--  Look at a sample of the data
SELECT facility_name, city, province, postal_code 
FROM odhf_facility
LIMIT 10;

--Southwestern Ontario data
SELECT facility_name, city, province, latitude::float, longitude::float, odhf_facility_type 
FROM odhf_facility
WHERE lower(city) IN ('london', 'waterloo', 'kitchener', 'cambridge', 'woodstock', 'guelph');

-- This creates a "view" that treats coordinates as actual numbers
CREATE VIEW odhf_maps AS
SELECT 
    facility_name,
    CAST(latitude AS NUMERIC) as lat,
    CAST(longitude AS NUMERIC) as lon
FROM odhf_facility
WHERE latitude IS NOT NULL AND latitude != '';

--Distribution of healthcare facilities by province
SELECT province, count(*) 
FROM odhf_facility
GROUP BY province 
ORDER BY count(*) DESC;

--The Facility Mix ratio for the regions:
SELECT 
    city, 
    odhf_facility_type, 
    COUNT(*) as facility_count
FROM odhf_facility
WHERE LOWER(city) IN ('london', 'waterloo', 'kitchener', 'cambridge', 'woodstock', 'guelph')
GROUP BY city, odhf_facility_type
ORDER BY city, facility_count DESC;


--Access and Equity (Hospital Gaps)
CREATE OR REPLACE VIEW healthcare_gap AS
SELECT 
    city, 
    SUM(CASE WHEN odhf_facility_type = 'Hospitals' THEN 1 ELSE 0 END) as hospital_count,
    SUM(CASE WHEN odhf_facility_type = 'Ambulatory health care services' THEN 1 ELSE 0 END) as ambulatory_count,
    COUNT(*) as total_facilities
FROM odhf_facility
WHERE LOWER(city) IN ('london', 'waterloo', 'kitchener', 'cambridge', 'woodstock', 'guelph')
GROUP BY city;

--Operational Landscape (Facility Mix %)

CREATE OR REPLACE VIEW facility_mix_stat AS
SELECT 
    odhf_facility_type,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) as percentage_of_total
FROM odhf_facility
WHERE LOWER(city) IN ('london', 'waterloo', 'kitchener', 'cambridge', 'woodstock', 'guelph')
GROUP BY odhf_facility_type;

--Strategic Investment (Investment Priority)
CREATE OR REPLACE VIEW investment_opportunity AS
SELECT 
    city,
    COUNT(*) as ambulatory_count,
    RANK() OVER (ORDER BY COUNT(*) ASC) as investment_priority 
FROM odhf_facility
WHERE LOWER(city) IN ('london', 'waterloo', 'kitchener', 'cambridge', 'woodstock', 'guelph')
AND odhf_facility_type = 'Ambulatory health care services'
GROUP BY city;

--I designed these SQL Views to serve as a semantic layer. 
--This ensures that my Power BI visualizations stay updated automatically,
--if the underlying data changes, while keeping the logic centralized in the database rather than hidden inside the visualization tool.

CREATE EXTENSION IF NOT EXISTS cube;
CREATE EXTENSION IF NOT EXISTS earthdistance;

-- Query to find facilities > 10km from any hospital
WITH facility_distances AS (
    SELECT 
        a.facility_name, 
        a.city, 
        MIN(point(a.longitude::float, a.latitude::float) <@> point(h.longitude::float, h.latitude::float)) as distance_to_hospital
    FROM odhf_facility a
    CROSS JOIN (
        SELECT latitude, longitude 
        FROM odhf_facility
        WHERE odhf_facility_type = 'Hospitals'
    ) h
    WHERE a.odhf_facility_type != 'Hospitals'
    AND LOWER(a.city) IN ('london', 'waterloo', 'kitchener', 'cambridge', 'woodstock', 'guelph')
    GROUP BY a.facility_name, a.city, a.latitude, a.longitude
)
SELECT * 
FROM facility_distances
WHERE distance_to_hospital > 6.21
ORDER BY distance_to_hospital DESC;

SELECT * FROM public.odhf_maps WHERE latitude = 'latitude';