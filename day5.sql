SELECT
    club,
    CONCAT (
        '[',
        group_concat (player_name separator ', '),
        ']'
    ) 'players',
    COUNT(*) 'players_count'
FROM
    wc_players
GROUP BY
    club;
    