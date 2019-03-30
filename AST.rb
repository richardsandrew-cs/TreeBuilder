class AST
    # attr_accessor :down
    # attr_accessor :right
    # attr_accessor :token
     def initialize(tok)
        @token = tok
        @down = nil
        @right = nil
     end
     def get_down()
        return @down
     end
     def set_down(x)
        @down = x
     end
     def get_right()
        return @right
     end
     def set_right(x)
        @right = x
     end
     def get_token()
        return @token
     end
     def set_token(x)
        @token = x
     end
  
     def addChild(node)
        if (node == nil) then return nil end
        t = @down
        if (t != nil)
           while (t.get_right() != nil)
               t = t.get_right()
           end
           t.set_right(node)
        else
           self.set_down(node) 
        end
     end  
     def getFirstChild
        return @down
     end
     def setFirstChild(c)
         @down = c
     end
     def getNextSibling
        return @right
     end
     def setNextSibling(n)
        @right = n
     end
     def get_Text
        return @token.get_text()
     end
     def get_Type
        return @token.get_type()
     end
     def to_s
       return @token.to_s    
     end
     def toStringList
        t = self
        ts = ""
        if (t.getFirstChild() != nil)then ts += " (" end
        ts += " #{self.to_s()}"
        if (t.getFirstChild() != nil)
           ts += t.getFirstChild().toStringList()
        end
        if (t.getFirstChild() != nil)then  ts += " )" end
        if (t.getNextSibling() != nil)
           ts += t.getNextSibling().toStringList()
        end
        return ts
     end
  end  
  