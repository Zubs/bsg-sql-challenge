SELECT DISTINCT
    MAX(
        CASE
            WHEN position = 'DF' THEN ROUND(
                AVG(TIMESTAMPDIFF (YEAR, player_dob, CURRENT_DATE)),
                0
            )
        END
    ) OVER () DF,
    MAX(
        CASE
            WHEN position = 'MF' THEN ROUND(
                AVG(TIMESTAMPDIFF (YEAR, player_dob, CURRENT_DATE)),
                0
            )
        END
    ) OVER () MF,
    MAX(
        CASE
            WHEN position = 'FW' THEN ROUND(
                AVG(TIMESTAMPDIFF (YEAR, player_dob, CURRENT_DATE)),
                0
            )
        END
    ) OVER () FW,
    MAX(
        CASE
            WHEN position = 'GK' THEN ROUND(
                AVG(TIMESTAMPDIFF (YEAR, player_dob, CURRENT_DATE)),
                0
            )
        END
    ) OVER () GK
from
    wc_players
GROUP BY
    position;