```Global Hardware Procurement & Supply Chain Analytic
An end-to-end data analytics project focused on inventory risk management, vendor procurement logistics, and physical warehouse utilization. This project builds a relational data model containing 5 tables and 28 attributes** using synthetic data generated via Mockaroo AI to run advanced SQL analytics and power a multi-page interactive Business Intelligence application.
 📊 Relational Data Architecture
The data ecosystem simulates a corporate hardware enterprise. All specialized dimension tables link back directly to the core fact table via a **One-to-Many (1:N)** relationship mapped on the primary relational identifier: `Device_ID`.
Purchased Product (Core Table): Contains primary master data records including unique device profiles, manufacturing categories, and physical product weights.
Inventory Warehouse: Tracks on-hand transactional stock balances, minimum safety thresholds, and physical floor storage locations.
Procurement Logistics: Monitors market pricing, total import volumes, and fulfillment dates.
Supplier: Profiles supply partners, geographical origin points, and vendor emergency contact registries.
Technical Compliance: Stores quality control variables, engineering audits, and asset validation benchmarks
🗄️ SQL Analytics & Database Engineering
The analytical scripts utilize multi-table relational `INNER JOIN` operations, aggregate window logic, mathematical risk formulas, and custom structural automation via stored procedures.
 1. Inventory Optimization & Risk Mitigation
This query identifies structural hardware shortages by looking for instances where on-hand quantities fall below safety levels, calculating the exact capital injection needed to restock the missing inventory.
 2. High-Value Supplier Dependency Concentration
This query clusters procurement spending by vendor and concatenates international sourcing networks to isolate bottleneck points where business dependencies are concentrated.
3. Warehouse Space Footprint Optimization
This query pairs transactional quantities with physical material weights to calculate localized load profiles across floor sectors, preventing structural over-allocation.
4. Database Automation: Real-Time Restock Procedure
An operational stored procedure that pulls programmatic restock data together with vendor points of contact for quick action on low-stock items.
 📈 Power BI Business Intelligence Application
The data tables feed into a dynamic, cross-filtered dashboard system organized by dedicated focus tabs matching the database architecture. 
Tab 1: purchased_product (Inventory Valuation & Health)
Focuses on asset categorization, capital allocations, and immediate risk levels across product lines.
KPI Metrics: Displays `497K` total units across inventory and a global asset value of `1.27bn`.
Device Stock Status Matrix: Tracks hardware assets alongside dynamic operational status alerts:
     `SAFE` - Optimal storage ranges.
     `WARNING` - Approaching replenishment lines.
     `URGENT` - Stock dropped below required safety thresholds.
Financial Allocation Matrix: Breaks down financial exposure by brand, identifying major value holdings (e.g., Toyota at 52.6M, Volkswagen at 47.2M).
Device Category Slicer Panel: A sidebar component enabling users to drill down instantly into specific domains such as Accessories, Audio, or Automotive.

<img width="895" height="508" alt="bi 1" src="https://github.com/user-attachments/assets/996869e5-9993-4f03-8a52-e699489e688c" />


 Tab 2: procurement_logistics (Sourcing Analytics)
Focuses on international trade channels, supplier velocity metrics, and physical facility storage loads.
KPI Metrics: Monitors a total network of `150` unique suppliers managing a combined structural footprint of `5.20K` warehouse weight.
Top Suppliers & Sourcing Trends: Visualizes import velocity profiles across vendors paired with chronological timelines mapping historical import curves over multi-year periods.
Top 5 Countries Chart & Directory: Breaks down geographic logistics lanes paired with a directory table detailing contacts and email records.
Crowded Warehouse Analysis Table: Indexes spatial capacity limits across warehouse floors to highlight high-density layout bottlenecks
Tech Stack & Skills Demonstrated
Database Management: Primary/Foreign key entity integrity enforcement, relational data modeling (1:N Star Configuration).
SQL Programming: Multi-table joining, logical calculations, sub-query engineering, operational Stored Procedures.
Business Intelligence (Power BI): Interactive reporting design, visual hierarchy development, cross-filtering configuration, KPI metric card implementation```
<img width="901" height="592" alt="bi 2" src="https://github.com/user-attachments/assets/bcb0bdfb-03c4-4fdd-88f3-d142e3f59268" />
