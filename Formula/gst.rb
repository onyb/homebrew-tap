class Gst < Formula
  desc "Prepare Indian GST returns offline: validate workbooks, generate upload JSON"
  homepage "https://github.com/onyb/gst"
  url "https://github.com/onyb/gst/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f95de79066bf6ed7fbd17f28be399eb6f61a123175a246e6b7c02e41d257c6bf"
  license "MPL-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/gst-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gst --version")
  end
end
