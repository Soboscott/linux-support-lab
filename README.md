# Linux Support Lab

Hands-on Linux troubleshooting, Bash scripting, and Git workflows for technical support.

Built in Ubuntu through Windows Subsystem for Linux (WSL), this project uses sample application and web logs to practice investigating errors, generating reports, and tracing code changes.

## Features

- Search log files using a literal, case-sensitive search term.
- Default to `ERROR` when no search term is supplied.
- Save matching lines with filenames and line numbers.
- Display the number of matching lines.
- Run from any directory by locating the project folder automatically.
- Distinguish matches, no matches, and failures using exit codes.
- Send search-failure messages to standard error.

## Project Files

| File | Purpose |
|---|---|
| `scripts/error-report.sh` | Executable Bash log-reporting script |
| `logs/application.log` | Sample application activity and database errors |
| `logs/web.log` | Sample web activity and request errors |
| `reports/errors.txt` | Generated search results |

## Getting Started

Requires Bash, Git, and standard Linux utilities.

```bash
git clone https://github.com/Soboscott/linux-support-lab.git
cd linux-support-lab
./scripts/error-report.sh
```

With the included sample logs, the default search displays:

```text
Found 3 matching lines.
Report for "ERROR" saved to reports/errors.txt
```

## Usage

Search for errors:

```bash
./scripts/error-report.sh ERROR
```

Search for informational messages:

```bash
./scripts/error-report.sh INFO
```

Search for a phrase:

```bash
./scripts/error-report.sh "Database connection failed"
```

View the report:

```bash
cat reports/errors.txt
```

Run from another directory, adjusting the path to where you installed the project:

```bash
~/projects/linux-support-lab/scripts/error-report.sh ERROR
```

The script locates the project folder automatically without changing your terminal's current directory.

## Report Behavior

Each run replaces `reports/errors.txt`, even when searching for a term other than `ERROR`. A search with no matches leaves an empty report.

The count represents matching lines, not individual occurrences of the search term.

The report is currently tracked in Git as an example. Running a different search may show it as modified in `git status`.

## Exit Codes

Check the exit code immediately after running the script:

```bash
./scripts/error-report.sh ERROR
echo $?
```

| Code | Meaning |
|---|---|
| `0` | Matching lines were found |
| `1` | No matching lines were found |
| `2` | A search error occurred, or the project directory could not be located or entered |

A search can produce partial results and still return an error if an input file cannot be read.

## Standard Output and Standard Error

Capture normal messages and errors separately:

```bash
./scripts/error-report.sh ERROR > /tmp/linux-lab-output.txt 2> /tmp/linux-lab-errors.txt
echo $?
cat /tmp/linux-lab-output.txt
cat /tmp/linux-lab-errors.txt
```

Matching log lines still go into the project's `reports/errors.txt`.

## Skills Practiced

- Linux navigation, relative paths, and absolute paths.
- Log searches with `grep`, line numbers, and surrounding context.
- Finding files and monitoring log updates with `tail -f`.
- Bash variables, arguments, defaults, conditionals, and command substitution.
- Executable permissions using `chmod`.
- Output redirection, appending, and line counting.
- Troubleshooting with exit codes and standard error.
- Git branching, commits, diffs, merges, and branch cleanup.
- Inspecting earlier file versions and tracing changes through history.
- GitHub CLI authentication, remote configuration, and pushing commits.

## Investigating Changes

View recent commits:

```bash
git log --oneline -5
```

Inspect the latest commit:

```bash
git show HEAD
```

Find the commit that introduced project-directory detection:

```bash
git log --oneline -S 'project_dir' -- scripts/error-report.sh
```

Read an earlier script version without changing your current files:

```bash
git show 774c84c:scripts/error-report.sh
```

## Scope

This is a learning project using sample logs. It is not a production monitoring system.

