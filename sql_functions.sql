WITH score AS (
    SELECT
    *
    FROM (
    VALUES
    ROW('Kaka',2,'2021-01-01'),
    ROW('Carlos',2,'2021-02-01'),
    ROW('Cafu',3,'2021-03-01'),
    ROW('Benzema',4,'2021-04-01'),
    ROW('Ronaldo',5,'2021-05-01'),
    ROW('Ronadinho',5,'2021-06-01'),
    ROW('Vidal',6,'2021-07-01'),
    ROW('Messi',7,'2021-08-01'),
    ROW('Rivaldo',7,'2021-09-01'),
    ROW('Neymar',9,'2021-10-01')) AS
    n (name,score,date)
)
SELECT
    *,
    RANK() OVER(ORDER BY score) AS ranking,
    ROW_NUMBER () OVER (ORDER BY score) AS row_nr,
    DENSE_RANK () OVER (ORDER BY score) AS dense,
    LAG (date,1) over(ORDER BY date) AS lag_date,
    LEAD (date,1) over(ORDER BY date) AS lead_date,
    CUME_DIST () OVER (ORDER BY score) AS cume,
    PERCENT_RANK() OVER (ORDER BY score) AS percent

FROM score s
ORDER BY score DESC