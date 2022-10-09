--
-- PostgreSQL database dump
--

-- Dumped from database version 10.16
-- Dumped by pg_dump version 10.16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: Pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pais" ("idPais", "nomePais", "siglaPais") FROM stdin;
1	Brasil	BR
\.


--
-- Data for Name: Estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estado" ("idEstado", "idPais", "nomeEstado", "siglaEstado") FROM stdin;
1	1	Maranhão	MA
\.


--
-- Data for Name: Cidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cidade" ("idCidade", "idEstado", "nomeCidade", "descricaoCidade") FROM stdin;
1	1	Sao Luís	Cidade do Amor
\.


--
-- Data for Name: Pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pessoa" ("idPessoa", nome, "codigoAcesso", email) FROM stdin;
1	Giovani Correa	00000000000	gmurilo@gmail.com
\.


--
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cliente" ("idCliente") FROM stdin;
1
\.


--
-- Data for Name: FormaPagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FormaPagamento" ("idFormaPagamento", "grupoFormaPagamento", "nomeFormaPagamento") FROM stdin;
1	CC	Visa
2	CC	Mastercard
3	MO	Espécie
4	IN	Boleto
5	PX	Pix
\.


--
-- Data for Name: Cliente_FormaPagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cliente_FormaPagamento" ("idClienteFormaPagamento", "idCliente", "idFormaPagamento", "numeroForma", identificacao, validade) FROM stdin;
\.


--
-- Data for Name: Configuracoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Configuracoes" ("chaveCfg", "valorCfg", description, "tipoValorCfg") FROM stdin;
\.


--
-- Data for Name: TipoLogradouro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoLogradouro" ("idTipoLogradouro", "nomeTipoLogradouro", "siglaTipoLogradouro") FROM stdin;
1	Rua	R
2	Avenida	Av
\.


--
-- Data for Name: Logradouro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Logradouro" ("idLogradouro", "idCidade", "idTipoLogradouro", "nomeLogradouro", "cepLogradouro") FROM stdin;
1	1	2	Neiva Moreira	65071-383
\.


--
-- Data for Name: Pessoa_Endereco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pessoa_Endereco" ("idPessoaEndereco", "idPessoa", "idLogradouro", "complementoEndereco", "numeroEndereco", "tagEndereco", "enderecoPadrao", "estaAtivo", "tipoEndereco") FROM stdin;
1	1	1	COND. Parque das Águas	S/N	CASA	1	1	R
\.


--
-- Data for Name: Pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pedido" ("idPedido", "idPessoaEndereco", "dataPedido", "situacaoPedido", "valorProdutos", desconto, "valorFrete", "valorPedido") FROM stdin;
\.


--
-- Data for Name: Transportadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transportadora" ("idTransportadora", "descricaoTransportadora") FROM stdin;
\.


--
-- Data for Name: Entrega; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Entrega" ("idEntrega", "idTransportadora", "idPedido", "codigoEntrega", "situacaoEntrega") FROM stdin;
\.


--
-- Data for Name: EntregaEtapas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EntregaEtapas" ("idEntregaEtapa", "idEntrega", "horarioRecebimento", "horarioEntrega", "Detalhes") FROM stdin;
\.


--
-- Data for Name: Fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Fornecedor" ("idFornecedor") FROM stdin;
\.


--
-- Data for Name: Produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Produto" ("idProduto", "idFornecedor") FROM stdin;
\.


--
-- Data for Name: Estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estoque" ("idProduto", quantidade) FROM stdin;
\.


--
-- Data for Name: Revenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Revenda" ("idRevenda") FROM stdin;
\.


--
-- Data for Name: Revenda_Produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Revenda_Produto" ("idRevenda", "idProduto", "estaAtivo") FROM stdin;
\.


--
-- Data for Name: Estoque_Revenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estoque_Revenda" ("idRevenda", "idProduto", quantidade, "quantidadeMinima") FROM stdin;
\.


--
-- Data for Name: Pedido_Pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pedido_Pagamento" ("idPedidoPagamento", "idPedido", "idFormaPagamento", "previsaoPagamento", "horarioPagamento", "situacaoPagamento") FROM stdin;
\.


--
-- Data for Name: Pedido_Produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pedido_Produto" ("idProduto", "idPedido", quantidade, valor) FROM stdin;
\.


--
-- Data for Name: Pessoa_Fisica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pessoa_Fisica" ("idPessoa", cpf, "dataNascimento", "dataFalescimento", sexo, "generoSexual", "possueDeficiencia") FROM stdin;
1	66633249349	1982-06-24	\N	M	\N	\N
\.


--
-- Data for Name: Pessoa_Juridica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pessoa_Juridica" ("idPessoa", cnpj, "inscricaoEstadual", "inscricaoMunicipal", "empresaAtiva") FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

