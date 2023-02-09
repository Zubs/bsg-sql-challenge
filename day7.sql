SELECT
    SUM(squared_deviation) / COUNT(*) 'Variance'
FROM
    (
        SELECT
            POWER(CAST(appearances AS unsigned) - mean, 2) squared_deviation
        FROM
            wc_players
            JOIN (
                SELECT
                    AVG(appearances) mean
                FROM
                    (
                        SELECT
                            CAST(appearances AS unsigned) appearances
                        FROM
                            wc_players
                    ) casted_table
            ) avg_table
    ) squared_deviation_table;