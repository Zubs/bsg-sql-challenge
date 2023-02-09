SELECT
    SUM(squared_deviation) / COUNT(*) 'Variance',
    SQRT(SUM(squared_deviation) / COUNT(*)) 'Standard deviation'
FROM
    (
        SELECT
            POWER(
                CAST(appearances AS unsigned) - AVG(CAST(appearances AS unsigned)) OVER (),
                2
            ) squared_deviation
        FROM
            wc_players
    ) squared_deviation_table;