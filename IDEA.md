A ideia é desenvolver um sistema de gestão e automação para lojas de veículos, começando pelo problema mais urgente da loja: cadastrar os carros uma única vez e facilitar a publicação e atualização dos anúncios em diferentes canais — inclusive o catálogo que alimenta os anúncios patrocinados. Depois, o projeto evolui para centralizar os leads e se tornar o sistema operacional da loja.

A estratégia é construir um produto próprio, aproveitando ferramentas open source e APIs oficiais sempre que possível, em vez de desenvolver tudo do zero.

## A evolução do projeto

### 1. Cadastro central de veículos

Primeira etapa · MVP · módulo **Atlas**

Um único cadastro por veículo, com fotos, preço, quilometragem, versão, descrição e status do estoque. Esse cadastro será a fonte oficial dos dados.

### 2. Centralização dos anúncios

OLX · Mercado Livre · Instagram · Facebook · catálogo patrocinado

Segunda etapa · MVP · módulo **Fama**

Publicar, atualizar preço, sincronizar informações e retirar anúncios quando um carro for vendido. O mesmo registro também gera o feed que alimenta o catálogo de anúncios patrocinados. Cada canal terá sua própria integração e suas limitações.

### 3. Gestão centralizada de leads

Terceira etapa · MVP · módulos **Argos** e **Hermes**

WhatsApp · Instagram Direct · Messenger · marketplaces

Reunir contatos, associar cada interessado ao veículo, distribuir leads aos vendedores e acompanhar o atendimento.

### 4. Sistema completo da loja

Quarta etapa · módulo **Ágora**

Compras e entrada de veículos, clientes, propostas, vendas, comissões, despesas, documentos, financeiro e relatórios gerenciais.

## Os cinco módulos

A entrega é dividida em quatro etapas. A arquitetura por baixo é feita de cinco módulos, e cada etapa entrega um ou mais deles.

| Módulo          | Papel       | Entra na | O que faz                                                            |
| --------------- | ----------- | -------- | -------------------------------------------------------------------- |
| 01 · **Atlas**  | Núcleo      | Etapa 01 | Registro único do veículo: fotos, preço, quilometragem, versão, opcionais e status |
| 02 · **Fama**   | Saída       | Etapa 02 | Publica, atualiza e retira anúncios; gera o feed do catálogo patrocinado |
| 03 · **Argos**  | Entrada     | Etapa 03 | Reúne os contatos que chegam de todos os canais                      |
| 04 · **Hermes** | Diálogo     | Etapa 03 | Caixa de entrada, atribuição ao vendedor e histórico por veículo     |
| 05 · **Ágora**  | Coordenação | Etapa 04 | Compras, vendas, comissões, financeiro e indicadores                 |

Os nomes vêm da mitologia grega porque cada módulo tem um papel definido: Atlas sustenta, Fama leva a voz do veículo para fora, Argos vê tudo o que chega, Hermes conversa e Ágora negocia.

### 01 · Atlas — núcleo

**O que é.** O registro do veículo e a fonte oficial dos dados da loja.

**Escopo.** Um registro por veículo, com fotos, preço, quilometragem, versão, opcionais, descrição, placa, data de entrada e responsável. Histórico do que mudou — preço, responsável e status do estoque (disponível, reservado, vendido, devolvido). Regras mínimas do que o veículo precisa ter para poder ser anunciado.

**Fora do escopo.** Publicar (Fama), receber contato (Argos), conversar (Hermes), fechar a venda (Ágora).

**O que é próprio.** A semântica de veículo — versão, placa, avaliação de troca — e o vínculo entre o registro e o anúncio.

### 02 · Fama — saída

**O que é.** Tudo o que leva o veículo para fora da loja: canais, catálogo patrocinado e feed.

**Escopo.** Publicar, atualizar preço e retirar anúncios nos canais prioritários. Gerar o feed que alimenta o catálogo de anúncios patrocinados. Registrar, por canal, o que foi publicado e quando — para saber o que está no ar e o que falhou.

**Fora do escopo.** Comprar mídia (orçamento, lance, público, criativo). Responder mensagem (Hermes).

**O que é próprio.** As integrações com os canais, o feed do catálogo e a noção de "anúncio sincronizado" ligada ao registro do veículo.

