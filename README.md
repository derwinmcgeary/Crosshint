# Crosshint.sh

This is a little script to help with crosswords.  It has two modes of operation - tell me the Nth letter, or list all matching words.

##  Nth letter
If you want to get a hint for the first letter, and the last three are "ger" for a six-letter word, type:

```
crosshint.sh ...ger 1
```

You will get a rough histogram showing which first letters are most likely.

## List all matching

If you want to see all words that match the pattern, just type the pattern with no number.

```
crosshint.sh ..ffin
```

# Install

Put it in `/usr/local/bin` and make sure it is executable.  It uses standard unix tools, and expects a list of words in /usr/share/dict/words. 