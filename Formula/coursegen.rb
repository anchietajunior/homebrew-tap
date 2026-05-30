class Coursegen < Formula
  desc "Orquestra a producao de aulas de cursos com agentes de IA (uma aula por sessao isolada)"
  homepage "https://github.com/anchietajunior/coursegen"
  url "https://github.com/anchietajunior/coursegen/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1a24a1d2625b3876a3f822b98362bd12888e244fdc1e41ebb54b2b3a5e38a6af"
  license "MIT"
  head "https://github.com/anchietajunior/coursegen.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w",
           "-o", bin/"coursegen", "./cmd/coursegen"
  end

  def caveats
    <<~TEXT
      Rode `coursegen setup` para instalar as skills de planejamento no seu
      agente e escolher o agente padrao. Depois: `coursegen generate lessons`.
    TEXT
  end

  test do
    assert_match "coursegen 0.1.2", shell_output("#{bin}/coursegen version")
  end
end
