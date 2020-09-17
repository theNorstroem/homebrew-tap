# frozen_string_literal: false

# Spectools
class Spectools < Formula
  desc "Furo spectools utility toolkit around the furo specs"
  homepage "https://github.com/theNorstroem/spectools/blob/master/README.md"
  url "https://github.com/theNorstroem/spectools/archive/v1.6.1.tar.gz"
  sha256 "fd8d37b9a07efbae93997e298b47f05213b95593f4a9c41ac449c7458a1d9a4e"
  license "MIT"
  depends_on "go"
  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/theNorstroem/spectools").install buildpath.children
    cd "src/github.com/theNorstroem/spectools" do
      system "go", "build", "-o", bin/"spectools", "."
    end
  end

  test do
    system "#{bin}/spectools", "--help"
  end
end
