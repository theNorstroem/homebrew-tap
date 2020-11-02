# frozen_string_literal: false

# Spectools
class Spectools < Formula
  desc "Furo spectools utility toolkit around the furo specs"
  homepage "https://github.com/theNorstroem/spectools/blob/master/README.md"
  url "https://github.com/theNorstroem/spectools/archive/v1.18.0.tar.gz"
  sha256 "409c32fc18c637229903f66d699e9deb6672387d852e0a5a1180a978eadc5b52"
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
