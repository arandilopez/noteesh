require "spec"
require "../src/noteesh/*"

NOTEESH_TEST_FILE_PATH = "#{__DIR__}/data/noteesh.txt"
NOTEESH_TEST_2_FILE_PATH = "#{__DIR__}/data/test.txt"

Spec.before_each do
  File.delete(NOTEESH_TEST_FILE_PATH) if File.exists?(NOTEESH_TEST_FILE_PATH)
  File.open(NOTEESH_TEST_2_FILE_PATH, "w") do |f|
    f << "Buy new phone\n"
    f << "Buy cookies for team\n"
  end
end

def manager_factory(path = nil)
  path ||= NOTEESH_TEST_FILE_PATH
  Noteesh::NotesManager.new path
end
