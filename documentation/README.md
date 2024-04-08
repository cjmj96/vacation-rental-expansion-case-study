# **Case Study: Expand the vacation rental market**

![airbnb-logo](https://i.ibb.co/h9RwFNk/airbnb.png)

<a href="https://www.flaticon.com/free-icons/airbnb" title="airbnb icons">Airbnb icons created by riajulislam - Flaticon</a>


## **Table of content**

- [1. Introduction](#introduction)
- [2. Scenario](#scenario)
- [3. Background](#background)
- [4. Business task](#business-task)
- [5. Ask](#ask)
- [6. Prepare](#prepare)
  - [6.1 Describe data](#describe-data)
  - [6.2 Check data credibility](#check-data-credibility)
  - [6.3 Understand data limitations](#understand-data-limitation)
  - [6.4 Format data](#format-data)
- [7. Process](#process)
  - [7.1 Explore the data](#explore-the-data)
  - [7.2 Check data integrity](#check-data-integrity)
    - [7.2.1 Describe statistical measures associated with data integrity including statistical power, hypothesis testing, and margin of error](#statistical-power-hypothesis-testing-and-margin-of-error)
    - [7.2.2 Overcome the challenges of insufficient data](#overcome-the-challenges-of-insufficient-data)
    - [7.2.3 Discover data constraints and clean data](#discover-data-constraints-and-clean-data)
      - [7.2.3.1 Check data type (Values must be of a certain type: date, number, percentage, Boolean, etc.)](#check-data-type)
      - [7.2.3.2 Check data range (Values must fall between predefined maximum and minimum values)](#check-data-range)
      - [7.2.3.3 Check mandatory data (Values can’t be left blank or empty)](#check-mandatory-data)
      - [7.2.3.4 Check unique data (Values can’t have a duplicate)](#check-unique-data)
      - [7.2.3.5 Check for regular expression (regex) patterns (Values must match a prescribed pattern)](#check-for-regular-expressions)
      - [7.2.3.6 Check for cross-field validation (Certain conditions for multiple fields must be satisfied)](#check-for-cross-field-validation)
      - [7.2.3.7 Check for primary-key (Databases only, value must be unique per column)](#check-for-primary-key)
      - [7.2.3.8 Check for set-membership (Databases only, values for a column must come from a set of discrete values)](#check-for-set-membership)
      - [7.2.3.9 Check for foreign-key (Databases only, values for a column must be unique values coming from a column in another table)](#check-for-foreign-key)
      - [7.2.3.10 Check for accuracy (The degree to which the data contains all desired components or measures)](#check-for-accuracy)
      - [7.2.3.11 Check completeness (Do the values contains all desired components or measures?)](#check-completeness)
      - [7.2.3.12 Check for consistency (The degree to which the data is repeatable from different points of entry or collection)](#check-for-consistency)
      - [7.2.3.13 Check for misspelled words](#check-for-misspelled-words)
      - [7.2.3.14 Check for mistyped numbers](#check-for-mistyped-numbers)
      - [7.2.3.15 Check for extra spaces and characters](#check-for-extra-spaces-and-characters)
      - [7.2.3.16 Check for misleading variable labels (columns)](#check-for-misleading-variable-labels)
    - [7.2.4 Review the goal of your project](#review-the-goal-of-your-project)
      - [7.2.4.1 Confirm the business problem](#confirm-the-business-problem)
      - [7.2.4.2 Confirm the goal of the project](#confirm-the-goal-of-the-project)
      - [7.2.4.3 Verify that data can solve the problem and is aligned to the goal](#verify-that-data-can-solve-the-problem-and-is-aligned-to-the-goal)
- [8. Analyze](#analyze)
  - [8.1 Organize the data](#organize-the-data)
  - [8.2 Format and adjust the data](#format-and-adjust-the-data)
  - [8.3 Get input from others](#get-input-from-others)
  - [8.4 Transform the data](#transform-the-data)



<a id="introduction"></a>
## **1. Introduction**

The vacation rentals market in the United States is experiencing constant growth and evolution.  A variety of factors influence this,ranging from customer preferences, trends in the market, local special circumstances, and underlying macroeconomic factors. By 2024, it's to projected to achieve a revenue of $US\$19.77$bn, with an estimated amount of $62.57$m users, and it's expected that $79\%$ of the total revenue in this market will be generated through online sales [1].


<a id="scenario"></a>
## **2. Scenario**

You are a junior data analyst working for a business intelligence consultant. You have been at your job for six months, and your boss
feels you are ready for more responsibility. He has asked you to lead a project for a brand new client — this will involve everything
from defining the business task all the way through presenting your data-driven recommendations. You will choose the topic, ask
the right questions, identify a fresh dataset and ensure its integrity, conduct analysis, create compelling data visualizations, and
prepare a presentation.


<a id="background"></a>
## **3. Background**

Spire Property Group (fictional company) is a real state management company that doesn't just manage properties, it cultivates communities. Founded by a passionate team with a combined century of experience, Spire elevates the real estate experience for both owners and residents.

Spire Property Group caters to a diverse clientele, offering a range of services for:

- Vacation Rentals: Transforming dream getaways into reality with meticulous management and exceptional guest experiences.
- Residential Properties: Providing stress-free living with responsive maintenance, streamlined rent payments, and exclusive resident events.
- Commercial Properties: Partnering with businesses to create thriving workspaces, offering expert property management and fostering a sense of community within the tenant base.



<a id="business-task"></a>
## **4. Business task**

Develop a comprehensive market analysis and investment strategy to guide Spire Property Group's expansion into the vacation rental market of Albany.

<a id="ask"></a>
## **5. Ask**

The Spire property group ask you to analyze public data from Airbnb to answer questions about the vacation rental market in Albany. These questions will guide the analysis:

- How neighborhoods or amenities influence Airbnb prices?
- What listing are rented most frequently?
- Where super hosts are located?


<a id="prepare"></a>
## **6. Prepare**

In this phase, I gather the data, describe it, ensure it has the correct format, credibility, and understand its limitations. I use the historical listing data from Airbnb of Albany. The data was in csv format, which has reading and writing performance limitations. With that in mind, I create a database, containing tables representing each file. The data is credible, so the insights obtained will be of a prescriptive nature.

<a id="describe-data"></a>
### **6.1 Describe data**

The Airbnb data contain publicly available data from Airbnb listing of Albany in the New York state. The data was obtained from the Inside Airbnb platform. This data doesn't include private information about renters or hosts, but focuses on details about the listings themselves. It contains data about listing information (entire apartment, private room, etc.), data, pricing, availability, and review data.

The data provided cover listings starting on March. 10, 2024 to March 9, 2025 (almost a year), not representative of the entire listing history. Therefore, this data is a sample. So, the insights derived from this data can only be functional under the specific circumstances of the proposed business task.

<a id="check-data-credibility"></a>
### **7.2 Check data credibility**

The credibility of our data can be determined using the ROCCC system:

The data is reliable because it was collected by Airbnb. The data is original, because it was collected by Airbnb. The data is comprehensive because it contains all information needed to answers the guiding questions to produce insights that it could drive the decision making of the stakeholders. The data is current, because the data has a timeframe that covers the most up-to-date data. The data is cited because the data was obtained from the original source.

<a id="understand-data-limitations"></a>
### **7.3 Understand data limitations**

The data possess one main limitation, unknown sample size and generalizability, making it difficult to draw conclusions about the entire population. However, the data still holds value for gaining insights under the specific circumstances imposed by the business task.

<a id="format-data"></a>
### **7.4 Format data**

I converted the csv files into tables by using the options provided by sqlitebrowser. Those tables are stored as a database located at `/database/albany-ny-airbnb-data.db`.
