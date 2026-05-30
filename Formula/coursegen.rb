class Coursegen < Formula
  desc "Orquestra a producao de aulas de cursos com agentes de IA (uma aula por sessao isolada)"
  homepage "https://github.com/anchietajunior/coursegen"
  url "https://github.com/anchietajunior/coursegen/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "294d1e143e73d23c5a0b6b38276aa858304db578654fdf8c9f5c22f222ce989c"
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
    assert_match "coursegen 0.1.1", shell_output("#{bin}/coursegen version")
  end
end
