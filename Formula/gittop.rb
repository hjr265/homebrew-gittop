class Gittop < Formula
  desc "A beautiful terminal UI for visualizing Git repository statistics"
  homepage "https://github.com/hjr265/gittop"
  url "https://github.com/hjr265/gittop/archive/v0.2.0.tar.gz"
  sha256 "cf3655145dcb93f5946e2f778bef264c9194dbc58daad1f41c97ed364764414f"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/gittop /tmp/nonexistent 2>&1", 1)
    assert_match "not a git repository", output
  end
end
