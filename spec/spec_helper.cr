require "spec"
require "../src/noteesh/*"

NOTEESH_TEST_FILE_PATH   = "#{__DIR__}/data/noteesh.txt"
NOTEESH_TEST_2_FILE_PATH = "#{__DIR__}/data/test.txt"

def manager_factory(path = nil)
  path ||= NOTEESH_TEST_FILE_PATH
  Noteesh::NotesManager.new path
end
