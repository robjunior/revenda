# revenda

Sistema de gestão e automação para lojas de veículos.

**Landing page:** https://robjunior.github.io/revenda/

O documento do projeto está em [IDEA.md](IDEA.md). A página (`index.html`) e as imagens (`img/`)
ficam no `main` como fonte; o `deploy.sh` copia só o necessário para a branch `gh-pages`,
que é a que o GitHub Pages serve.

## Estrutura

- `IDEA.md` — conceito, módulos, etapas, tráfego pago e modelo comercial
- `index.html` + `img/` — landing page (imagens em 1x e 2x; fontes dos mockups em `img/src/`)
- `deploy.sh` — publica na branch `gh-pages`

## Publicar

```bash
./deploy.sh
```
