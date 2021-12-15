# Observations on R vs Python

Some of this may be because I'm not used to it. I tried not doing this with functions to begin with, BIG MISTAKE. Using functions in a functional language is really important, who knew!

It realy isn't a general purpose langauge.

## Positives

* Sometimes the things you need are right there and have more simple, sensible function names than Python (e.g. colSum, rowSum, rollSum etc).
* It's **trying** to be helpful
* Data loading **might** not be that bad - once you work out which is best from array, matrix and data.frame

## Negatives

* I hated it, it wasn't anywhere near as fun as coding in Python, much more fiddly and a lot of time wasted on syntax and unlisting fuckery.
* Type hinting is a package - didn't test it but not cool
* Spent so long just loading data. Simple data loading processes just don't seem to exist
* Packages for certain tasks just don't exist (eg there's no common Mode function and no decnt binary arithmetic / manipulation packages)
* Some things are split across multiple packages. Where functionality in Python is all in one place (usually in Pandas or Numpy), when googling I came across a lot of solutions that were either really lengthy in base or brief but overly complex and it used 2 or more packages
* There's a tiny bit more syntax fluff than Python (e.g. for(){} etc.)
* Can't have multiple outputs, more annoying than you'd think as you have to make chains of multiple functions to cover separate needs for outputs
* R doesn't support multi-line docstrings
* I can't be bothered with print(paste()) all the time?
* Re-do doesn't work in RStudio - really?
* Data frames are forever reformatting themselves 
* read.table(..sep='->') doesn't work because the delimiter is more than one character.