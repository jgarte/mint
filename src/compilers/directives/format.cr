module Mint
  class Compiler
    def compile(node : Ast::Directives::Format) : Compiled
      compile node do
        content =
          compile node.content

        formatted =
          @formatter
            .format!(node.content, Formatter::BlockFormat::Naked)
            .gsub('\\', "\\\\")

        js.array([content, js.string(formatted)])
      end
    end
  end
end
