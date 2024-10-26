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
   - Visual: 

Data Sources
Dataset Name: Bank_Churn.csv

Fields Included:
- Customer ID: Unique identifier for each customer
- IsActiveMember: Indicates if the customer is actively using services
- HasCrCard: Shows if the customer holds a credit card
- NumOfProducts: The number of products a customer has
- Churn: Indicates if the customer has churned or not

Key Insights
- Negative Correlation Between Product Count and Churn: Customers with a higher number of products tend to have a lower churn rate.
- Inactive Members at High Risk: Inactive customers are significantly more likely to churn, especially those without a credit card.
- Demographic Variations: Certain age groups or locations show higher churn tendencies, suggesting targeted strategies may be needed.
