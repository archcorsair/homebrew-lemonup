class Lemonup < Formula
  desc "Cross-platform TUI World of Warcraft addon manager"
  homepage "https://github.com/archcorsair/lemonup"
  version "2.6.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-arm64"
    sha256 "7c81b8cc3ae3aad8e8d39a56726522639dfd9da59359ced3cec18ffc1e22c743"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-macos-x64"
    sha256 "f77c344c887fd88df227d8f4c47656b4c9a309b46286e1088afca0fd9e3510dc"
  elsif OS.linux?
    url "https://github.com/archcorsair/lemonup/releases/download/v#{version}/lemonup-linux-x64"
    sha256 "94f7a74566f193b42cfc79147c5e13bf7bfd8898eba37083b47a73a84e40256b"
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
