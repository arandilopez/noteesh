require "./spec_helper"

describe "NotesManager" do
  Spec.before_each do
    File.delete(NOTEESH_TEST_FILE_PATH) if File.exists?(NOTEESH_TEST_FILE_PATH)
    File.open(NOTEESH_TEST_2_FILE_PATH, "w") do |f|
      f << "Buy new phone\n"
      f << "Buy cookies for team\n"
    end
  end

  context "file does not exists" do
    it "should create new file" do
      File.exists?(NOTEESH_TEST_FILE_PATH).should eq(false)
      Noteesh::NotesManager.new NOTEESH_TEST_FILE_PATH
      File.exists?(NOTEESH_TEST_FILE_PATH).should eq(true)
    end
  end

  describe :size do
    it "should return number of lines in notes file" do
      manager = manager_factory NOTEESH_TEST_2_FILE_PATH
      manager.size.should be_a(Int32)
    end
  end

  describe :includes? do
    it "should return true if note is in notes file" do
      manager = manager_factory NOTEESH_TEST_2_FILE_PATH
      manager.includes?("Buy new phone").should be_true
      manager.includes?("Buy new mac book").should be_false
    end
  end

  describe :<< do
    it "should add a note" do
      manager = manager_factory
      manager << "Buy new iphone x"
      manager.size.should eq(1)
      manager.includes?("Buy new iphone x").should eq(true)
    end

    it "should add more than a note" do
      manager = manager_factory
      manager << "Buy new iphone x"
      manager << "Buy new mac book pro"
      manager.size.should eq(2)
      manager.includes?("Buy new iphone x").should eq(true)
      manager.includes?("Buy new mac book pro").should eq(true)
    end
  end

  describe :delete do
    context "id is String" do
      it "should delete a note by its id" do
        manager = manager_factory NOTEESH_TEST_2_FILE_PATH
        manager.size.should eq(2)
        manager.delete("1")
        manager.size.should eq(1)
      end
    end

    context "id is Int" do
      it "should delete a note by its id" do
        manager = manager_factory NOTEESH_TEST_2_FILE_PATH
        manager.size.should eq(2)
        manager.delete(1)
        manager.size.should eq(1)
      end
    end

    it "should raise if id is not parsable int" do
      manager = manager_factory NOTEESH_TEST_2_FILE_PATH
      manager.size.should eq(2)
      expect_raises do
        manager.delete("aaa")
      end
    end

    it "should raise if id is out of bounds" do
      manager = manager_factory NOTEESH_TEST_2_FILE_PATH
      manager.size.should eq(2)
      expect_raises do
        manager.delete(10)
      end
    end
  end

  describe :clear do
    it "should clear the note files" do
      manager = manager_factory NOTEESH_TEST_2_FILE_PATH
      manager.size.should eq(2)
      manager.clear
      manager.size.should eq(0)
    end
  end

  describe :to_s do
    it "should return a formatted string of items in notes file" do
      manager = manager_factory NOTEESH_TEST_2_FILE_PATH
      note_string = manager.to_s
      note_string.should match(/1: Buy new phone/)
      note_string.should match(/2: Buy cookies for team/)
    end
  end
end
