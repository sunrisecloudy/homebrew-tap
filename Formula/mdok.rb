class Mdok < Formula
  desc "Markdown-native API testing: executable .md API workflows"
  homepage "https://github.com/sunrisecloudy/mdok"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "b74b0ab117d6ffc13a1e2f17d376fba5ac73f6b933496ccdc39d2c11de0b5cc7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7ec3f1691676872843cd9b46eb714ff7e4573bb5d1ab18d161de83211daf574e"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b43b64058dd37151d3fa6f4f17748df956760fe57d2051631da3b61725eecc5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sunrisecloudy/mdok/releases/download/v0.2.0/mdok-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7bf8a3f0535629fd18a4fbe8394949c4e35de6767a503b65ab1eaf56a6b300bf"
    end
  end

  def install
    bin.install "mdok"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdok version")
  end
end
