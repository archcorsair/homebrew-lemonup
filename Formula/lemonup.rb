class Lemonup < Formula
  desc "Backup tool for TukUI and ElvUI"
  homepage "https://github.com/archcorsair/lemonup"
  version "0.0.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.2/lemonup-macos-arm64"
    sha256 "REPLACE_WITH_MACOS_ARM64_SHA"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.2/lemonup-macos-x64"
    sha256 "REPLACE_WITH_MACOS_X64_SHA"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.2/lemonup-linux-x64"
    sha256 "REPLACE_WITH_LINUX_SHA"
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
