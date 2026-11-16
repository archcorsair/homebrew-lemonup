class Lemonup < Formula
  desc "Cross-platform TUI World of Warcraft addon manager"
  homepage "https://github.com/archcorsair/lemonup"
  version "2.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-arm64"
    sha256 "f406ddcc7fb17cfe324cdd16aac6bf22e172fb0f3b38db89c618027c4a3a77d4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-x64"
    sha256 "86d7593eab560b387efdf7f7f3be918d3ed8c7422f1701ea99661dce56bb9662"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-linux-x64"
    sha256 "e63e9a75518de01fb8f5d687c1c200226eed085730171de889e915de6eb2016a"
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
