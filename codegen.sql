{{
    codegen.generate_source(
        schema_name = 'INGESTA',
        database_name = 'ALUMNO13_NBA_BRONZE',
        table_names = ['GAMES','GAMES_DETAILS','PLAYERS','RANKING','TEAMS'],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True
        )
}}