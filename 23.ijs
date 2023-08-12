NB. Phase 1
NB. ---------------------------------------------------------
NB. Uses the progressive maximum to filter out the right values
NB. by finding where those maxes are in the input
elimination =: #~[=>./\

NB. Reverses the inputs then finds the first occurences of a match
NB. That result is then reversed using under to give us the last occurrences
reverse =: E.&.|.

NB. Indexes into the rotated alphabet using the indexes of the input
NB. in the original alphabet
a =. ' ',26{.Alpha_j_
caesar =: (a i.]){a|.~[

NB. Compute x <=> y and filter out the non-zero items, the head is the
NB. answer because we only care about the direction of the first difference
version =: [:{.@(#~~:&0)*@-   NB. created by elcaro

NB. Compute the minimum size, take that many items from each row of the
NB. table formed by putting x on top of y. then column-wise reduce by >
NB. The result can be computed by counting 0s and 1
risk =: [:(+/@:-.,)@>/<.&#{."1,:

NB. Split by the pair separator then for each result, split by the k/v separator
kvpairs =: {:@[cut&>{.@[cut]

NB. Converts the input to rational then to num;denom form
rational =: 2 x:x:

NB. todo
critical =: [

NB. Reverses and boxes each pair of each list by specifiying rank, razes the
NB. results into a flat list and reshapes by the original shape
pairs =: $$[:;_2<@|.\"1]

NB. Box every chunk split by the leading delimiter
NB. If x is 0 then return nothing by taking nothing
NB. Else drop x-1 values from y. join by spaces and box the result
NB. then append that to the first x-1 values taken from y
partition =. ((<:@[{.]),' '<@joinstring<:@[}.])`{.@.(0=[)' '(<;._1)@,]
