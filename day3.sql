SELECT
    position,
    TIMESTAMPDIFF (YEAR, MIN(player_dob), CURRENT_DATE) oldest_age,
    TIMESTAMPDIFF (YEAR, MAX(player_dob), CURRENT_DATE) youngest_age,
    TIMESTAMPDIFF (YEAR, MIN(player_dob), CURRENT_DATE) - TIMESTAMPDIFF (YEAR, MAX(player_dob), CURRENT_DATE) 'range'
FROM
    wc_players
GROUP BY
    position;
    