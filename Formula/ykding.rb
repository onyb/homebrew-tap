class Ykding < Formula
  desc "Sound and notification when your YubiKey waits for a touch"
  homepage "https://github.com/onyb/ykding"
  url "https://github.com/onyb/ykding/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7a8612a36526448e160067e38985fb1fe9eea5b98eadf84082aa17336d897c31"
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
