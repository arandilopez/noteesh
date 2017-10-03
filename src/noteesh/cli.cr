module Noteesh
  class Cli
    def initialize()
      @notes = NotesManager.new Noteesh::NOTEESH_FILE_PATH
    end

    def run
      OptionParser.parse! do |parser|
        parser.banner = "Usage: noteesh [arguments]"
        parser.on("-a NOTE", "--add=NOTE", "Add new item in notes file") { |note| add_note(note) }
        parser.on("-d ID", "--done=ID", "Mark as done a item by its ID") { |id| delete_note(id) }
        parser.on("-c", "--clear", "Clear notes file") { @notes.clear }
        parser.on("-h", "--help", "Show help docs") { puts parser }
        parser.on("-v", "--version", "Show noteesh version") do
          puts Noteesh::VERSION
          exit 0
        end
        parser.invalid_option do |option|
          puts "No option found for #{option}"
          puts parser
          exit 0
        end
        parser.missing_option do |option|
          puts "No param found for #{option} option"
          puts parser
          exit 0
        end
      end
      if @notes.size > 0
        print_notes
      else
        print_empty_notes
      end
    end

    private def print_notes
      puts "*" * 20
      puts "Your notes"
      puts "*" * 20
      puts @notes.to_s
    end

    private def add_note(note)
      @notes << note
    end

    private def delete_note(note_id)
      begin
        deleted = @notes.delete(note_id)
        puts "Done: #{deleted}"
      rescue
        puts "Unable to delete #{note_id} item"
      end
    end

    private def clear
      @notes.clear
    end

    private def print_empty_notes
      puts "*" * 20
      puts "Notes file is empty"
      puts "*" * 20
    end
  end
end
