haikuify <- function (x){
  x %>%
    strsplit("(?<=[[:punct:]])\\s(?=[A-Z])", perl = T) %>%
    unlist() %>%
    data.frame() %>%
    rename("Sentences" = 1) %>%
    mutate(
      Sentences = gsub("[[:punct:]]", "", Sentences),
      Sentences = tolower(Sentences),
      Sentence_ID = row_number()
    ) %>%
    tidytext::unnest_tokens(word, Sentences) %>%
    mutate(
      syllables = nsyllable::nsyllable(word) %>%
        as.numeric()
    ) %>%
    group_by(Sentence_ID) %>%
    mutate(sentence_syllables = sum(syllables)) %>%
    filter(sentence_syllables == 17) %>%
    mutate(syllable_count = cumsum(syllables)) %>%
    filter(any(syllable_count == 5)) %>%
    filter(any(syllable_count == 12)) %>%
    filter(any(syllable_count == 17)) %>%
    mutate(word = ifelse(syllable_count == 5, paste(word, "/", sep = " "), word),
           word = ifelse(syllable_count == 12, paste(word, "/", sep = " "), word)) %>%
    summarise(text = stringr::str_c(word, collapse = " ")) %>%
    mutate(text = stringr::str_to_title(text)) %>%
    dplyr::pull(text)
}
