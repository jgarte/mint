module Mint
  class Ast
    class ArrayDestructuring < Node
      getter items

      def initialize(@from : Parser::Location,
                     @to : Parser::Location,
                     @file : Parser::File,
                     @items : Array(Node))
      end
    end
  end
end
