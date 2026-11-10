# Duplicate_Email
Duplicarte Email find out using MySQL(SELF JOIN) approach.
# LeetCode 182: Duplicate Emails

## Problem
Given a `Person` table, report all the duplicate emails.
An email is a duplicate if it appears more than once in the table.

**Table: `Person`**

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| email       | varchar |

- `id` is the primary key.
- Emails contain no uppercase letters and are never `NULL`.
- Return the result in any order, with the column name `Email`.

## Example

**Input**

| id | email   |
|----|---------|
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |

**Output**

| Email   |
|---------|
| a@b.com |

`a@b.com` appears two times, so it is the only duplicate.

## Approach
Group the rows by email, count how many rows are in each group, and keep only the groups that have more than one row.

1. `GROUP BY email` puts all rows with the same email into one group.
2. `COUNT(*)` gives the number of rows in each group.
3. `HAVING COUNT(*) > 1` keeps only the groups with duplicates.
4. `SELECT email AS Email` returns each duplicate email once, with the required column name.

### Walkthrough

After `GROUP BY email`:

| email   | COUNT(*) |
|---------|----------|
| a@b.com | 2        |
| c@d.com | 1        |

`HAVING COUNT(*) > 1` removes `c@d.com`, so only `a@b.com` remains.

### WHERE vs HAVING

| Clause | When it runs | What it filters |
|--------|--------------|-----------------|
| `WHERE` | Before grouping | Individual rows |
| `HAVING` | After grouping | Groups |

`COUNT(*)` is only available after grouping, so `HAVING` is used instead of `WHERE`.

## Solution (MySQL)

```sql
SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
```

## Alternative: Self Join

```sql
SELECT DISTINCT a.email AS Email
FROM Person a
JOIN Person b
  ON a.email = b.email
 AND a.id <> b.id;
```

This finds emails that have another row with the same email but a different `id`.
`DISTINCT` prevents the same email from appearing more than once.

## Concepts Used
- `GROUP BY`
- `HAVING` with `COUNT(*)`
- Column alias (`AS`)
- Self Join (alternative)

## Language
MySQL

## Link
https://leetcode.com/problems/duplicate-emails
