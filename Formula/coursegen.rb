class Coursegen < Formula
  desc "Orquestra a producao de aulas de cursos com agentes de IA (uma aula por sessao isolada)"
  homepage "https://github.com/anchietajunior/coursegen"
  url "https://github.com/anchietajunior/coursegen/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "40379b447bfc0a1541c070dcfc09bdaf04d7e4bb99ea26bed10e0e6619cd4911"
  license "MIT"
  head "https://github.com/anchietajunior/coursegen.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-mod=vendor", "-trimpath", "-ldflags", "-s -w",
           "-o", bin/"coursegen", "./cmd/coursegen"
  end

  def caveats
    <<~TEXT
      Rode `coursegen setup` para instalar as skills de planejamento no seu
      agente e escolher o agente padrao. Depois: `coursegen generate lessons`.
    TEXT
  end

  test do
    assert_match "coursegen 0.1.0", shell_output("#{bin}/coursegen version")
  end
end
