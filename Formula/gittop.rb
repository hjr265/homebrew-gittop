class Gittop < Formula
  desc "Beautiful terminal UI for visualizing Git repository statistics"
  homepage "https://github.com/hjr265/gittop"
  url "https://github.com/hjr265/gittop/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "f6d0a81e8582453b44bb8dc7dcbf7dce51c9889e5382b61fb4597910ee388fc3"
  license "BSD-3-Clause"

  depends_on "go" => :build

  def install
    ENV["GOTOOLCHAIN"] = "auto"
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X main.version=v#{version}"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match "gittop v#{version}", shell_output("#{bin}/gittop --version")
    output = shell_output("#{bin}/gittop /tmp/nonexistent 2>&1", 1)
    assert_match "not a git repository", output
  end
end