### 03 · Argos — entrada

**O que é.** A porta de entrada: reúne o que chega de fora e normaliza antes de virar conversa.

**Escopo.** Receber contato de WhatsApp, Instagram Direct, Messenger, OLX, Mercado Livre e formulários do catálogo. Identificar de qual canal e de qual veículo veio cada contato. Deduplicar: o mesmo interessado que escreveu em dois canais é uma pessoa, não duas.

**Fora do escopo.** Atender e negociar (Hermes). Medir custo de mídia (Fama, no custo por canal).

**O que é próprio.** A deduplicação por pessoa, a origem do contato e o vínculo com o veículo — a captação tem requisitos que uma caixa de entrada não tem.

### 04 · Hermes — diálogo

**O que é.** A conversa com o interessado, do primeiro "boa tarde" até o test drive agendado.

**Escopo.** Caixa de entrada única, com todas as conversas no mesmo lugar. Atribuição ao vendedor e histórico por veículo. Respostas prontas, etiquetas e etapas do atendimento.

**Fora do escopo.** Captar (Argos) e registrar a venda (Ágora). O Hermes conduz; não fecha.

**O que é próprio.** O painel do veículo ao lado da conversa, a etapa do atendimento e a nota interna — o que transforma um chat genérico em atendimento de revenda.

### 05 · Ágora — coordenação

**O que é.** O sistema da loja: onde a venda é registrada e o mês é fechado.

**Escopo.** Compras e entrada de veículos, clientes, propostas, vendas, comissões, despesas e documentos. Financeiro e indicadores gerenciais. O custo por canal: cruzar investimento, leads e vendas para chegar no CAC.

**Fora do escopo.** Publicar anúncio (Fama) e conduzir conversa (Hermes). O Ágora lê o que os outros módulos produzem.

**O que é próprio.** A lógica de revenda: comissão por venda atribuída, custo por canal, margem por veículo.

## Tráfego pago dentro do MVP

Mídia paga não corrige estoque desatualizado: ela amplia o alcance do erro. Por isso o tráfego pago entra no MVP pelo lado do dado — alimentando a mídia com o estoque oficial e medindo o retorno — e não pelo lado da compra de mídia.

O que entra no MVP:

- **Feed do catálogo.** O mesmo registro do veículo gera o feed estruturado que alimenta o catálogo de anúncios. Quando o preço muda ou o veículo é vendido, o feed é reescrito junto com os anúncios.
- **Origem do clique.** Cada canal recebe link com identificação própria, para que o lead chegue sabendo de onde veio e qual veículo gerou o interesse.
- **Custo por canal.** O investimento do mês é lançado por canal. No começo é manual; a importação por API entra quando a conta permitir.
- **CAC por canal e por veículo.** Investimento dividido pelas vendas, com o custo por lead no meio do caminho. É o número que orienta a alocação de verba no mês seguinte.

No MVP, os leads considerados no CAC são os contatos que chegam dos próprios canais e dos formulários. A captura unificada de WhatsApp, Direct e Messenger entra na etapa 3, junto com a distribuição para os vendedores.

O que fica fora do MVP:

- Criação e gestão de campanha: orçamento, lance, público e criativo. O sistema entrega o dado e mede o retorno; não substitui o gestor de mídia. Isso é outro produto, com outra superfície de erro, e não resolve o problema urgente da loja.

O que cada canal permite hoje:

| Canal          | Situação                                                                                                                    | O que isso significa                                                                          |
| -------------- | --------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| Meta           | O catálogo de inventário automotivo é um tipo de catálogo documentado, com feed estruturado por veículo                      | É o caminho mais direto, porque o feed é o próprio registro do estoque. Elegibilidade é por conta e por país, precisa ser confirmada |
| Mercado Livre  | Product Ads tem API oficial de campanhas, orçamento e métricas                                                               | Só liga quando a loja já tem reputação amarela ou superior, 15 dias de conta, vendas mínimas e nenhuma fatura vencida |
| Google         | O formato vehicle ads não está disponível no Brasil (Austrália, Canadá, Japão e Estados Unidos; beta aberto na Europa)        | Fora do escopo. Não deve entrar na proposta                                                   |
| OLX            | Destaque e turbo são vendidos dentro da OLX, sem API pública de anúncios                                                      | Parceria ou trabalho manual, como já acontece na publicação                                   |

