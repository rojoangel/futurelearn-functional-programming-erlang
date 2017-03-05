-module(w2).
-export([index/1]).

% indexes a list of lines as returned by index:get_file_contents/1
index(Xs) -> 
    index(Xs,1,[]).                             % we call to tail recursion implementation:
                                                % the second param is the current line index
                                                % the third param is an accumulator holding the word ranges

index([],_CurrentLineIdx,WordRanges) ->         % edge case - When we reach empty list we are done and
    WordRanges;                                 % the accumulator containing word ranges can be returned
index([X|Xs],CurrentLineIdx,WordRanges) ->      % X represents the line currently being indexed
    index(Xs,CurrentLineIdx+1,add_words_from_line(line_to_words(X),CurrentLineIdx,WordRanges)).
    
add_words_from_line([],_LineIdx,WordRanges) ->      % edge case - nothing to add
    WordRanges;                                     % the accumulator containing word ranges can be returned
add_words_from_line([X|Xs],LineIdx,WordRanges) ->   % Xs is the list of words in the line currently being processed
    add_words_from_line(Xs,LineIdx,add_word(X,LineIdx,WordRanges)).

add_word(Word,LineIdx,[]) ->                                    % edge case: WordRanges is empty
    [{Word, add_line_to_ranges(LineIdx,[])}];                     % add LineIdx to empty ranges
add_word(Word,LineIdx,[{Word, Ranges}|WordRanges]) ->           % if words match 
    [{Word, add_line_to_ranges(LineIdx,Ranges)}|WordRanges];    % add LineIdx to current Ranges and stop recurring
add_word(Word,LineIdx,[{AnotherWord, Ranges}|WordRanges]=AllWordRanges) ->    % if words do not match 
    % [{AnotherWord, Ranges}|add_word(Word,LineIdx,WordRanges)].  % keep recurring (non lexicographic order)
    case AnotherWord < Word of
        true -> [{AnotherWord, Ranges}|add_word(Word,LineIdx,WordRanges)]; % keep recurring (lexicograph order)
        _    -> [{Word,add_line_to_ranges(LineIdx,[])}|AllWordRanges]      % add Word and stop recurring 
    end.

add_line_to_ranges(LineIdx,[]) ->       % edge case - Ranges is empty
    [{LineIdx, LineIdx}];               % initialize with range for LineIdx
add_line_to_ranges(LineIdx, Ranges) -> 
    {RangeStart,RangeEnd} = lists:last(Ranges),  % only interested in last range (lines are processed incrementally)
    case LineIdx - RangeEnd == 1 of                                 % is LineIdx consecutive to range end?
        true -> lists:droplast(Ranges) ++ [{RangeStart,LineIdx}];   % true: recreate last range
        _    -> Ranges ++ [{LineIdx, LineIdx}]                      % false: insert a new range
    end.

line_to_words(Line) ->
    string:tokens(nocaps(nopunc(Line)), " "). % leveraging the string:tokens/2 function

% - removes punctuation
nopunc([]) -> [];
nopunc([X|Xs]) -> 
    case lists:member(X, ",;.:") of
        true -> nopunc(Xs);
        _    -> [X|nopunc(Xs)]
    end.

% - removes capitalization
nocaps([]) -> [];
nocaps([X|Xs]) -> [nocap(X)|nocaps(Xs)].

nocap(X) -> 
    case $A =< X andalso X =< $Z of
        true -> X + 32;
        _    -> X
    end.
