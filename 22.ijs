NB. Phase 1
NB. ---------------------------------------------------------
NB. Uses e. to check if each char of ACGT is in the input string
NB. Specifying rank builds a 4 n boolean table
NB. 1&#. will sum the rows of the result
nucleotides =: 1#.'ACGT'e.~"{]

NB. Sums boolean result of not-equal
mutations =: 1#.~:

NB. Ravels A and B and then concatenates A-B with B-A
qualified =: (-.,-.~)&,

NB. Prepends a 0, partitions the input, returning the length of each, then gets maximum
maxrun =: 0>./@(#;._1)@,]

NB. Builds a matrix for each n in 0..n-1 asking if it is less than each m in n-1..0
NB. then indexes into the alphabet
stairway =: ucp&'⎕ '{~(</&i.-)   NB. created by Raul
NB. Beheads each successive suffix of n+1 copies of 1, then drops the first list
NB. 0 is used as the fill for \. indexing into the alphabet requires no extra steps
stairway2 =: ucp&'⎕ '{~1}.1}.\.@#~>:   NB. created by me

NB. Emulates [ - |@i: by reversing and beheading the second half
NB. The minimum a in x for each b in y creates the pyramid	
pyramid =: 1+[:<./~i.,}.@|.@i.   NB. created by elcaro
NB. Uses table to build the top left square
NB. Vertically appending the reversed table with the first row dropped gives a half
NB. Horizontally append the table with each row reversed and beheaded for the pyramid
pyramid2 =: [:(,.}.@|."1)[:(,}.@|.)1+<./&i.~   NB. created by me

NB. #\ == 1 + i.@#
NB. Uses the interval indices as the keys for grouping the input
NB. Takes the average of the places and the repeats it x times; x is the group length
NB. Boxes the result and then flattens with resulting list of boxes with ;
golfing =: ;@((#<@#+/%#)/.#\)

NB. Finds the first occurence of every string in x and takes the minimum. If nothing is
NB. found then #y is returned
NB. Takes n chars from y and links that with n chars dropped from y
split =: ]({.~;}.~)<./@i.~

NB. Double x for each side and add one for current element
NB. Use that as window for \ and take average of each
NB. Concatenates the head and tail x times
windows =: >:@+:@[(+/%#)\(#{.),],(#{:)

NB. Get all non-overlapping size 3 windows from the reversed input, join by x, and reverse
separation =: [|.@joinstring _3<\|.@]
