class Lemonup < Formula
  desc "Cross Platform TUI World of Warcraft Addon Manager "
  homepage "https://github.com/archcorsair/lemonup"
  version "0.0.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.8/lemonup-macos-arm64"
    sha256 "f21ac16b762ef4a4fae2254d9985af5377dd873cf851a40df23072ed15c2f558"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.8/lemonup-macos-x64"
    sha256 "a8d8aa9f49f9cefe80a135c0d8b83cca55dcb9da1c17582ed192f67ba80c08af"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.8/lemonup-linux-x64"
    sha256 "c59ac0e7bc71446b4fd3c6cc32a4685014bd1e94c6ebf3b02d51fc4fc777033d"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "lemonup-macos-arm64" => "lemonup"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "lemonup-macos-x64" => "lemonup"
    elsif OS.linux?
      bin.install "lemonup-linux-x64" => "lemonup"
    end

    if OS.mac?
      system "codesign", "--force", "--deep", "--sign", "-", "#{bin}/lemonup"
    end
  end

  test do
    system "#{bin}/lemonup", "--version"
  end
end
