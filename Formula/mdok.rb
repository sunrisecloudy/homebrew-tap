class Mdok < Formula
  desc "Markdown-native API testing: executable .md API workflows"
  homepage "https://github.com/sunrisecloudy/mdok"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "#{AARM}"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "#{AINT}"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "#{LARM}"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "#{LINT}"
    end
  end

  def install
    bin.install "mdok"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/mdok version")
  end
end
