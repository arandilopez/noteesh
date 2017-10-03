module Noteesh
  class NotesManager
    def initialize(file_path : String)
      @file_path = file_path
      unless File.file? @file_path
        File.new(@file_path, "w").close
      end
    end

    def << (note)
      File.open(@file_path, "a") do |file|
        file << note << "\n"
      end
    end

    def delete(note_id)
      id = (note_id.to_i - 1)
      notes = File.read_lines(@file_path)
      deleted = notes.delete_at(id)
      File.open(@file_path, "w") do |file|
        file << notes.join("\n")
      end
      return deleted
    end

    def includes?(note)
      File.read_lines(@file_path).includes? note
    end

    def clear()
      File.open(@file_path, "w") do |file|
        file << nil
      end
    end

    def size
      File.read_lines(@file_path).size
    end

    def to_s
      File.read_lines(@file_path)
        .map_with_index { |e, i| "#{i + 1}: #{e}" }.join("\n")
    end
  end
end
