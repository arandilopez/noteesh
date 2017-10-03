require "./spec_helper"

describe "Cli" do
  it "should have a run method" do
    Noteesh::Cli.new.responds_to?(:run).should be_true
  end
end
