# HEALTHCARE-INFRASTRUCTURE-GAP-ANALYSIS-SOUTHWESTERN-ONTARIO-CORRIDOR
This project analyzes healthcare facility distribution across the London-Waterloo corridor using the Open Database of Healthcare Facilities (ODHF). The analysis focuses on identifying regional service gaps, healthcare accessibility challenges, and infrastructure imbalance across high-growth municipalities in Southwestern Ontario.



## BUSINESS PROBLEM

The London-Waterloo corridor combines a major healthcare hub (London) with rapidly growing municipalities such as Kitchener, Waterloo, Cambridge, Woodstock, and Guelph. This project evaluates whether healthcare infrastructure is scaling effectively with regional growth.

## Why did I choose these cities?
This corridor was selected because it combines a major healthcare hub (London) with rapidly growing municipalities in the Waterloo Region, enabling comparative infrastructure analysis across urban growth patterns. 

## PROJECT OBJECTIVES

 •	Analyze healthcare facility concentration across Southwestern Ontario.

 •	Identify hospital accessibility gaps and underserved areas.

 •	Compare the ratio of hospitals to nursing and ambulatory facilities.

 •	Evaluate the effectiveness of ODHF harmonized healthcare categories.

 •	Support strategic healthcare investment recommendations.

## TECH STACK

•	Python (Pandas, Matplotlib): Used for advanced data cleaning, handling lowercase city standardization, and exploratory data analysis (EDA).
•	PostgreSQL: Engineered a relational database schema, handled complex WIN1252 encoding for data integrity, and built a Semantic Layer using SQL Views.
•	Data Governance: Reduced categorical complexity by 97%, mapping 174 raw, inconsistent source types into 3 standardized ODHF categories.
•	Power BI (Dashboarding): Dashboarding and geographic visualization.

## DATA DICTIONARY

This data dictionary describes the variables contained within the ODHF. The database is provided in a CSV format. Each facility is listed per row and its attributes provided in columns. The corresponding column variables are described in the data dictionary below. 

### Healthcare Facility Variables 

## Index   —                         Unique serial number for each facility. Supplemental entries to version 1.1 are                   identified by the prefix “S” followed by an assigned serial number 
Facility Name   —          Healthcare facility name 
Source Facility Type    —   Regional health authority assigned healthcare facility type
ODHF Facility Type     —     Value determined using the classification criteria used 
Provider    —                       The identity or name of the data provider 
Unit Number   —                Civic unit or suite number 
Street Number    —             Civic Street number 
Street Name   —               Description Civic Street name (type and direction) 
Postal Code   —              Civic postal code 
City    —                      City name 
Province/Territory   —    Province or territory name 
Source-Format Street Address   —   Street address in the source data
CSD Name    —   Census subdivision name 
CSDuid —    Census subdivision unique identifier 
PRuid   —   Province or territory unique identifier 
Latitude   —   Latitude 
Longitude   —   Longitude

## DATA CLEANING AND ENGINEERING

The dataset contained inconsistent facility categories, missing source labels, character encoding issues, and irregular city formatting. To improve analytical accuracy, I standardized city names, handled WIN1252 encoding issues, and utilized harmonized ODHF labels to preserve incomplete records.
 
•	Import Method: Success using the WIN1252 encoding in the pgAdmin Import tool.
 
•	Table Structure: Current table stores everything as TEXT, to bypass the initial "Permission Denied" and data type errors.
 
1. Data Source Tracking
The vast majority of records in this dataset are tracked at the Provincial level, but there is a distinct mix of municipal and professional oversight.
•	Provincial Government (Ontario): Tracks the largest share with 2,695 facilities.
 

Federal/Professional Bodies: Organizations like the Public Health Agency of Canada (682) and the Canadian Institute for Health Information (474) provide a significant layer of professional tracking.

Municipal Tracking: While smaller, municipal bodies like the City of Moncton (74) and Municipality of Québec (5) track localized data that might otherwise be missed by provincial systems.

* 2. The Power of Simplification

