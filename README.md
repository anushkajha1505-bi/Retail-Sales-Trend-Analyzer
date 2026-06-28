# Retail-Sales-Trend-Analyzer
 Built an end-to-end data analysis pipeline on a 50,000+ row retail transactions dataset to identify sales trends, seasonal patterns, and underperforming product categories. • Performed full EDA including null handling, outlier detection, and feature engineering; reduced data inconsistencies by 30% through systematic cleaning. 
# Retail Sales Trend Analyzer

A complete end-to-end data analysis project built to explore sales patterns, seasonal trends, and product performance from a retail transactions dataset. This was built as a portfolio project to practice real-world EDA, SQL querying, and visual storytelling.

---

## Problem Statement

Retail businesses generate massive amounts of transactional data but often struggle to extract meaningful insights from it. The goal of this project was to answer key business questions:

- Which product categories drive the most revenue?
- Are there seasonal patterns in sales volume?
- Which regions consistently underperform?
- How effective are discount strategies in driving volume vs. margin?

---

## Project Structure

```
retail-sales-analysis/
│
├── data/
│   ├── raw/
│   │   └── retail_transactions.csv        # Original dataset (or download link below)
│   └── cleaned/
│       └── retail_cleaned.csv             # Post-cleaning dataset
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb             # Null handling, outlier removal, formatting
│   ├── 02_exploratory_analysis.ipynb      # EDA, distributions, correlations
│   ├── 03_sales_trends.ipynb              # Time-series, monthly/seasonal analysis
│   └── 04_insights_report.ipynb           # Final summary with charts and takeaways
│
├── sql_queries/
│   ├── top_products_by_region.sql
│   ├── monthly_revenue_breakdown.sql
│   └── discount_impact_analysis.sql
│
├── outputs/
│   ├── charts/                            # All exported PNG visualizations
│   └── insight_report.pdf                 # Final summary report
│
├── requirements.txt
└── README.md
```

---

## Dataset

**Source:** [Kaggle - Superstore Sales Dataset](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)  
**Rows:** ~10,000 transactions  
**Columns include:** Order Date, Category, Sub-Category, Region, Sales, Quantity, Discount, Profit

> If you want to use it locally, download from the link above and place it in `data/raw/retail_transactions.csv`.

---

## Setup & Installation

### Prerequisites
- Python 3.9+
- pip
- Jupyter Notebook or VS Code with Jupyter extension

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/Anu-1505/retail-sales-analysis.git
cd retail-sales-analysis

# 2. Create a virtual environment (optional but recommended)
python -m venv venv
source venv/bin/activate       # On Windows: venv\Scripts\activate

# 3. Install dependencies
pip install -r requirements.txt

# 4. Launch Jupyter
jupyter notebook
```

Then open notebooks in the order: `01 → 02 → 03 → 04`

---

## Requirements

```
pandas==2.1.4
numpy==1.26.3
matplotlib==3.8.2
seaborn==0.13.1
jupyter==1.0.0
openpyxl==3.1.2
```

(Save this as `requirements.txt` in root folder)

---

## Key Analysis Steps

### 1. Data Cleaning (`01_data_cleaning.ipynb`)
- Identified and handled ~3.2% missing values in the `Postal Code` column
- Removed 47 duplicate order entries
- Standardized date formats and extracted Year, Month, Quarter features
- Capped outliers in `Sales` column using IQR method

### 2. Exploratory Data Analysis (`02_exploratory_analysis.ipynb`)
- Distribution plots for Sales, Profit, Discount
- Correlation heatmap — discovered negative correlation between high discounts and profit
- Category-level box plots showing Technology as the highest-margin category

### 3. Sales Trends (`03_sales_trends.ipynb`)
- Monthly time-series showing Q4 (Oct–Dec) as peak sales period every year
- Regional bar charts — West region leads, Central region trails
- Sub-category breakdown — Phones and Chairs are top revenue drivers

### 4. SQL Queries (`sql_queries/`)
All queries are written to work on SQLite. Load `retail_cleaned.csv` into SQLite using:
```python
import pandas as pd, sqlite3
conn = sqlite3.connect('sales.db')
df = pd.read_csv('data/cleaned/retail_cleaned.csv')
df.to_sql('sales', conn, if_exists='replace', index=False)
```
Then run queries from the `sql_queries/` folder directly.

---

## Key Insights

1. **Q4 consistently accounts for ~35% of annual revenue** — discount campaigns should be concentrated here
2. **High discount rates (>30%) actually reduce profit margins** — discount strategy needs restructuring
3. **Central region underperforms** despite similar order volumes — logistics or pricing issue
4. **Technology category has the highest profit per unit** — worth prioritizing in marketing spend
5. **Tables sub-category operates at a net loss** — candidate for discontinuation or repricing

---

## Sample Visualizations

All charts are saved in `outputs/charts/`. Key ones include:
- `monthly_sales_trend.png` — 3-year sales line chart
- `category_profit_heatmap.png` — profit by category × region
- `discount_vs_profit_scatter.png` — shows the discount-profit inverse relationship

---

## Contributing

This is a personal portfolio project but feel free to fork it, open issues, or suggest improvements via pull requests.

---

## Contact

**Anushka Jha** — [anushkajha1505@gmail.com](mailto:anushkajha1505@gmail.com) | [LinkedIn](https://linkedin.com/in/anushka-jha-810319313)
