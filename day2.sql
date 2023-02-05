CREATE VIEW
    highest_records AS
SELECT
    MAX(goals_scored) highest_goals,
    MAX(assists_provided) highest_assists,
    MAX(goals_and_assists) highest_goals_and_assists
FROM
    (
        SELECT
            CAST(goals_scored AS unsigned) goals_scored,
            CAST(assists_provided AS unsigned) assists_provided,
            CAST(goals_scored AS unsigned) + CAST(assists_provided AS unsigned) goals_and_assists
        FROM
            wc_players
    ) casted_scores;

(
    SELECT
        CASE
            WHEN true THEN 'highest_goal_scorer'
        END title,
        JSON_OBJECT (
            'id',
            id,
            'nationality',
            nationality,
            'fifa_ranking',
            fifa_ranking,
            'national_team_kit_sponsor',
            national_team_kit_sponsor,
            'position',
            position,
            'national_team_jersey_number',
            national_team_jersey_number,
            'player_dob',
            player_dob,
            'club',
            club,
            'player_name',
            player_name,
            'appearances',
            appearances,
            'goals_scored',
            goals_scored,
            'assists_provided',
            assists_provided,
            'dribbles_per_90',
            dribbles_per_90,
            'interceptions_per_90',
            interceptions_per_90,
            'tackles_per_90',
            tackles_per_90,
            'total_duels_won_per_90',
            total_duels_won_per_90,
            'save_percentage',
            save_percentage,
            'clean_sheets',
            clean_sheets,
            'brand_sponsorbrand_used',
            brand_sponsorbrand_used
        ) player
    FROM
        wc_players wcp,
        highest_records hr
    WHERE
        wcp.goals_scored = hr.highest_goals
    LIMIT
        1
)
UNION ALL
(
    SELECT
        CASE
            WHEN true THEN 'highest_assists'
        END title,
        JSON_OBJECT (
            'id',
            id,
            'nationality',
            nationality,
            'fifa_ranking',
            fifa_ranking,
            'national_team_kit_sponsor',
            national_team_kit_sponsor,
            'position',
            position,
            'national_team_jersey_number',
            national_team_jersey_number,
            'player_dob',
            player_dob,
            'club',
            club,
            'player_name',
            player_name,
            'appearances',
            appearances,
            'goals_scored',
            goals_scored,
            'assists_provided',
            assists_provided,
            'dribbles_per_90',
            dribbles_per_90,
            'interceptions_per_90',
            interceptions_per_90,
            'tackles_per_90',
            tackles_per_90,
            'total_duels_won_per_90',
            total_duels_won_per_90,
            'save_percentage',
            save_percentage,
            'clean_sheets',
            clean_sheets,
            'brand_sponsorbrand_used',
            brand_sponsorbrand_used
        ) player
    FROM
        wc_players wcp,
        highest_records hr
    WHERE
        wcp.assists_provided = hr.highest_assists
    LIMIT
        1
)
UNION ALL
(
    SELECT
        CASE
            WHEN true THEN 'overall_best_player'
        END title,
        JSON_OBJECT (
            'id',
            id,
            'nationality',
            nationality,
            'fifa_ranking',
            fifa_ranking,
            'national_team_kit_sponsor',
            national_team_kit_sponsor,
            'position',
            position,
            'national_team_jersey_number',
            national_team_jersey_number,
            'player_dob',
            player_dob,
            'club',
            club,
            'player_name',
            player_name,
            'appearances',
            appearances,
            'goals_scored',
            goals_scored,
            'assists_provided',
            assists_provided,
            'dribbles_per_90',
            dribbles_per_90,
            'interceptions_per_90',
            interceptions_per_90,
            'tackles_per_90',
            tackles_per_90,
            'total_duels_won_per_90',
            total_duels_won_per_90,
            'save_percentage',
            save_percentage,
            'clean_sheets',
            clean_sheets,
            'brand_sponsorbrand_used',
            brand_sponsorbrand_used
        ) player
    FROM
        wc_players wcp,
        highest_records hr
    WHERE
        wcp.goals_scored + wcp.assists_provided = hr.highest_goals_and_assists
    LIMIT
        1
);
