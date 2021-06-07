

/* Get Premier Auto-Supply Overcharges */

/* MAIN store is Pompano Bch 9545326597 */

    /* Get customer list */
    drop temporary table if exists ttCustomers;
    create temporary table ttCustomers (
        Perfection_ID varchar(10) primary key
    )
    select c.Perfection_ID,
           c.CustomerName,
           cast('9999-12-31' as date) DateAsOfStart
    from Customers c
    where c.OwnerName = 'PAS'
    ;
    
    /* Check for existence of loc specific pricing in "history" tables */
    -- select c.Perfection_ID, h.DateAsOfStart from 
    update ttCustomers c
    inner join (-- Union of history tables 
        select h.Contract_ID,
               min(h.DateAsOfStart) as DateAsOfStart
        from pricing_partcontracts_history h
        group by h.Contract_ID
        union
        select h.Contract_ID,
               min(h.DateAsOfStart) as DateAsOfStart
        from pricing_plcontracts_history h
        group by h.Contract_ID
    ) h
        on c.Perfection_ID = h.Contract_ID
    set c.DateAsOfStart = h.DateAsOfStart
    ;
    
    /* Delete all but customers we need to keep */
    delete
        from ttCustomers
    where DateAsOfStart = '9999-12-31';
    
    /* Get sales history since X date */
    drop table if exists tmpSales_PremierAutoSupply;
    create table tmpSales_PremierAutoSupply
    select c.Perfection_ID,
           c.CustomerName,
           s.Order_ID,
           s.ProductLine_ID,
           s.PartNumber,
           s.UOM,
           cast(s.QtyShipped as signed) as QtyShipped,
           s.UnitPrice,
           cast(0 as decimal(10,2))     as CorrectPrice
    from ttCustomers c
        inner join Sales s
            on c.Perfection_ID = s.Perfection_ID
    where s.DateOrder >= c.DateAsOfStart and QtyShipped != 0; 
    ;
    
    /* Verify in F5 for sanity check 
        select sum(s.QtyShipped * s.UnitPrice) from tmpSales_PremierAutoSupply s where s.Perfection_ID = '5551000320' ; 
    */
    
    /* Add some handy columns */ 
    alter table tmpSales_PremierAutoSupply add column Diff decimal(18,4) generated always as (UnitPrice - CorrectPrice) after CorrectPrice;
    alter table tmpSales_PremierAutoSupply add column Diff_Ext decimal(18,4) generated always as (Diff * QtyShipped) after Diff;
    alter table tmpSales_PremierAutoSupply add column PLPartUOMQty varchar(250) generated always as (concat(Productline_ID, '|', PartNumber, '|', UOM, '|', QtyShipped));
    
    /*  
        Get current pricing 
        Run the below and then go over to NOD_PM to execute 
    
            set @SUPPRESS_OUTPUT = 1;
            set @vlPerfection_ID = '9545326597'; 
            set @vlPLPartUOMQty = 'MMM|7193|EA|9|AUK|0901|GL|1|NOR|04628|PK|1|SAS|6603|BX|1|MAR|31180|EA|1|MMM|7192|EA|12|AES|6527|EA|2|AUK|0901|GL|1|CAL|10325-03|RL|1|EAG|03106|EA|1|MTG|HT-2|PK|1|NOR|04628|PK|1|RBL|3132NG|EA|1|SAS|6604|BX|1|SEM|15163|CN|1|SEM|39103|CN|1|SEM|39143|CN|8|SEM|70011|PK|1|CAL|10325-03|RL|1|EAG|8560040|RL|1|FIB|1189|QT|1|MWB|15802|BX|1|SAS|6609|BX|1|SEM|70011|PK|1|TAI|AF44A|EA|1|MMM|7193|EA|12|AUK|0901|GL|1|EAG|7780800|BX|3|EAG|8560040|RL|2|MWB|15802|BX|2|NOR|04615|EA|3|RBL|3132NG|EA|1|SAS|6593|BX|1|SAS|6594|BX|1|SAS|6603|BX|2|SAS|6609|BX|1|SAS|66574|BX|4|SEM|39143|CN|18|STA|21-299A|PK|1|MMM|7046|PK|1|MTG|J20014|PK|1|RBL|3132NG|EA|1|SAS|6594|BX|1|SAS|66519|BX|1|SAS|66573|BX|3|MMM|8609|TB|3|KLE|ENGC11131|CN|3|MTG|J20015|PK|1|RBL|3132NG|EA|2|SAS|66574|BX|4|SEM|15163|CN|1|TAI|AF44A|EA|1|CAL|10325-07|RL|1|MLT|778|EA|1|MTG|J20015|PK|1|SEM|15123|CN|1|SEM|39104|QT|1|SEY|98-3|CN|1|MMM|7194|BX|2|MTG|J20014|PK|2|NIT|9001-T|TB|1|RBL|3132NG|EA|1|SAS|66519|BX|1|AST|4008|EA|1|CAL|10325-07|RL|1|KLE|EAR2000|CN|1|MLT|716|EA|1|MLT|778|EA|1|MTG|J20015|PK|1|SEM|15123|CN|1|SEM|39103|CN|1|SEM|39104|QT|1|SEM|39143|CN|12|SEY|98-3|CN|1|TAI|AF44A|EA|1|TTN|22400|EA|1|MMM|5738|EA|2';    
            call sp_NOD_ECommerce_PartPriceMultiple(@vlPerfection_ID, @vlPLPartUOMQty, 3); 
            
            drop table if exists tmpPriceList_PAS; 
            create table tmpPriceList_PAS 
            select @vlPerfection_ID as Perfection_ID, r.ProductLine_ID, r.PartNumber, r.UOM, r.Price from nod_pm.tmpPartPriceMultiple_RESULTS r
            ; 
            
            show create table tmpPriceList_PAS; 
    
    BooHooHoo 
    create a farterated table 
        CREATE TABLE federated.tmpPriceList_PAS (
          Perfection_ID varchar(10), 
          ProductLine_ID varchar(6),
          PartNumber varchar(20),
          UOM varchar(6),
          Price decimal(10,2)
        )
        engine = federated,
        connection = 'POS_nod_pm/tmpPriceList_PAS' 
        ; 
    */
    
    set session group_concat_max_len = 65000;
    select group_concat(PLPartUOMQty separator '|')
    from tmpSales_PremierAutoSupply s
    where s.QtyShipped > 0; 


    /* Update table with correct price from NOD_PM */ 
    -- select * from 
    update
        federated.tmpPriceList_PAS pp 
        inner join tmpSales_PremierAutoSupply s 
            on pp.ProductLine_ID = s.Productline_ID 
            and pp.PartNumber = s.PartNumber 
            and pp.UOM = s.UOM 
    set s.CorrectPrice = pp.Price 
    -- where pp.Price < s.UnitPrice
    ;

    /* Delete where price was less than equal to correct price.  So, keep only the needed data */ 
    delete from tmpSales_PremierAutoSupply where UnitPrice <= CorrectPrice;     

    /* OUT */ 
    select * from tmpSales_PremierAutoSupply pas; 

    




    
    

