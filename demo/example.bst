ENTRY { author } { } { }

FUNCTION { formatauthor } {
    author
    #1
    "{vv~}{ll}{, jj}{, f}?"
    format.name$
    write$
    newline$
}

READ

ITERATE {formatauthor}