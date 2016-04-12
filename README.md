# Homebrew formulas

```
  brew tap VladimirMikhailov/pgtreats
```

## pg_dirtyread

The (pg_dirtyread)[https://github.com/omniti-labs/pgtreats/tree/master/contrib/pg_dirtyread]
extension provides the ability to read dead but

### Installation

```
  brew install pg_dirtyread
```

## pg_pathman

The (pg_pathman)[https://github.com/postgrespro/pg_pathman] module provides optimized partitioning mechanism and
functions to manage partitions.

### Installation

```
  brew install pg_pathman
```

## pg_recall

(pg_recall)[https://github.com/mreithub/pg_recall] is a PostgreSQL extension that keeps track of changes in a separate
_log table (one _log table for each managed data table).

### Installation

```
  brew install pg_recall
```

### Usage

```psql
CREATE EXTENSION IF NOT EXISTS btree_gist;
CREATE EXTENSION IF NOT EXISTS recall WITH VERSION '0.9.5';

SELECT recall.enable('accounts', '6 months');
SELECT recall.at('accounts', now() - interval '1 minute');
```
