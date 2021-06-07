# Jobs 4 AM EST - 5 AM EST (covers 1:00 - 1:30 AM PST)

## Questions
<hr>

- All guns turn off?  
- How long has this been happening?
- What days and dates?
  - All?  
  - Some?
- How long is outage?

## Possible
<hr>

### Perfection

- Sales History backup
- Price updates (sent to customers IE FM, SWP)
- Web svc and ports (any conflicts)
- Update to SSRs
- Look at web svcs traffic

### WMS

- IIS Server memory dump
- NODWMS anything on this machine

### MySQL9901

<strong> Resources scoped to NOD_PM </strong>
- Backups (nod_pm) get times from LRoc
- ETLs to NODRHELBIAZ
  - Update Volume Pricing Prices
    - Time: 04:00
    - Duration: < 1 min
    - Resources: ip_unit_measure_price_code
  - Generate Suggested Order Precalc
    - Time: 04:00
    - Duration: <mark> 25 mins </mark>
    - Resources: rsv_order, rsv_order_partno
  - QtySalesMove_Merge
    - Time: 04:05
    - Duration: < 1 min
    - Resources: qty_sales_move, qty_sales_order
  - Parts_Import
    - Time: 04:00
    - Duration: < 2 mins
    - Resources:
      - Parts_Merge
        - inventory, inv_loc_nod, mfr
      - Parts_AllPriceCodes_Merge
        - ip_unit_measure_price_code
      - Pricing_Tables
        - NOD_Pricing_CustomerBestPricePL_History
        - cust_detail_best_pr_isp_mfr
        - NOD_Pricing_CompetitiveModels_History
        - NOD_Pricing_PLContracts_History
        - cust_special_price_mfr
        - NOD_Pricing_PartContracts_History
        - cust_special_price_part_no
  - ETL Injection Basic MASTER JOB Sales
    - Time: 04:30
    - Duration: <mark> 25 mins </mark>
    - Resources: 
      - Sales_Merge
        - rsv_order, rsv_order_partno
      - Open_OrdersMerge
        - <mark> order_open, order_open_partno </mark>
      - Quotes_Merge
        - order_quote, order_quote_partno
      - OrderSummaryFields
        - rsv_order
      - Sales_LineItem_Comments_Merge
        - rsv_order_partno_line_comment
      - OpenOrder_LineItem_Comments_Merge
        - order_open_partno_line_comment




### NODSQL2016A

- Look at backups (but those happen > 5 AM EST; 5:10 and 6:10) UNLIKELY CAUSE
- No summary / history / archive jobs were found in offending hours
- Check parts_pickhistory looks okay
- ETLs to NODRHELBIAZ
  - Parts_Import
    - Time: 04:00
    - Duration: < 2 minutes
    - Resources:
      - Parts_PickHistory
        - Pick_History