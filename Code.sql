SELECT	Decile = [L12MDecile],
		Client = 'AMH',		
		DateY = YEAR(df_transactionDate),
		DateM = MONTH(df_transactionDate),
		Buyers = COUNT(DISTINCT BContactID),
		DedupedBuyers = COUNT(DISTINCT FS.MasterContactID),
		Revenue = SUM(ExtRevenue),
		AOV = SUM(ExtRevenue)/COUNT(DISTINCT OrderID)     
FROM		[dbo].[AGL_Fact_Sales_Base](NOLOCK) FS
INNER JOIN	[dbo].[AGL_Dim_CustomerSummary_Base] (NOLOCK) C ON
				FS.MasterContactID = C.MasterContactID
WHERE	YEAR(df_transactionDate) >= 2014
GROUP BY	[L12MDecile],
			YEAR(df_transactionDate),
			MONTH(df_transactionDate)			