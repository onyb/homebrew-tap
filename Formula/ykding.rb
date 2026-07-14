class Ykding < Formula
  desc "Sound and notification when your YubiKey waits for a touch"
  homepage "https://github.com/onyb/ykding"
  url "https://github.com/onyb/ykding/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "65678dd8ad7bc7d3cb370dd8f32d7c0ef5eae900c8e182712961f353faca340d"
  license "MIT"

  def install
    bin.install "ykding"
  end

  service do
    run [opt_bin/"ykding", "run"]
    keep_alive true
    log_path var/"log/ykding.log"
    error_log_path var/"log/ykding.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ykding version")
  end
end
