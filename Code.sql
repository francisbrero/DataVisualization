SELECT	Client = 'AMHobbies',
		DateY = YEAR(df_transactionDate),
		DateM = MONTH(df_transactionDate),
		Buyers = COUNT(DISTINCT BContactID),
		DedupedBuyers = COUNT(DISTINCT MasterContactID),
		Revenue = SUM(ExtRevenue),
		AOV = SUM(ExtRevenue)/COUNT(DISTINCT OrderID)     
FROM [dbo].[AGL_Fact_Sales_Base](NOLOCK)
WHERE	YEAR(df_transactionDate) >= 2011
GROUP BY	YEAR(df_transactionDate),
			MONTH(df_transactionDate)
			