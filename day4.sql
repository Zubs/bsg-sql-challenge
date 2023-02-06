CREATE VIEW
    galacticos AS
SELECT
    club,
    COUNT(*) 'galacticos',
    concat (
        '[',
        group_concat (player_name separator ', '),
        ']'
    ) 'players'
FROM
    wc_players
WHERE
    CAST(goals_scored AS unsigned) / CAST(appearances AS unsigned) >= 0.25
GROUP BY
    club;

SELECT
    wcp.club,
    COALESCE(g.galacticos, 0) 'galacticos',
    CASE
        WHEN COALESCE(g.galacticos, 0) > 0 THEN g.players
        ELSE '[]'
    END AS 'players'
FROM
    wc_players wcp
    LEFT JOIN galacticos g ON wcp.club = g.club
GROUP BY
    club;
