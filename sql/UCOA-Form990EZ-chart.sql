-- UCOA Form 990EZ
--
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1000','Cash','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1010','Cash in bank-operating','A','22','A','AR_paid:AP_paid');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1020','Cash in bank-payroll','A','22','A','AP_paid');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1040','Petty cash','A','22','A','AR_paid:AP_paid');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1070','Savings & short-term investments','A','22','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1100','Accounts receivable','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1110','Accounts receivable','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1115','Doubtful accounts allowance','A','24','A','AR_paid','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1200','Contributions receivable','H','','A','AR');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1210','Pledges receivable','A','24','A','AR');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1215','Doubtful pledges allowance','A','24','A','AR_paid','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1225','Discounts - long-term pledges','A','24','A','AR_paid','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1240','Grants receivable','A','24','A','AR');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1245','Discounts - long-term grants','A','24','A','AR_paid','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1300','Other receivables','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1310','Employee & trustee receivables','A','24','A','AR');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1320','Notes/loans receivable','A','24','A','AR');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1325','Doubtful notes/loans allowance','A','24','A','AR_paid','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1400','Other assets','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1410','Inventories for sale','A','24','A','IC');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1420','Inventories for use','A','24','A','IC');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1450','Prepaid expenses','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1460','Accrued revenues','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1500','Investments','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1510','Marketable securities ','A','22','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1530','Land held for investment','A','22','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1540','Buildings held for investment','A','22','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1545','Accum deprec - bldg investment','A','22','A','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1580','Investments - other','A','22','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1600','Fixed operating assets','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1610','Land - operating','A','23','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1620','Buildings - operating','A','23','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1630','Leasehold improvements','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1640','Furniture, fixtures, & equip','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1650','Vehicles','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1660','Construction in progress','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1700','Accum deprec - fixed operating assets','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1725','Accum deprec - building','A','23','A','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1735','Accum amort - leasehold improvements','A','24','A','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1745','Accum deprec - furn,fix,equip','A','24','A','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('1755','Accum deprec - vehicles','A','24','A','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1810','Other long-term assets','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1850','Split-interest agreements','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1910','Collections - art, etc','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('1950','Funds held in trust by others','A','24','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2000','Payables','H','','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2010','Accounts payable','A','26','L','AP');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2020','Grants & allocations payable','A','26','L','AP');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2100','Accrued liabilities','H','','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2110','Accrued  payroll','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2120','Accrued paid leave','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2130','Accrued payroll taxes','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2140','Accrued sales taxes','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2150','Accrued expenses - other','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2300','Unearned/deferred revenue','H','','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2310','Deferred contract revenue','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2350','Unearned/deferred revenue - other','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2410','Refundable advances','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2500','Short-term notes & loans payable','H','','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2510','Trustee & employee loans payable','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2550','Line of credit','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2560','Current portion - long-term loan','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2570','Short-term liabilities - other','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2610',' Split-interest liabilities','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2700','Long-term notes & loans payable','H','','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2710','Bonds payable','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2730','Mortgages payable','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2750','Capital leases','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2770','Long-term liabilities - other','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2810','Gov\'t-owned fixed assets liability','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('2910','Custodial funds','A','26','L','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3000','Unrestricted net assets','H','','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3010','Unrestricted net assets','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3020','Board-designated net assets','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3030','Board designated quasi-endowment','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3040','Fixed operating net assets','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3100','Temporarily restricted net assets','H','','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3110','Use restricted net assets','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3120','Time restricted net assets','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3200','Permanently restricted net assets','H','','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('3210','Endowment net assets','A','21&27','Q','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4000','Revenue from direct contributions','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('4010','Individual/small business contributions','A','1','I','AR_amount:IC_income');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4020','Corporate contributions','A','1','I','AR_amount:IC_income');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4070','Legacies & bequests','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('4075','Uncollectible pledges - estimated','A','1','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('4085','Long-term pledges discount','A','1','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4100','Donated goods & services revenue','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4110','Donated professional services-GAAP','A','','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4120','Donated other services - non-GAAP','A','','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4130','Donated use of facilities','A','','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4140','Gifts in kind - goods','A','1','I','AR_amount:IC_sale');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4150','Donated art, etc','A','1','I','AR_amount:IC_sale');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4200','Revenue from non-government grants','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4210','Corporate/business grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4230','Foundation/trust grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4250','Nonprofit organization grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('4255','Discounts - long-term grants','A','1','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4300','Revenue from split-interest agreements','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4310','Split-interest agreement contributions','A','1','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4350','Gain (loss) split-interest agreements','A','1','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4400','Revenue from indirect contributions','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4410','United Way or CFC contributions','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4420','Affiliated organizations revenue','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4430','Fundraising agencies revenue','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4500','Revenue from government grants','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4510','Agency (government) grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4520','Federal grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4530','State grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('4540','Local government grants','A','1','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5000','Revenue from government agencies','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5010','Agency (government) contracts/fees','A','2','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5020','Federal contracts/fees','A','2','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5030','State contracts/fees','A','2','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5040','Local government contracts/fees','A','2','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5080','Medicare/Medicaid payments','A','2','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5100','Revenue from program-related sales & fees','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5180','Program service fees','A','2','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5185','Bad debts, est - program fees','A','2','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5200','Revenue from dues','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5210','Membership dues-individuals','A','3','I','AR_amount:IC_income');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5220','Assessments and dues-organizations','A','3','I','AR_amount:IC_income');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5300','Revenue from investments','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5310','Interest-savings/short-term investments','A','4','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5320','Dividends & interest - securities','A','4','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5330','Real estate rent - debt-financed','A','8','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5335','Real estate rental cost - debt-financed','A','8','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5340','Real estate rent - not debt-financed','A','8','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5345','Real estate rental cost - not debt-financed','A','8','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5350','Personal property rent','A','8','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('5355','Personal property rental cost','A','8','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5360','Other investment income','A','4','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5370','Securities sales - gross','A','5a','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('5375','Securities sales cost ','A','5b','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5400','Revenue from other sources','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5410','Non-inventory sales - gross','A','5a','I','AR_amount:IC_income');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('5415','Non-inventory sales cost ','A','5b','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5440','Gross sales - inventory','A','8','I','AR_amount:IC_sale');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link, contra) VALUES ('5445','Cost of inventory sold ','A','8','I','','1');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5450','Advertising revenue','A','8','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5460','Affiliate revenues from other entities','A','8','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5490','Misc revenue','A','8','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5800','Special events','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5810','Special events - non-gift revenue','A','6a','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('5820','Special events - gift revenue','A','1&(6a)','I','AR_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6800','Unrealized gain (loss)','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6810','Unrealized gain (loss) - investments','A','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6820','Unrealized gain (loss) - other assets','A','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6900','Net assets released from restriction','H','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6910','Satisfaction of use restriction','A','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6920','LB&E acquisition satisfaction','A','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('6930','Time restriction satisfaction','A','','I','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7000','Grantscts, & direct assistance','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7010','Contracts - program-related','A','10','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7020','Grants to other organizations','A','10','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7040','Awards & grants - individuals','A','10','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7050','Specific assistance - individuals','A','10','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7060','Benefits paid to or for members','A','11','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7200','Salaries & related expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7210','Officers & directors salaries','A','12','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7220','Salaries & wages - other','A','12','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7230','Pension plan contributions','A','12','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7240','Employee benefits - not pension','A','12','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7250','Payroll taxes, etc.','A','12','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7500','Contract service expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7510','Fundraising fees','A','13','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7520','Accounting fees','A','13','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7530','Legal fees','A','13','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7540','Professional fees - other','A','13','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7550','Temporary help - contract','A','13','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7580','Donated professional services - GAAP','A','','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('7590','Donated other services - non-GAAP','A','','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8100','Nonpersonnel expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8110','Supplies','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8120','Donated materials & supplies','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8130','Telephone & telecommunications','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8140','Postage & shipping','A','15','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8150','Mailing services','A','15','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8170','Printing & copying','A','15','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8180','Books, subscriptions, references','A','15','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8190','In-house publications','A','15','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8200','Facility & equipment expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8210','Rent, parking, other occupancy','A','14','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8220','Utilities','A','14','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8230','Real estate taxes','A','14','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8240','Personal property taxes','A','14','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8250','Mortgage interest','A','14','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8260','Equipment rental & maintenance','A','14','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8270','Deprec & amort - allowable','A','16','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8280','Deprec & amort - not allowable','A','16','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8290','Donated facilities ','A','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8300','Travel & meetings expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8310','Travel','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8320','Conferences, conventions, meetings','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8500','Other expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8510','Interest-general','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8520','Insurance - non-employee related','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8530','Membership dues - organization','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8540','Staff development','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8550','List rental','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8560','Outside computer services','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8570','Advertising expenses','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8580','Contingency provisions','A','16','E','AP_amount');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8590','Other expenses','A','16','E','AP_amount:IC_expense');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8600','Business expenses','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8610','Bad debt expense ','A','16','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8620','Sales taxes','A','16','E','AP_tax');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8630','UBITaxes ','A','16','E','AP_tax');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8650','Taxes - other','A','16','E','AP_tax');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8660','Fines, penalties, judgments','A','16','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('8670','Organizational (corp) expenses','A','16','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9800','Fixed asset purchases ','H','','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9810','Capital purchases - land','A','capitalized','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9820','Capital purchases - building','A','capitalized','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9830','Capital purchases - equipment','A','capitalized','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9840','Capital purchases - vehicles','A','capitalized','A','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9900','Other Allocations','H','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9910','Payments to affiliates','A','16','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9920','Additions to reserves','A','','E','');
INSERT INTO chart (accno, description, charttype, gifi_accno, category, link) VALUES ('9930','Program administration allocations','A','','E','');
--
insert into tax (chart_id,rate) values ((select id from chart where accno = '8620'),0);
insert into tax (chart_id,rate) values ((select id from chart where accno = '8630'),0);
insert into tax (chart_id,rate) values ((select id from chart where accno = '8650'),0);
--
update defaults set inventory_accno_id = (select id from chart where accno = '1410'), income_accno_id = (select id from chart where accno = '4010'), expense_accno_id = (select id from chart where accno = '7510'), fxgain_accno_id = (select id from chart where accno = '5490'), fxloss_accno_id = (select id from chart where accno = '8590'), curr = 'USD', weightunit = 'lbs';

