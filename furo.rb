# frozen_string_literal: false
# Furo
class Furo < Formula
  desc "Furo CLI"
  homepage "https://furo.pro"
  url "https://github.com/eclipse/eclipsefuro/archive/v1.27.1.tar.gz"
  sha256 "7b59defc1c202787e1093694544ff1720a745e90e098f71ad570270ffa6c36a8"
  license "MIT"
  depends_on "go"
  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/eclipse/eclipsefuro").install buildpath.children

    cd "src/github.com/eclipse/eclipsefuro/furo" do
      system "go", "build", "-o", bin/"furo", "."
    end
  end

  test do
    system "#{bin}/furo", "--help"
  end
end
