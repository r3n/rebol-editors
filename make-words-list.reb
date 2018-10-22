test: [< <- <= <| |> ||  =< <> >= => -> >]
w: map-each w words of lib [to-text w]
sort w
syntax-kw: "syntax keyword rebolKW "
write-stdout syntax-kw
for-next w [
	write-stdout either w/1/1 = #"|" 
	[unspaced [{"} w/1 {"}]]
	[w/1]
	if tail? next w [break]
	case [
		w/2/1 = #"|" [write-stdout "^/syntax match rebolKW "]
		w/1/1 = w/2/1 [write-stdout space]
	] else [write-stdout unspaced [newline syntax-kw]]
]
write-stdout newline	
