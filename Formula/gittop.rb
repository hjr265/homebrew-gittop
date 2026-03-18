class Gittop < Formula
  desc "Beautiful terminal UI for visualizing Git repository statistics"
  homepage "https://github.com/hjr265/gittop"
  url "https://github.com/hjr265/gittop/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "86eb8de005ec2e708c2508ce6ebc61bf8f62e11f92b9154eda15f99f1e995072"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    ENV["GOTOOLCHAIN"] = "auto"
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/gittop /tmp/nonexistent 2>&1", 1)
    assert_match "not a git repository", output
  end
end
