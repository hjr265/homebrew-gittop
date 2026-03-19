class Gittop < Formula
  desc "Beautiful terminal UI for visualizing Git repository statistics"
  homepage "https://github.com/hjr265/gittop"
  url "https://github.com/hjr265/gittop/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "5afaf1ee423bb23b7e7cbe335bdbf2bc83da848caf2eeac82284efbe80ab3b4b"
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
