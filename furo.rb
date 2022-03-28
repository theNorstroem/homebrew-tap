# frozen_string_literal: false
# Furo
class Furo < Formula
  desc "Furo CLI"
  homepage "https://furo.pro"
  url "https://github.com/eclipse/eclipsefuro/archive/v1.35.0.tar.gz"
  sha256 "3533a1a0609ba974bb35eb45a30d557260950cfebf6fb90386f88f8545be9ca6"
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
