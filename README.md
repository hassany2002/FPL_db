# Fantasy Premier League Database

A Microsoft SQL Server database project for a Fantasy Premier League style game. It models user accounts and squads, players and their gameweek performance, transfers, leagues, and user gameweek history.

## Project layout

```text
fpl_db/
├── README.md
├── database/
│   ├── fplscript.sql
│   └── FPL_db_Insert_Example.sql
└── docs/
    └── FPL_db_ERD_and_Mapping.docx
```

- `database/fplscript.sql` — database creation, schema, constraints, indexes, functions, stored procedures, and sample inserts.
- `database/FPL_db_Insert_Example.sql` — additional example data inserts (review before running).
- `docs/FPL_db_ERD_and_Mapping.docx` — entity relationship diagram and relational table mapping.

## Database design

The schema has 9 tables: `users`, `Players`, `GameWeek`, `PlayerPerformance`, `UsersTeams`, `Transferss`, `UserGameWeekHistory`, `Leagues_cups`, and `UsersLeagues`. It uses composite keys for gameweek history and associations, and foreign keys to connect users, players, leagues, and gameweeks. The Word document lists each table's keys and columns and illustrates the declared relationships.

The SQL script also defines functions for looking up names and user/player information, plus stored procedures for inserting users, leagues, transfers and squad entries, updating player prices, and changing a squad selection.

## Requirements

- Microsoft SQL Server (the script sets compatibility level 170; use a compatible recent SQL Server version or adjust that setting if needed).
- SQL Server Management Studio (SSMS) or another client that supports SQL Server scripts and `GO` batch separators.

## Setup

1. Open `database/fplscript.sql` in SSMS and review the `CREATE DATABASE` file locations near the top. They currently point to the author's Windows desktop folder. Change the `.mdf` and `.ldf` paths to locations valid on your SQL Server machine, or remove the fixed `FILENAME` clauses and let SQL Server choose its default locations.
2. Run the schema and object-creation parts of `database/fplscript.sql` against a SQL Server instance. It creates the database, tables, constraints, indexes, functions, and stored procedures. The script also has sample inserts at its end; those may fail if the referenced example rows do not exist.
3. Review sample inserts in both SQL files before running them. They are not a clean, self-contained seed script: some inserts select users, players, or leagues by names that are not inserted in those files, and some rows may violate foreign keys or duplicate primary keys depending on existing data. Run only inserts for which you have prepared valid prerequisite rows.

## Important schema notes

- The `users.password` column and `insertuser` procedure accept ordinary text values. For a real application, never store plaintext passwords; store a suitably salted password hash in application code.
- `UsersTeams` has primary key `(UserID, PlayerID)`, so the same player cannot have multiple rows for the same user across different gameweeks. If squads are intended to be recorded separately for each gameweek, consider including `gameweekid` in that primary key.
- `Players.TeamName` is a text field; the schema does not define a separate clubs table or a foreign key for it.
- Player and account prices are stored as integers. Confirm whether those values represent whole units or tenths of a unit in the application.
