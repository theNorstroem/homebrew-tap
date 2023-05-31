# frozen_string_literal: false
# Furo
class Furo < Formula
  desc "Furo CLI"
  homepage "https://furo.pro"
  url "https://github.com/eclipse/eclipsefuro/archive/v1.38.0.tar.gz"
  sha256 "ffe199028a0a8bc1baf3a3824e00b97b4a5e8815a0828d1c97fbe033e5f18322"
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
