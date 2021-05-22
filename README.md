<img align="right" src="https://user-images.githubusercontent.com/83033161/119237203-a9a20700-bb09-11eb-9b58-8eeae1c87fa1.png"> 

# Haikuify
Finding Art in Text

**Author**: Ethan Milne, PhD Student (Marketing/Consumer Behavior), Ivey Business School

**Purpose**: Personal amusement

**Hotel?**: Trivago




## Haikus

A [haiku](https://en.wikipedia.org/wiki/Haiku) is a style of short-form poetry originating from Japan. The distinctive characteristic of a haiku is its syllable structure: a haiku's three lines have 5, 7, and 5 syllables for each respective line, for a total of 17 syllables. This condensed format can make for wonderfully complex yet simple poetry, which is why it's always been amusing to me to find "accidental" haikus in the wild - sentences that conform to the traditional format of a haiku yet with none of the artistic intentionality.

To give an example of how prevalent accidental haikus are, I direct you to [this website](https://haiku.somebullshit.net/1.html), which claims to have identified over 4.5 million words worth of haikus scraped from reddit comments between 2005-2016. Some examples:

* Can't you see how much / better you make the world just / by being in it?
* Your cat has no more / metaphysical value / than a deer or cow.
* Dude, don't. Your home will / smell like piss and no one will / want to come over.

The short nature of a haiku is what makes them so easy to find in the real world. A longer poetry format like a limerick or sonnet would be too long and tend to require a complex rhyme structure that makes them unlikely to occur by chance. That's why I've created the `Haikuify` package for R - to take advantage of the large quantity of accidental Haikus online to make beautiful art.

## Using the Package

This package has one function: `haikuify()`. With it, you should be able to find any accidental haiku lurking in a character string.

Here's how it works:
* Take a character string
* Split it into sentences (sentence endings are defined as a punctuation mark followed by a space and a capital letter)
* Split those sentences into words
* Calculate the syllable counts for each word
* Filter for those sentences which have exactly 17 syllables
* Compute cumulate syllable counts by word for each sentence
* Filter for those sentences that have a cumulative syllable count of 5, 12, AND 17
* Combine those sentences which meet the above criteria, adding "/" to denote line breaks
* Display a vector of all newly-formatted sentences


## Example
```{r}
library(Haikuify)

text <- "I've been wondering for a while now how we might start this project. We need to make sure that the tools are all in place to get started soon. Sound good? Let's get going."

haikuify(text)

[1] "We Need To Make Sure / That The Tools Are All In Place / To Get Started Soon"
```

## Real-World Use Case

I used an earlier version of `haikuify` to find the accidental Haikus hidden in corporate financial reports - looking at some top companies like Apple, Microsoft, and Amazon. I ended up with a set of beautiful haikus displayed on a visual representation of firm stock movements - see below for an example from Microsoft's 2018 10k form:

![Microsoft Haiku](https://user-images.githubusercontent.com/83033161/119236593-42368800-bb06-11eb-83e9-0c00352a4dac.png)

## Installation

You can install `haikuify` with the following code:

```{r}
install.packages("devtools") # if you have not installed "devtools" package
devtools::install_github("SEthanMilne/haikuify")
```
