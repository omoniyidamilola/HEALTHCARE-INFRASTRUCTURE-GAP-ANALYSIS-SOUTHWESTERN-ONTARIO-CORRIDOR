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


## DATA CLEANING AND ENGINEERING

The dataset contained inconsistent facility categories, missing source labels, character encoding issues, and irregular city formatting. To improve analytical accuracy, I standardized city names, handled WIN1252 encoding issues, and utilized harmonized ODHF labels to preserve incomplete records.
 
**•	Import Method:** Success using the WIN1252 encoding in the pgAdmin Import tool.
 
**•	Table Structure:** Current table stores everything as TEXT, to bypass the initial "Permission Denied" and data type errors.
 
**1. Data Source Tracking**
The vast majority of records in this dataset are tracked at the Provincial level, but there is a distinct mix of municipal and professional oversight.

**•	Provincial Government (Ontario):** Tracks the largest share with 2,695 facilities.
 
**• Federal/Professional Bodies:** Organizations like the Public Health Agency of Canada (682) and the Canadian Institute for Health Information (474) provide a significant layer of professional tracking.

**•Municipal Tracking:** While smaller, municipal bodies like the City of Moncton (74) and Municipality of Québec (5) track localized data that might otherwise be missed by provincial systems.

**2. The Power of Simplification**

The transformation from raw data to the harmonized ODHF format is a massive exercise in data reduction and clarity.

**Categorical Reduction:** I reduced 174 inconsistent source facility types into 3 harmonized healthcare categories, removing approximately 97% of categorical complexity. Additionally, I recovered 19.2% of records with missing source labels by using the ODHF harmonized categories instead of deleting incomplete records.

 
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
•	Increase ambulatory healthcare investment in high-growth municipalities.

• Improve healthcare accessibility in lower-density areas such as Woodstock outskirts.

• Expand decentralized healthcare services to reduce dependency on London hospitals.

•	Prioritize preventative and outpatient care infrastructure alongside long-term care expansion.

## CONCLUSION
This project demonstrates how data engineering, SQL analysis, and Power BI visualization can support healthcare infrastructure planning and public health decision-making. By harmonizing fragmented healthcare categories and identifying regional service gaps, the analysis provides actionable insights for strategic healthcare investment across Southwestern Ontario.