The transformation from raw data to the harmonized ODHF format is a massive exercise in data reduction and clarity.
Categorical Reduction: I reduced 174 inconsistent source facility types into 3 harmonized healthcare categories, removing approximately 97% of categorical complexity. Additionally, I recovered 19.2% of records with missing source labels by using the ODHF harmonized categories instead of deleting incomplete records.

 
 

## SOLUTIONS
7,034 total facility records analyzed
 
 
## 1)	What is the ratio of hospitals to nursing homes or ambulatory services in southwestern Ontario?
    
1:9 hospital-to-residential care facility ratio
This represents a 1:9 ratio, meaning there are 9 residential care facilities for every 1 hospital in the region.
This 1: 9 ratio is a critical metric for strategic planning. It indicates that the healthcare infrastructure in Southwestern Ontario is designed to manage a high volume of chronic and geriatric care locally, while relying on a much smaller number of centralized hospitals for specialized surgery and emergency medicine.


## 2)	Access and Equity: Where are the Gaps?
 
 
•	Service Variety: There is a stark "Hospital Gap" in Waterloo. The analysis identified a potential healthcare access imbalance in Waterloo, where residential and ambulatory services exist without corresponding acute care infrastructure. While Waterloo lacks a hospital, it has a specialized mix of ambulatory services, including the Canadian Mental Health Association and Lutherwood Children's Mental Health Services. This indicates that mental health services are centralized in Waterloo, while physical trauma care is shifted to Kitchener.
•	Geographic Density: London identified as the dominant regional healthcare hub. In the Waterloo Region, Kitchener (38) has nearly double the facilities of its neighbor Waterloo. This suggests that while Waterloo is a tech hub, its healthcare infrastructure relies heavily on Kitchener and Cambridge core. 

 
 


## 4)	  Strategic Planning: Where should we invest?
•	Location Optimization: Waterloo represents the highest "room" for investment. Given its high count of residential care facilities (13) but lack of a hospital, there is a strategic opportunity for a specialized geriatric ambulatory clinic or a small-scale urgent care centre.
•	Resource Allocation: The distribution of Nursing and residential care suggests that the region's current resource allocation is heavily reactive to an aging demographic.
Waterloo Ambulatory Services Breakdown
While Waterloo lacks a hospital, its ambulatory services are highly specialized, focusing heavily on mental health and community elderly support:

Mental Health Hub: Waterloo hosts the Canadian Mental Health Association (CMHA) and Lutherwood Children's Mental Health Services. This suggests that while London handles physical trauma (Hospitals), Waterloo acts as a specialized center for mental healthcare.

Elderly Support Focus: There are several "Community Support Services" (like the Friendship Group for Seniors and r.a.i.s.e. Home Support). 

Public Health: The Region of Waterloo Public Health office is located here, emphasizing its role as an administrative and preventative health center rather than an acute care center.

## Regional Analysis
•	London serves as the primary healthcare hub with the highest overall facility concentration.
•	Waterloo contains strong ambulatory and mental health services but no hospitals in this dataset.
•	Nursing and residential care facilities significantly outnumber hospitals across the region.
•	Woodstock and Cambridge outskirts show lower healthcare density and greater hospital travel distance.
•	The healthcare infrastructure is heavily weighted toward long-term and residential care services.

## KEY INSIGHTS
The analysis identified a healthcare infrastructure imbalance across the Southwestern Ontario corridor. While London functions as the region’s acute care anchor, municipalities such as Waterloo depend heavily on nearby cities for hospital-level services.

Waterloo demonstrated strong specialization in mental health and community support services, while Woodstock displayed lower healthcare density and reduced accessibility to hospital infrastructure.

## STRATEGIC RECOMMENDATIONS
Increase ambulatory healthcare investment in high-growth municipalities.

Improve healthcare accessibility in lower-density areas such as Woodstock outskirts.

Expand decentralized healthcare services to reduce dependency on London hospitals.

Prioritize preventative and outpatient care infrastructure alongside long-term care expansion.

## CONCLUSION
This project demonstrates how data engineering, SQL analysis, and Power BI visualization can support healthcare infrastructure planning and public health decision-making. By harmonizing fragmented healthcare categories and identifying regional service gaps, the analysis provides actionable insights for strategic healthcare investment across Southwestern Ontario.

