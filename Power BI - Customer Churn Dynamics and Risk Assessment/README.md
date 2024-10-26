Customer Churn Analysis Dashboard

Project Overview

This project provides a comprehensive Power BI dashboard to analyze customer churn based on multiple factors, helping decision-makers understand key churn drivers and identify actionable insights. The dashboard is designed to help assess customer retention risks and make informed decisions to improve customer retention rates.

Purpose

The primary goal of this dashboard is to analyze various factors influencing customer churn, such as customer activity, product engagement, and account status. By exploring different scenarios and segments, this tool offers insights into which factors are most correlated with customer attrition, allowing for targeted strategies to retain high-risk customers.

Visualizations

1. Customer Overview
   - Visual: Area Chart
   - Story: Show the distribution of customers over the three geographical regions - France, Germany and Spain.
  
2. Churn by Geographical Region
   - Visual: Bar Chart
   - Story: Identify the regions with the highest churn rates, which can help the manager focus on specific geographies for retention efforts.

3. Churn by Age Group
   - Visual: Histogram
   - Story: Show the distribution of age among churned customers. For instance, are younger or older customers more likely to churn?
  
4. Churn Overview
   - Visual: Donut Chart
   - Story: Visualize the attrition percentage. This information can create urgency for immediate intervention in retention strategies.

5. Churn by Credit Score
   - Visual: Line Chart
   - Story: Depicts the correlation between credit score and customer churn rates. Higher or lower credit scores can be an indicator of financial health and potential churn risk. Understanding this relationship helps identify at-risk customers.

6. Customer Activity VS Credit Card Subscription VS Customer Churn
   - Visual: Stacked Column Chart
   - Story: Visualize how Customer Activity (Active or Inactive) and Credit Card Subscription (Have or Don't Have Credit Card) impact churn rates. This can help the manager understand whether inactive customers or those without a credit card are at a higher risk of leaving.

7. Churn by Customer Tenure
   - Visual: Line Chart
   - Story: Show how customer tenure impacts churn. Do customers with fewer years at the bank churn more? This helps in designing loyalty programs or so for long-tenure customers.
  
8. Churn by Number of Products
   - Visual: Tree Map
   - Story: Show the correlation between number of products used by the customers and customer churn. Do customers with fewer product churn more?

Data Sources

Dataset Name: Bank_Churn.csv

Fields Included:
- CustomerId: A unique identifier for each customer
- CreditScore: A numerical value representing the customer's credit score
- Geography: The country where the customer resides (France, Spain or Germany)
- Gender: The customer's gender (Male or Female)
- Age: The customer's age
- Tenure: The number of years the customer has been with the bank
- NumOfProducts: The number of bank products the customer uses (e.g., savings account, credit card)
- HasCrCard: Whether the customer has a credit card (1 = yes, 0 = no)
- IsActiveMember: Whether the customer is an active member (1 = yes, 0 = no)
- Exited: Whether the customer has churned (1 = yes, 0 = no)
 
Key Insights

- Negative Correlation Between Product Count and Churn: Customers with a higher number of products tend to have a lower churn rate.
- Inactive Members at High Risk: Inactive customers are significantly more likely to churn.
- Demographic Variations: Certain age groups or locations show higher churn tendencies, suggesting targeted strategies may be needed.
- The Bank requires high attention and excellent customer service for new customers at least until the 3rd year of customer acquisition due to high rate of churn at 1st and 3rd year of customer lifecycle.
