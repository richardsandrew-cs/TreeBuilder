class Token
    attr_accessor :type
    attr_accessor :text
 
    EOF = "eof"
    LPAREN = "("
    RPAREN = ")"
    ADDOP  = "+"
    SUBOP  = "-"
    MULTOP = "*"
    DIVOP  = "/"
    INT    = "int"
    ID     = "id"
    PRINT  = "print"
    ASGN   = "="
    WS     = "whitespace"
    UNKNWN = "unknown"
    ASSIGN = "assign"
    PGM    = "program"
    STMT   = "statement"
    E      = "e"
    EXP = "exp"
    ETAIL  = "etail"
    TTAIL = "ttail"
    TERM   = "term"
    TERM1  = "term1"
    FACTOR = "factor"
    EN    = "end"
    IF     = "if"
 
 
    def initialize(type,text)
       @type = type
       @text = text
    end
    def get_type
       return @type
    end
    def get_text
       return @text
    end
    def to_s
      # return "[Type: #{@type} || Text: #{@text}]"
        return "Token #{@type}|#{@text}|"
    end
 end
 