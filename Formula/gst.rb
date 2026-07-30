class Gst < Formula
  desc "Prepare Indian GST returns offline: validate workbooks, generate upload JSON"
  homepage "https://github.com/onyb/gst"
  url "https://github.com/onyb/gst/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "dd19ed21316eb0d9df2c0846091871ffb4f3c91f44a0fe0348173fa6a1004c37"
  license "MPL-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/gst-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gst --version")
  end
end
