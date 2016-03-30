class PgDirtyread < Formula
  desc "A PostgreSQL extension for reading deleted rows"
  homepage "https://github.com/VladimirMikhailov/pg_dirtyread/"
  url "https://github.com/VladimirMikhailov/pg_dirtyread/archive/1.0.0.tar.gz"
  version "1.0.0"
  sha256 "e2937e22fea59941a1220c34208b8f26f6c4d5c78f20458f0cd8d7b1f73cc9f2"

  depends_on "postgresql"

  def install
    ENV["PG_CONFIG"] = "#{Formula['postgresql'].opt_bin}/pg_config"

    system "make", "install", "DESTDIR=#{buildpath}"

    (share/"postgresql/extension").install("pg_dirtyread.control", "pg_dirtyread--1.0.sql")
  end
end
