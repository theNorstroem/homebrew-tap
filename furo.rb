# frozen_string_literal: false
# Furo
class Furo < Formula
  desc "Furo CLI"
  homepage "https://furo.pro"
  url "https://github.com/eclipse/eclipsefuro/archive/v1.30.1.tar.gz"
  sha256 "726c29e390056a42472d3625a24fdfa9b3d305bec614e0aca904c276b4927f21"
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
