class Lemonup < Formula
  desc "Cross Platform TUI World of Warcraft Addon Manager "
  homepage "https://github.com/archcorsair/lemonup"
  version "0.0.8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.10/lemonup-macos-arm64"
    sha256 "ce2410b34fdb10f2d1525c9fe8d2dc8eac5b973b950d630ff72d25f2bdeea238"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.10/lemonup-macos-x64"
    sha256 "2415cf0884dae6f58ba1a3b0c36269c5b16dc4ac874d72597987651e13d3a0de"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v0.0.10/lemonup-linux-x64"
    sha256 "fa01cb059809d28b82ccba008860340f824804c29fb28227bb9ed179047c7bb3"
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
