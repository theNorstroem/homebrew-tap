# frozen_string_literal: false

# Spectools
class Spectools < Formula
  desc "Furo spectools utility toolkit around the furo specs"
  homepage "https://github.com/theNorstroem/spectools/blob/master/README.md"
  url "https://github.com/theNorstroem/spectools/archive/v1.11.1.tar.gz"
  sha256 "5f9cde1c9243f8e199abf6951c58abb40cbbba8a8cbebe449c7d44f0c6f63809"
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
