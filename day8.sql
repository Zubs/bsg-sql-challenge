WITH
    player_positions_map AS (
        SELECT
            club,
            CASE
                WHEN position = 'DF' THEN 1
                ELSE 0
            END DF,
            CASE
                WHEN position = 'MF' THEN 1
                ELSE 0
            END MF,
            CASE
                WHEN position = 'FW' THEN 1
                ELSE 0
            END FW,
            CASE
                WHEN position = 'GK' THEN 1
                ELSE 0
            END GK
        FROM
            wc_players
    )
SELECT
    club 'team',
    SUM(DF) DF,
    SUM(MF) MF,
    SUM(FW) FW,
    SUM(GK) GK
FROM
    player_positions_map
GROUP BY
    club;