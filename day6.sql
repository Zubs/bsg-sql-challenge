SELECT
    club 'Senior club',
    players 'Number of players',
    CASE
        WHEN players_positions LIKE '%DF%'
        AND players_positions LIKE '%MF%'
        AND players_positions LIKE '%FW%' THEN 'Yay'
        ELSE 'Nay'
    END
FROM
    (
        SELECT
            club,
            COUNT(*) players,
            GROUP_CONCAT (DISTINCT position separator ',') players_positions
        FROM
            wc_players
        GROUP BY
            club
    ) club_players_count
WHERE
    players >= 5;
    