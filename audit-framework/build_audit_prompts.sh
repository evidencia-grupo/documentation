#!/usr/bin/env bash
set -euo pipefail

AUDIT_DIR="${1:-$HOME/audit-evidencia-$(date +%Y%m%d)}"
PROMPTS_DIR="./prompts"
BUILD_DIR="$AUDIT_DIR/compiled_prompts"

mkdir -p "$BUILD_DIR"
mkdir -p "$AUDIT_DIR/findings"
mkdir -p "$AUDIT_DIR/coverage"
mkdir -p "$AUDIT_DIR/work"

echo "==> Inicializando diretório de auditoria: $AUDIT_DIR"

# Função para montar o prompt da fase concatenando o CORE
assemble_phase() {
    local phase_num="$1"
    local phase_file="$PROMPTS_DIR/phase_${phase_num}.md"
    local output_file="$BUILD_DIR/prompt_fase_${phase_num}.md"

    if [[ -f "$phase_file" ]]; then
        cat "$PROMPTS_DIR/CORE.md" > "$output_file"
        echo -e "\n\n---\n\n" >> "$output_file"
        cat "$phase_file" >> "$output_file"
        echo "✔ Compilado: Fase $phase_num -> $output_file"
    else
        echo "⚠ Aviso: Arquivo $phase_file não encontrado."
    fi
}

# Compila as 7 fases
for i in {0..6}; do
    assemble_phase "$i"
done

echo "==> Prompts prontos para execução em: $BUILD_DIR"
echo "==> Próximo passo: execute a Fase 0 em sua ferramenta de agente (AGY/Claude/Gemini)."
