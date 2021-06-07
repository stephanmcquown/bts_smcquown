# Contingency Location

|Affects|Change|Location|
|---|---|---|
|Ecommerce | These changes are currently only in QA / TEST. <br> The "Customer Info" sp_NOD_ECommerce_CustomerInfo returns customer's Contingency Location as required <br> The "Quantity on Hand by Customer" sp_NOD_ECommerce_QOHForPartExtendedInfo_Magento hides primary warehouse inventory when Contingency Location being used | NODMYSQL9901.NOD_TEST <br> Magento QA

Users should experience no downtime associated with this change.  
Users do not need to do anything for this change.

---

Also as part of this, deleting unused database procedures

- sp_nod_ecommerce_qohforpar 
- sp_nod_ecommerce_qohforpartextendedinfo