## Modelo comercial que discutimos

| Item                                   | Proposta inicial                                                                 |
| -------------------------------------- | -------------------------------------------------------------------------------- |
| Desenvolvimento do MVP                 | R$ 3.500/mês por 3 meses                                                         |
| Total inicial                          | R$ 10.500                                                                        |
| Licença + suporte após a implantação   | Cerca de R$ 2.000/mês, com exclusividade do sistema para a loja enquanto o suporte estiver sendo pago |
| Infraestrutura e APIs pagas            | Cobradas separadamente                                                           |
| Variável por venda atribuída           | A definir, após o piloto e conforme o volume                                     |
| Sem limites                            | Usuários, leads e cadastros de veículos sem limite                               |

Os valores são uma proposta de negociação, não preços de mercado validados. O MVP entrega o cadastro, a publicação nos canais, o catálogo patrocinado, o custo por canal e a gestão de leads; a gestão de campanha de mídia não está incluída.

## O objetivo estratégico

Não é simplesmente criar um publicador de anúncios. É transformar o processo manual da loja em um fluxo integrado:

Atlas (cadastrar) → Fama (publicar nos canais e no catálogo) → Argos (receber os interessados) → Hermes (conduzir a negociação) → Ágora (registrar a venda, atualizar estoque, indicadores e custo por canal).

O primeiro marco concreto seria provar que um veículo cadastrado uma única vez consegue ser publicado e atualizado nos canais prioritários com segurança — e que o custo de cada canal pode ser medido. A partir daí, expandimos para leads e gestão completa da loja.

---

## Anexo · referências técnicas (interno)

Esta parte não vai para o cliente. Serve para quem vai construir.

| Módulo | Referência | Licença | Como usar |
| ------ | ---------- | ------- | --------- |
| Atlas  | Akeneo CE (família de atributos) + ERPNext (item de estoque) | OSL-3.0 · GPLv3 | Só conceito |
| Fama   | Postiz (publicação em redes) + conceito de canal do Akeneo CE | AGPL-3.0 · OSL-3.0 | Postiz como serviço separado; Akeneo só conceito |
| Argos  | Chatwoot (conectores) + Evolution API (WhatsApp) | MIT · Apache-2.0 | Integração por API; Evolution tem risco de bloqueio |
| Hermes | Chatwoot | MIT (exceto `enterprise/`) | Rodar e integrar |
| Ágora  | ERPNext (escopo de ERP) + Metabase (indicadores) | GPLv3 · AGPL-3.0 | Rodar separado, sem embutir |

**Licenças.** MIT e Apache-2.0 são permissivas. GPLv3 e OSL-3.0 são copyleft forte: rodar como serviço separado é tranquilo, embutir obriga a abrir o derivado. AGPL-3.0 alcança uso em rede — por isso Postiz e Metabase entram isolados. Directus ficou fora por usar BUSL-1.1, que não é licença aberta.

**n8n.** Usa a Sustainable Use License, que permite automatizar para clientes desde que o cliente não crie nem edite os fluxos. A condição de operação: o n8n roda atrás do produto, invisível, e nenhum usuário da loja monta fluxo. Se o sistema virar produto em que cada loja cria as próprias automações, passa a exigir acordo comercial com a n8n.

**O que é código nosso.** Os cinco módulos vivem no monorepo próprio (React, TypeScript, NestJS, PostgreSQL). Postiz, Chatwoot, Metabase e n8n rodam como serviços à parte; ERPNext não entra. Nenhum módulo fala direto com ferramenta externa: toda chamada passa por uma camada nossa, que guarda o estado e permite trocar o fornecedor sem mexer nas regras da loja.

**Decisão em aberto.** A caixa de entrada de referência já faz captação e conversa. Se ele for adotado, Argos e Hermes podem virar um único serviço na prática. A separação continua valendo no desenho porque as duas responsabilidades têm requisitos diferentes — deduplicação, origem e custo vivem no Argos e não existem numa caixa de entrada. A decisão fica para o início da etapa 03, quando o acesso aos canais estiver confirmado.

**Alternativa em avaliação.** UnoPim (MIT, 2024) resolve o modelo de atributos com licença permissiva, mas não foi avaliado.
