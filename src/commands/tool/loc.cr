module Mint
  class Cli < Admiral::Command
    class Loc < Admiral::Command
      include Command

      define_help description: "Counts LOC (lines of code)."

      def run
        execute "Counting lines of code" do
          file_count =
            files.size.to_s.colorize.mode(:bold)

          line_count =
            count.to_s.colorize.mode(:bold)

          terminal.puts "#{COG} Files: #{file_count}"
          terminal.puts "#{COG} Lines of code: #{line_count}"
        end
      end

      private def files
        Dir.glob(SourceFiles.all(MintJson.current)).to_a
      end

      private def count
        files.reduce(0) do |memo, file|
          count =
            File.read(file).lines.count(&.presence)

          count + memo
        end
      end
    end
  end
end
