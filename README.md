# Getting and Cleaning Data Course Project

Take the raw data that comes with the assignment and perform the
prescribed operations to produce tidy data!

There are three files in this repo:

1. [run_analysis.R](run_analysis.R)
2. [CodeBook.md](CodeBook.md)
3. [README.md](README.md) (what you're reading right now)

"run_analysis.R" is the R script that transforms the raw data to tidy
data. It expects to find the raw data in the current working directory,
in a subdirectory named "UCI HAR Dataset". To run the script, run R as
follows:

```Shell
$ R -f run_analysis.R
```

It writes its output to a new file, "tidy_data.txt", also in the current
working directory.

"CodeBook.md" documents the source of the raw data, the changes made to
produce the tidy data, and explains the tidy data variables.
