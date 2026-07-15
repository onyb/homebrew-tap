class Ykding < Formula
  desc "Sound and notification when your YubiKey waits for a touch"
  homepage "https://github.com/onyb/ykding"
  url "https://github.com/onyb/ykding/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ecb7d23a7a0a7371c1660ca39cff522b8a9e488ad6a843f139043dcb41e720a3"
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
