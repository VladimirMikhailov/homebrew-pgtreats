class PgRecall < Formula
  desc ""
  homepage ""
  url "https://github.com/mreithub/pg_recall/archive/v0.9.5.tar.gz"
  version "0.9.5"
  sha256 "ca16107682260979ed04493b3343be6e2e1093d19f2ecb092d6dc5698ba16845"

  depends_on "postgresql"

  def install
    ENV["PG_CONFIG"] = "#{Formula['postgresql'].opt_bin}/pg_config"

    system "make", "install", "DESTDIR=#{buildpath}"

    share.install Dir["usr/local/share/*"]
  end
end
