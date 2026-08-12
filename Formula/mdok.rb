class Mdok < Formula
  desc "Turn Markdown API examples into executable workflows"
  homepage "https://github.com/sunrisecloudy/mdok"
  url "https://github.com/sunrisecloudy/mdok/releases/download/v0.1.0/mdok-0.1.0-source.tar.gz"
  sha256 "c9df3ab5c1eba4b9b75c6493175cf8d5c0b4cf2fb2e541824e092dc9f6d4d320"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"
  depends_on "zlib"

  def install
    ENV["OPENSSL_ROOT_DIR"] = formula_opt_prefix("openssl@3")
    ENV["ZLIB_ROOT"] = formula_opt_prefix("zlib")
    system "cargo", "install", *std_cargo_args(path: "crates/mdok-cli")
  end

  test do
    assert_match "mdok 0.1.0", shell_output("#{bin}/mdok --version")
  end
end
