--
-- PostgreSQL database dump
--

\restrict spcxsDmRqjskNfY8AVdkQ5BuIEbTXzbaY8RfgpWNQdd1b8WDVOThdxqRaOPa55Q

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    serie character varying(10) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    id integer NOT NULL,
    data date NOT NULL,
    descricao character varying(200) NOT NULL,
    itens_utilizados text
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cardapio_id_seq OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_id_seq OWNED BY public.cardapio.id;


--
-- Name: desperdicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desperdicio (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    peso_descartado numeric(8,2) NOT NULL,
    item_mais_rejeitado character varying(100)
);


ALTER TABLE public.desperdicio OWNER TO postgres;

--
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    quantidade numeric(100,0) NOT NULL,
    validade date NOT NULL,
    item character varying(100)
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estoque_id_seq OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: item_restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_restricao (
    id_restricao integer NOT NULL,
    id_estoque integer NOT NULL
);


ALTER TABLE public.item_restricao OWNER TO postgres;

--
-- Name: merenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merenda (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    qtd_produzida numeric(8,2) NOT NULL
);


ALTER TABLE public.merenda OWNER TO postgres;

--
-- Name: participacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacao (
    id_aluno integer NOT NULL,
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL
);


ALTER TABLE public.participacao OWNER TO postgres;

--
-- Name: restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao (
    id integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.restricao OWNER TO postgres;

--
-- Name: restricao_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao_aluno (
    id_aluno integer NOT NULL,
    id_restricao integer NOT NULL
);


ALTER TABLE public.restricao_aluno OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restricao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restricao_id_seq OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restricao_id_seq OWNED BY public.restricao.id;


--
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- Name: cardapio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio ALTER COLUMN id SET DEFAULT nextval('public.cardapio_id_seq'::regclass);


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: restricao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao ALTER COLUMN id SET DEFAULT nextval('public.restricao_id_seq'::regclass);


--
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, nome, serie) FROM stdin;
1	Alunos A	1oB
2	Aluno B	2oA
3	Aluno C	1oA
4	Alunos A	1oB
5	Aluno B	2oA
6	Aluno C	1oA
7	Ana Clara Silva	6 ano A
8	Bruno Henrique Santos	6 ano A
9	Carla Mendes Oliveira	6 ano B
10	Daniel Costa Ribeiro	6 ano B
11	Eduarda Lima Martins	7 ano A
12	Felipe Gabriel Souza	7 ano A
13	Gabriela Fernandes Lima	7 ano B
14	Heitor Alves Pereira	7 ano B
15	Isabela Rocha Nascimento	8 ano A
16	Joao Pedro Carvalho	8 ano A
17	Kauan Dias Barbosa	8 ano B
18	Lara Beatriz Castro	8 ano B
19	Lucas Gabriel Araujo	9 ano A
20	Mariana Cardoso Freitas	9 ano A
21	Nicolas Moreira Machado	9 ano B
22	Olivia Monteiro Ramos	9 ano B
23	Paulo Roberto Teixeira	1 EM A
24	Rafaela Gomes Vieira	1 EM A
25	Samuel Victor Correia	1 EM B
26	Sofia Helena Duarte	1 EM B
27	Thiago Augusto Nunes	2 EM A
28	Valentina Soares Campos	2 EM A
29	Vinicius Eduardo Marques	2 EM B
30	Yasmin Alessandra Lopes	2 EM B
31	Arthur Guilherme Santana	3 EM A
32	Beatriz Vitoria Medeiros	3 EM A
33	Caio Felipe Andrade	3 EM B
34	David Lucca Silveira	3 EM B
35	Emma Carolina Farias	6 ano A
36	Enzo Gabriel Guimaraes	6 ano A
37	Fernanda Luisa Peixoto	6 ano B
38	Gabriel Vinicius Franco	6 ano B
39	Giovanna Maria Aguiar	7 ano A
40	Guilherme Henrique Fonseca	7 ano A
41	Igor Matheus Prado	7 ano B
42	Julia Eduarda Xavier	7 ano B
43	Leonardo Augusto Resende	8 ano A
44	Livia Maria Borges	8 ano A
45	Luiz Felipe Monteiro	8 ano B
46	Manuela Vitoria Assis	8 ano B
47	Matheus Henrique Bueno	9 ano A
48	Natalia Cristina Antunes	9 ano A
49	Pedro Henrique Camargo	9 ano B
50	Rebeca Sofia Sales	9 ano B
51	Rodrigo Emanuel Nogueira	1 EM A
52	Sarah Regina Pires	1 EM B
53	Vitor Hugo Barreto	2 EM A
54	Ana Clara Silva	6 ano A
55	Bruno Henrique Santos	6 ano A
56	Carla Mendes Oliveira	6 ano B
57	Daniel Costa Ribeiro	6 ano B
58	Eduarda Lima Martins	7 ano A
59	Felipe Gabriel Souza	7 ano A
60	Gabriela Fernandes Lima	7 ano B
61	Heitor Alves Pereira	7 ano B
62	Isabela Rocha Nascimento	B ano A
63	Jo o Pedro Carvalho	8 ano A
64	Kauan Dias Barbosa	8 ano B
65	Lara Beatriz Castro	8 ano B
66	Lucas Gabriel Ara jo	9 ano A
67	Mariana Cardoso Freitas	9 ano A
68	Nicolas Moreira Machado	9 ano B
69	Olivia Monteiro Ramos	9 ano B
70	Paulo Roberto Teixeira	1 EM A
71	Rafaela Gomes Vieira	1 EM A
72	Samuel Victor Correia	1 EM B
73	Sofia Helena Duarte	1 EM B
74	Thiago Augusto Nunes	2 EM A
75	Valentina Soares Campos	2 EM A
76	Vinicius Eduardo Marques	2 EM B
77	Yasmin Alessandra Lopes	2 EM B
78	Arthur Guilherme Santana	3 EM A
79	Beatriz Vitoria Medeiros	3 EM A
80	Caio Felipe Andrade	3 EM B
81	David Lucca Silveira	3 EM B
82	Emma Carolina Farias	6 ano A
83	Enzo Gabriel Guimaraes	6 ano B
84	Fernanda Luisa Peixoto	6 ano B
85	Gabriel Vinicius Franco	6 ano B
86	Giovanna Maria Aguiar	7 ano A
87	Guilherme Henrique Fonseca	7 ano A
88	Igor Matheus Prado	7 ano B
89	Julia Eduarda Xavier	7 ano B
90	Leonardo Augusto Resende	B ano A
91	Livia Maria Borges	8 ano A
92	Luiz Felipe Monteiro	8 ano B
93	Manuela Vitoria Assis	8 ano B
94	Matheus Henrique Bueno	9 ano A
95	Natalia Cristina Antunes	9 ano A
96	Pedro Henrique Camargo	9 ano B
97	Rebeca Sofia Sales	9 ano B
98	Rodrigo Emanuel Nogueira	1 EM A
99	Sarah Regina Pires	1 EM B
100	Vitor Hugo Barreto	2 EM A
101	Ana Clara Silva	6 ano A
102	Bruno Henrique Santos	6 ano A
103	Carla Mendes Oliveira	6 ano B
104	Daniel Costa Ribeiro	6 ano B
105	Eduarda Lima Martins	7 ano A
106	Felipe Gabriel Souza	7 ano A
107	Gabriela Fernandes Lima	7 ano B
108	Heitor Alves Pereira	7 ano B
109	Isabela Rocha Nascimento	8 ano A
110	Joao Pedro Carvalho	8 ano A
111	Kauan Dias Barbosa	8 ano B
112	Lara Beatriz Castro	8 ano B
113	Lucas Gabriel Araujo	9 ano A
114	Mariana Cardoso Freitas	9 ano A
115	Nicolas Moreira Machado	9 ano B
116	Olivia Monteiro Ramos	9 ano B
117	Paulo Roberto Teixeira	1 EM A
118	Rafaela Gomes Vieira	1 EM A
119	Samuel Victor Correia	1 EM B
120	Sofia Helena Duarte	1 EM B
121	Thiago Augusto Nunes	2 EM A
122	Valentina Soares Campos	2 EM A
123	Vinicius Eduardo Marques	2 EM B
124	Yasmin Alessandra Lopes	2 EM B
125	Arthur Guilherme Santana	3 EM A
126	Beatriz Vitoria Medeiros	3 EM A
127	Caio Felipe Andrade	3 EM B
128	David Lucca Silveira	3 EM B
129	Emma Carolina Farias	6 ano A
130	Enzo Gabriel Guimaraes	6 ano A
131	Fernanda Luisa Peixoto	6 ano B
132	Gabriel Vinicius Franco	6 ano B
133	Giovanna Maria Aguiar	7 ano A
134	Guilherme Henrique Fonseca	7 ano A
135	Igor Matheus Prado	7 ano B
136	Julia Eduarda Xavier	7 ano B
137	Leonardo Augusto Rezende	8 ano A
138	Livia Maria Borges	8 ano A
139	Luiz Felipe Monteiro	8 ano B
140	Manuela Vitoria Assis	8 ano B
141	Matheus Henrique Bueno	9 ano A
142	Natalia Cristina Antunes	9 ano A
143	Pedro Henrique Camargo	9 ano B
144	Rebeca Sofia Sales	9 ano B
145	Rodrigo Emanuel Nogueira	1 EM A
146	Sarah Regina Pires	1 EM B
147	Vitor Hugo Barreto	2 EM A
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id, data, descricao, itens_utilizados) FROM stdin;
1	2026-08-11	Arroz, feijão preto, frango grelhado e salada de alface	\N
2	2026-08-12	Macarronada com molho de tomate e carne moída	\N
3	2026-08-13	Sopa de legumes com carne e torradas	\N
4	2026-08-03	Arroz integral, feij o carioca, peito de frango\n grelhado e salada de alface com tomate.	Arroz Integral, Feij o\n Carioca, Peito de Frango Congelado, Alface Crespa, Tomate,  leo  de\n Soja, Sal Refinado
5	2026-08-04	Macarr o espaguete ao molho bolonhesa e banana de\n sobremesa.	Macarr o Espaguete, Carne Mo da (Patinho), Extrato\n de Tomate, Cebola, Alho Descascado, Banana Prata
6	2026-08-05	Arroz, feij o preto, omelete com queijo e salada de\n repolho.	Arroz Integral, Feij o Preto, Ovos Brancos (D zias),\n Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
7	2026-08-06	Sopa de legumes com frango desfiado e p o de forma\n integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de\n Frango Congelado, P o de Forma Integral, Sal Refinado
8	2026-08-07	Galinhada caipira, salada de beterraba e suco de\n acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho\n Descascado, Beterraba, Polpa de Acerola, A  car Refinado
9	2026-08-10	Arroz, feij o carioca, carne mo da ensopada com\n batata e ma  .	Arroz Integral, Feij o Carioca, Carne Mo da\n (Patinho), Batata Inglesa, Ma  Gala
10	2026-08-11	Macarr o penne integral ao molho de tomate com atum e\n salada.	Macarr o Penne Integral, Atum em Conserva, Extrato de\n Tomate, Alface Crespa, Tomate
11	2026-08-12	Arroz, feij o preto, frango assado ao forno e pur \n de mandioca.	Arroz Integral, Feij o Preto, Peito de Frango\n Congelado, Farinha de Mandioca, Manteiga com Sal
12	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em\n Conserva, Ervilha em Conserva, Suco de Caju Concentrado
13	2026-08-14	Cachorro quente escolar com suco de maracuj  e\n melancia.	P o Franc s (kg), Salsicha para Cachorro Quente,\n Extrato de Tomate, Polpa de Maracuj , Melancia (kg)
14	2026-08-17	Arroz, feij o carioca, iscas de frango acebolado e\n salada de cenoura.	Arroz Integral, Feij o Carioca, Peito de\n Frango Congelado, Cebola, Cenoura fresca
15	2026-08-18	Carne mo da com milho, arroz, feij o e laranja\n pera.	Carne Mo da (Patinho), Milho Verde em Conserva, Arroz\n Integral, Feij o Carioca, Laranja Pera
16	2026-08-19	Sopa de feij o com macarr o e legumes.	Feij o\n Carioca, Macarr o Espaguete, Batata Inglesa, Cenoura fresca,\n Cebola
17	2026-08-20	Arroz, feij o preto, fricass  de frango e salada de\n alface.	Arroz Integral, Feij o Preto, Peito de Frango\n Congelado, Milho Verde em Conserva, Alface Crespa
18	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche\n da manh .	Leite Desnatado (Litros), Aveia em Flocos, Banana\n Prata, Biscoito Maria, A  car Refinado
19	2026-08-24	Arroz integral, feij o, ovos cozidos ao molho e\n salada de tomate.	Arroz Integral, Feij o Carioca, Ovos Brancos\n (D zias), Extrato de Tomate, Tomate
20	2026-09-21	Arroz, feij o preto, peito de frango grelhado e pur de ab bora.	Arroz Integral, Feij o Preto, Peito de Frango Congelado, Ab bora Caboti , Manteiga com Sal
21	2026-09-22	Arroz colorido com legumes, ovos cozidos e salada de tomate.	Arroz Integral, Cenoura fresca, Ervilha em Conserva, Ovos Brancos (D zias), Tomate
22	2026-09-23	Sopa de legumes com carne mo da e torradas de p o franc s.	Batata Inglesa, Cenoura fresca, Chuchu, Carne Mo da (Patinho), P o Franc s (kg)
23	2026-09-24	Macarr o penne integral ao molho su o com frango.	Macarr o Penne Integral, Leite Desnatado (Litros), Peito de Frango Congelado, Queijo Mussarela
24	2026-09-25	Bolo caseiro simples com suco de maracuj no lanche.	Farinha de Trigo, Ovos Brancos (D zias), A car Refinado, Polpa de Maracuj 
25	2026-09-28	Arroz, feij o carioca, carne mo da acebolada e salada de repolho com cenoura.	Arroz Integral, Feij o Carioca, Carne Mo da (Patinho), Cebola, Repolho Verde, Cenoura fresca
26	2026-09-29	Arroz, feij o preto, frango xadrez leve e banana de sobremesa.	Arroz Integral, Feij o Preto, Peito de Frango Congelado, Cebola, Banana Prata
27	2026-09-30	Sopa de canjiquinha com frango desfiado e legumes.	Peito de Frango Congelado, Cenoura fresca, Batata Inglesa, Sal Refinado
28	2026-10-01	Arroz integral, feij o, omelete de queijo e salada de alface.	Arroz Integral, Feij o Carioca, Ovos Brancos (D zias), Queijo Mussarela, Alface Crespa
29	2026-10-02	P o de forma integral com pat de frango e suco de caju.	P o de Forma Integral, Peito de Frango Congelado, Suco de Caju Concentrado
30	2026-10-05	Arroz, feij o preto, iscas de peito de frango e ab bora cozida.	Arroz Integral, Feij o Preto, Peito de Frango Congelado, Ab bora Caboti 
31	2026-10-06	Macarr o espaguete bolonhesa e melancia cortada.	Macarr o Espaguete, Carne Mo da (Patinho), Extrato de Tomate, Melancia (kg)
32	2026-10-07	Arroz, feij o carioca, picadinho de carne com legumes e ma .	Arroz Integral, Feij o Carioca, Carne Mo da (Patinho), Cenoura fresca, Batata Inglesa, Ma Gala
33	2026-08-03	Arroz integral, feijão carioca, peito de frango grelhado e salada de alface com tomate.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Alface Crespa, Tomate, Óleo de Soja, Sal Refinado
34	2026-08-04	Macarrão espaguete ao molho bolonhesa e banana de sobremesa.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Cebola, Alho Descascado, Banana Prata
35	2026-08-05	Arroz, feijão preto, omelete com queijo e salada de repolho.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
36	2026-08-06	Sopa de legumes com frango desfiado e pão de forma integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de Frango Congelado, Pão de Forma Integral, Sal Refinado
37	2026-08-07	Galinhada caipira, salada de beterraba e suco de acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho Descascado, Beterraba, Polpa de Acerola, Açúcar Refinado
38	2026-08-10	Arroz, feijão carioca, carne moída ensopada com batata e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Batata Inglesa, Maçã Gala
39	2026-08-11	Macarrão penne integral ao molho de tomate com atum e salada.	Macarrão Penne Integral, Atum em Conserva, Extrato de Tomate, Alface Crespa, Tomate
40	2026-08-12	Arroz, feijão preto, frango assado ao forno e purê de mandioca.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Farinha de Mandioca, Manteiga com Sal
41	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Suco de Caju Concentrado
42	2026-08-14	Cachorro quente escolar com suco de maracujá e melancia.	Pão Francês (kg), Salsicha para Cachorro Quente, Extrato de Tomate, Polpa de Maracujá, Melancia (kg)
43	2026-08-17	Arroz, feijão carioca, iscas de frango acebolado e salada de cenoura.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Cenoura fresca
44	2026-08-18	Carne moída com milho, arroz, feijão e laranja pera.	Carne Moída (Patinho), Milho Verde em Conserva, Arroz Integral, Feijão Carioca, Laranja Pera
45	2026-08-19	Sopa de feijão com macarrão e legumes.	Feijão Carioca, Macarrão Espaguete, Batata Inglesa, Cenoura fresca, Cebola
46	2026-08-20	Arroz, feijão preto, fricassê de frango e salada de alface.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Milho Verde em Conserva, Alface Crespa
47	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche da manhã.	Leite Desnatado (Litros), Aveia em Flocos, Banana Prata, Biscoito Maria, Açúcar Refinado
48	2026-08-24	Arroz integral, feijão, ovos cozidos ao molho e salada de tomate.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Extrato de Tomate, Tomate
49	2026-08-25	Macarrão ao alho e óleo com frango em cubos e salada de repolho.	Macarrão Espaguete, Alho Descascado, Azeite de Oliva Extra Virgem, Peito de Frango Congelado, Repolho Verde
50	2026-08-26	Escondidinho de carne moída com purê de batata e melão.	Carne Moída (Patinho), Batata Inglesa, Manteiga com Sal, Leite Desnatado (Litros), Melão Amarelo
51	2026-08-27	Arroz, feijão preto, peito de frango grelhado e abóbora refogada.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá, Alho Descascado
52	2026-08-28	Pão com patê de atum, iogurte natural e maçã.	Pão de Forma Integral, Atum em Conserva, Iogurte Natural, Maçã Gala
53	2026-08-31	Arroz, feijão, estrogonofe de frango leve e salada verde.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Extrato de Tomate, Alface Crespa
54	2026-09-01	Sopa de fubá com carne moída e couve refogada.	Farinha de Mandioca, Carne Moída (Patinho), Alho Descascado, Sal Refinado
55	2026-09-02	Arroz, feijão preto, omelete de vegetais e salada de beterraba.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Cenoura fresca, Beterraba
56	2026-09-03	Macarrão penne com molho branco e frango desfiado.	Macarrão Penne Integral, Leite Desnatado (Litros), Farinha de Trigo, Manteiga com Sal, Peito de Frango Congelado
57	2026-09-04	Vitamina de banana com aveia e biscoito cream cracker.	Leite Desnatado (Litros), Banana Prata, Aveia em Flocos, Biscoito Cream Cracker
58	2026-09-08	Arroz, feijão carioca, frango xadrez escolar e salada de pepino.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Tomate
59	2026-09-09	Arroz de forno com legumes, frango e queijo mussarela.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Queijo Mussarela
60	2026-09-10	Sopa de mandioca com carne moída e cheiro verde.	Farinha de Mandioca, Carne Moída (Patinho), Cebola, Alho Descascado
61	2026-09-11	Lanche especial: pão francês com queijo quente e suco de acerola.	Pão Francês (kg), Queijo Mussarela, Manteiga com Sal, Polpa de Acerola, Açúcar Refinado
62	2026-09-14	Arroz, feijão preto, carne moída refogada e salada de chuchu.	Arroz Integral, Feijão Preto, Carne Moída (Patinho), Chuchu, Azeite de Oliva Extra Virgem
63	2026-09-15	Macarrão espaguete ao molho de tomate com sardinha e salada.	Macarrão Espaguete, Sardinha em Conserva, Extrato de Tomate, Alface Crespa
64	2026-09-16	Arroz, feijão, frango ensopado com batata e maçã.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Batata Inglesa, Maçã Gala
65	2026-09-17	Canja de galinha com arroz e legumes cortados em cubos.	Peito de Frango Congelado, Arroz Integral, Cenoura fresca, Batata Inglesa, Cebola
66	2026-09-18	Iogurte natural com banana picada e biscoito maria.	Iogurte Natural, Banana Prata, Biscoito Maria
67	2026-09-21	Arroz, feijão preto, peito de frango grelhado e purê de abóbora.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá, Manteiga com Sal
68	2026-09-22	Arroz colorido com legumes, ovos cozidos e salada de tomate.	Arroz Integral, Cenoura fresca, Ervilha em Conserva, Ovos Brancos (Dúzias), Tomate
69	2026-09-23	Sopa de legumes com carne moída e torradas de pão francês.	Batata Inglesa, Cenoura fresca, Chuchu, Carne Moída (Patinho), Pão Francês (kg)
70	2026-09-24	Macarrão penne integral ao molho sugão com frango.	Macarrão Penne Integral, Leite Desnatado (Litros), Peito de Frango Congelado, Queijo Mussarela
71	2026-09-25	Bolo caseiro simples com suco de maracujá no lanche.	Farinha de Trigo, Ovos Brancos (Dúzias), Açúcar Refinado, Polpa de Maracujá
72	2026-09-28	Arroz, feijão carioca, carne moída acebolada e salada de repolho com cenoura.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Cebola, Repolho Verde, Cenoura fresca
73	2026-09-29	Arroz, feijão preto, frango xadrez leve e banana de sobremesa.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Cebola, Banana Prata
74	2026-09-30	Sopa de canjiquinha com frango desfiado e legumes.	Peito de Frango Congelado, Cenoura fresca, Batata Inglesa, Sal Refinado
75	2026-10-01	Arroz integral, feijão, omelete de queijo e salada de alface.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Queijo Mussarela, Alface Crespa
76	2026-10-02	Pão de forma integral com patê de frango e suco de caju.	Pão de Forma Integral, Peito de Frango Congelado, Suco de Caju Concentrado
77	2026-10-05	Arroz, feijão preto, iscas de peito de frango e abóbora cozida.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Abóbora Cabotiá
78	2026-10-06	Macarrão espaguete bolonhesa e melancia cortada.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Melancia (kg)
79	2026-10-07	Arroz, feijão carioca, picadinho de carne com legumes e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Cenoura fresca, Batata Inglesa, Maçã Gala
\.


--
-- Data for Name: desperdicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desperdicio (id_cardapio, dt_merenda, peso_descartado, item_mais_rejeitado) FROM stdin;
1	2025-06-23 11:00:00	5.20	salada
2	2025-06-24 11:00:00	8.10	macarrao
1	2025-06-25 11:00:00	4.90	\N
3	2025-06-25 11:00:00	4.90	\N
4	2025-06-26 11:00:00	6.30	legumes
5	2025-06-27 11:00:00	3.80	arroz integral
6	2025-06-30 11:00:00	7.50	salada de beterraba
7	2025-07-01 11:00:00	5.10	atum
8	2025-07-02 11:00:00	4.20	pure de mandioca
9	2025-07-03 11:00:00	3.90	ervilha
10	2025-07-04 11:00:00	9.40	salsicha
11	2025-07-07 11:00:00	5.80	salada de cenoura
12	2025-07-08 11:00:00	4.60	carne moida
13	2025-07-09 11:00:00	6.10	sopa de feijao
14	2025-07-10 11:00:00	3.50	fricasse
15	2025-07-11 11:00:00	2.90	mingau de aveia
16	2025-07-14 11:00:00	5.30	ovos cozidos
17	2025-07-15 11:00:00	4.70	repolho verde
18	2025-07-16 11:00:00	3.20	escondidinho
19	2025-07-17 11:00:00	6.80	abobora refogada
20	2025-07-18 11:00:00	2.10	\N
21	2025-07-21 11:00:00	5.50	estrogonofe
22	2025-07-22 11:00:00	6.00	couve refogada
23	2025-07-23 11:00:00	4.30	omelete
24	2025-07-24 11:00:00	5.90	molho branco
25	2025-07-25 11:00:00	3.10	vitamina de banana
26	2025-07-28 11:00:00	4.80	pepino
27	2025-07-29 11:00:00	3.70	arroz de forno
28	2025-07-30 11:00:00	6.40	sopa de mandioca
29	2025-07-31 11:00:00	2.50	\N
30	2025-08-01 11:00:00	5.00	chuchu
31	2025-08-04 11:00:00	4.40	sardinha
32	2025-08-05 11:00:00	5.60	frango ensopado
33	2025-08-06 11:00:00	6.20	canja de galinha
34	2025-08-07 11:00:00	1.80	\N
35	2025-08-08 11:00:00	4.10	pure de abobora
36	2025-08-11 11:00:00	3.60	arroz colorido
37	2025-08-12 11:00:00	5.70	torradas
38	2025-08-13 11:00:00	4.50	macarrao penne
39	2025-08-14 11:00:00	2.80	\N
40	2025-08-15 11:00:00	5.40	salada de repolho
41	2025-08-18 11:00:00	4.00	frango xadrez
42	2025-08-19 11:00:00	6.50	canjiquinha
43	2025-08-20 11:00:00	3.30	omelete de queijo
44	2025-08-21 11:00:00	2.70	\N
45	2025-08-22 11:00:00	4.90	abobora cozida
46	2025-08-25 11:00:00	5.20	macarrao a bolonhesa
47	2025-08-26 11:00:00	3.80	picadinho de carne
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, quantidade, validade, item) FROM stdin;
1	36	2026-06-29	arroz
2	75	2026-06-12	feijao
3	37	2026-06-15	macarrao
4	150	2026-10-15	Arroz Integral
5	121	2026-09-30	Feijão Carioca
6	80	2026-11-05	Feijão Preto
7	95	2026-08-20	Peito de Frango Congelado
8	60	2026-08-15	Carne Moída (Patinho)
9	45	2027-02-10	Óleo de Soja
10	70	2027-05-01	Açúcar Refinado
11	30	2028-01-01	Sal Refinado
12	110	2026-12-18	Macarrão Espaguete
13	50	2026-11-22	Macarrão Penne Integral
14	200	2026-09-10	Leite Desnatado (Litros)
15	65	2026-10-01	Farinha de Trigo
16	40	2026-12-01	Farinha de Mandioca
17	35	2026-11-15	Polpa de Acerola
18	30	2026-11-20	Polpa de Maracujá
19	86	2026-08-05	Banana Prata
20	90	2026-08-10	Maçã Gala
21	120	2026-08-12	Laranja Pera
22	45	2026-08-08	Cenoura Fresca
23	130	2026-08-18	Batata Inglesa
24	55	2026-08-25	Cebola
25	15	2026-09-01	Alho Descascado
26	65	2026-08-06	Tomate
27	25	2026-08-02	Alface Crespa
28	30	2026-08-10	Repolho Verde
29	40	2026-08-28	Ovos Brancos (Dúzia)
30	26	2026-08-30	Queijo Mussarela
31	18	2026-10-10	Manteiga com Sal
32	80	2026-08-22	Iogurte Natural
33	35	2027-01-15	Aveia em Flocos
34	40	2026-07-28	Pão Francês (Kg)
35	30	2026-08-04	Pão de Forma Integral
36	50	2027-03-30	Extrato de Tomate
37	40	2027-06-15	Milho Verde em Conserva
38	35	2027-06-15	Ervilha em Conserva
39	40	2026-09-05	Salsicha para Cachorro Quente
40	60	2026-12-01	Biscoito Cream Cracker
41	55	2026-12-05	Biscoito Maria
42	40	2027-01-20	Suco de Caju Concentrado
43	12	2027-08-10	Azeite de Oliva Extra Virgem
44	35	2026-08-20	Abóbora Cabotiá
45	25	2026-08-08	Chuchu
46	40	2026-08-15	Beterraba
47	75	2026-08-03	Melancia (kg)
48	40	2026-08-07	Melão Amarelo
49	45	2027-10-10	Atum em Conserva
50	50	2027-11-01	Sardinha em Conserva
51	150	2026-10-15	Arroz Integral
52	121	2026-09-30	Feijao Carioca
53	80	2026-11-05	Feijao Preto
54	95	2026-08-20	Peito de Frango Congelado
55	60	2026-08-15	Carne Moida (Patinho)
56	45	2027-02-10	Oleo de Soja
57	70	2027-05-01	Acucar Refinado
58	30	2028-01-01	Sal Refinado
59	110	2026-12-18	Macarrao Espaguete
60	50	2026-11-22	Macarrao Penne Integral
61	200	2026-09-10	Leite Desnatado (Litros)
62	65	2026-10-01	Farinha de Trigo
63	40	2026-12-01	Farinha de Mandioca
64	35	2026-11-15	Polpa de Acerola
65	30	2026-11-20	Polpa de Maracuja
66	86	2026-08-05	Banana Prata
67	90	2026-08-10	Maca Gala
68	120	2026-08-12	Laranja Pera
69	45	2026-08-08	Cenoura fresca
70	130	2026-08-18	Batata Inglesa
71	55	2026-08-25	Cebola
72	15	2026-09-01	Alho Descascado
73	65	2026-08-06	Tomate
74	25	2026-08-02	Alface Crespa
75	30	2026-08-10	Repolho Verde
76	40	2026-08-28	Ovos Brancos (Duzias)
77	26	2026-08-30	Queijo Mussarela
78	18	2026-10-10	Manteiga com Sal
79	80	2026-08-22	Iogurte Natural
80	35	2027-01-15	Aveia em Flocos
81	40	2026-07-28	Pao Frances (kg)
82	30	2026-08-04	Pao de Forma Integral
83	50	2027-03-30	Extrato de Tomate
84	40	2027-06-15	Milho Verde em Conserva
85	35	2027-06-15	Ervilha em Conserva
86	40	2026-09-05	Salsicha para Cachorro Quente
87	60	2026-12-01	Biscoito Cream Cracker
88	55	2026-12-05	Biscoito Maria
89	40	2027-01-20	Suco de Caju Concentrado
90	12	2027-08-10	Azeite de Oliva Extra Virgem
91	35	2026-08-20	Abobora Caboti
92	25	2026-08-08	Chuchu
93	40	2026-08-15	Beterraba
94	75	2026-08-03	Melancia (kg)
95	40	2026-08-07	Melao Amarelo
96	45	2027-10-10	Atum em Conserva
97	50	2027-11-01	Sardinha em Conserva
98	150	2026-10-15	Arroz Integral
99	121	2026-09-30	Feijao Carioca
100	80	2026-11-05	Feijao Preto
101	95	2026-08-20	Peito de Frango Congelado
102	60	2026-08-15	Carne Moida (Patinho)
103	45	2027-02-10	Oleo de Soja
104	70	2027-05-01	Acucar Refinado
105	30	2028-01-01	Sal Refinado
106	110	2026-12-18	Macarrao Espaguete
107	50	2026-11-22	Macarrao Penne Integral
108	200	2026-09-10	Leite Desnatado (Litros)
109	65	2026-10-01	Farinha de Trigo
110	40	2026-12-01	Farinha de Mandioca
111	35	2026-11-15	Polpa de Acerola
112	30	2026-11-20	Polpa de Maracuja
113	86	2026-08-05	Banana Prata
114	90	2026-08-10	Maca Gala
115	120	2026-08-12	Laranja Pera
116	45	2026-08-08	Cenoura fresca
117	130	2026-08-18	Batata Inglesa
118	55	2026-08-25	Cebola
119	15	2026-09-01	Alho Descascado
120	65	2026-08-06	Tomate
121	25	2026-08-02	Alface Crespa
122	30	2026-08-10	Repolho Verde
123	40	2026-08-28	Ovos Brancos (Duzias)
124	26	2026-08-30	Queijo Mussarela
125	18	2026-10-10	Manteiga com Sal
126	80	2026-08-22	Iogurte Natural
127	35	2027-01-15	Aveia em Flocos
128	40	2026-07-28	Pao Frances (kg)
129	30	2026-08-04	Pao de Forma Integral
130	50	2027-03-30	Extrato de Tomate
131	40	2027-06-15	Milho Verde em Conserva
132	35	2027-06-15	Ervilha em Conserva
133	40	2026-09-05	Salsicha para Cachorro Quente
134	60	2026-12-01	Biscoito Cream Cracker
135	55	2026-12-05	Biscoito Maria
136	40	2027-01-20	Suco de Caju Concentrado
137	12	2027-08-10	Azeite de Oliva Extra Virgem
138	35	2026-08-20	Abobora Caboti
139	25	2026-08-08	Chuchu
140	40	2026-08-15	Beterraba
141	75	2026-08-03	Melancia (kg)
142	40	2026-08-07	Melao Amarelo
143	45	2027-10-10	Atum em Conserva
144	50	2027-11-01	Sardinha em Conserva
\.


--
-- Data for Name: item_restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_restricao (id_restricao, id_estoque) FROM stdin;
1	11
1	27
1	28
1	29
2	9
2	10
2	12
2	31
2	32
2	37
2	38
3	26
4	26
4	27
4	36
5	6
5	40
1	1
1	2
1	3
2	4
2	5
3	7
3	8
4	13
4	14
4	15
5	16
5	17
5	18
1	19
1	20
2	21
2	22
3	23
3	24
4	25
4	30
5	33
5	34
1	35
2	39
3	41
4	42
5	43
1	46
2	47
\.


--
-- Data for Name: merenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merenda (id_cardapio, dt_merenda, qtd_produzida) FROM stdin;
1	2025-06-23 11:00:00	120.00
2	2025-06-24 11:00:00	115.50
1	2025-06-25 11:00:00	118.00
4	2025-06-26 11:00:00	122.00
5	2025-06-27 11:00:00	110.00
6	2025-06-30 11:00:00	125.00
7	2025-07-01 11:00:00	117.50
8	2025-07-02 11:00:00	119.00
9	2025-07-03 11:00:00	121.00
10	2025-07-04 11:00:00	130.00
11	2025-07-07 11:00:00	114.00
12	2025-07-08 11:00:00	116.00
13	2025-07-09 11:00:00	108.50
14	2025-07-10 11:00:00	123.00
15	2025-07-11 11:00:00	105.00
16	2025-07-14 11:00:00	118.50
17	2025-07-15 11:00:00	120.00
18	2025-07-16 11:00:00	112.00
19	2025-07-17 11:00:00	119.50
20	2025-07-18 11:00:00	102.00
21	2025-07-21 11:00:00	124.00
22	2025-07-22 11:00:00	110.00
23	2025-07-23 11:00:00	116.50
24	2025-07-24 11:00:00	121.50
25	2025-07-25 11:00:00	106.00
26	2025-07-28 11:00:00	122.50
27	2025-07-29 11:00:00	128.00
28	2025-07-30 11:00:00	111.00
29	2025-07-31 11:00:00	115.00
30	2025-08-01 11:00:00	117.00
31	2025-08-04 11:00:00	119.00
32	2025-08-05 11:00:00	120.50
33	2025-08-06 11:00:00	113.00
34	2025-08-07 11:00:00	104.00
35	2025-08-08 11:00:00	121.00
36	2025-08-11 11:00:00	118.00
37	2025-08-12 11:00:00	109.50
38	2025-08-13 11:00:00	122.00
39	2025-08-14 11:00:00	110.00
40	2025-08-15 11:00:00	116.00
41	2025-08-18 11:00:00	114.50
42	2025-08-19 11:00:00	107.00
43	2025-08-20 11:00:00	123.50
44	2025-08-21 11:00:00	108.00
45	2025-08-22 11:00:00	117.00
46	2025-08-25 11:00:00	125.00
47	2025-08-26 11:00:00	119.00
3	2025-06-25 11:00:00	100.00
\.


--
-- Data for Name: participacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacao (id_aluno, id_cardapio, dt_merenda) FROM stdin;
\.


--
-- Data for Name: restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao (id, descricao) FROM stdin;
1	lactose
2	gluten
3	amendoim
4	ovo
5	leite
6	soja
7	castanhas
8	nozes
9	peixe
10	frutos do mar
11	gergelim
12	milho
13	corantes
14	conservantes
\.


--
-- Data for Name: restricao_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao_aluno (id_aluno, id_restricao) FROM stdin;
1	2
2	3
3	1
1	1
4	4
5	2
6	1
7	5
8	3
9	2
10	4
11	1
12	1
12	3
13	2
14	5
15	4
16	1
17	3
18	2
19	1
20	5
21	2
22	4
23	1
24	3
25	1
25	2
26	5
27	4
28	2
29	1
30	3
31	5
32	2
33	4
34	1
35	3
36	2
37	1
38	5
39	4
40	2
41	1
42	3
43	5
44	2
\.


--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 147, true);


--
-- Name: cardapio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_id_seq', 79, true);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 144, true);


--
-- Name: restricao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restricao_id_seq', 14, true);


--
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id);


--
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: desperdicio pk_desperdicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT pk_desperdicio PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: merenda pk_merenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT pk_merenda PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: participacao pk_participacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT pk_participacao PRIMARY KEY (id_aluno, id_cardapio, dt_merenda);


--
-- Name: restricao_aluno pk_restricao_aluno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT pk_restricao_aluno PRIMARY KEY (id_aluno, id_restricao);


--
-- Name: restricao restricao_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_descricao_key UNIQUE (descricao);


--
-- Name: restricao restricao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_pkey PRIMARY KEY (id);


--
-- Name: idx_desp_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_desp_merenda ON public.desperdicio USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ir_restricao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ir_restricao ON public.item_restricao USING btree (id_restricao);


--
-- Name: idx_part_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_merenda ON public.participacao USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ra_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ra_aluno ON public.restricao_aluno USING btree (id_aluno);


--
-- Name: desperdicio fk_desp_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT fk_desp_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_estoque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_estoque FOREIGN KEY (id_restricao) REFERENCES public.estoque(id) ON DELETE CASCADE;


--
-- Name: merenda fk_merenda_cardapio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT fk_merenda_cardapio FOREIGN KEY (id_cardapio) REFERENCES public.cardapio(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict spcxsDmRqjskNfY8AVdkQ5BuIEbTXzbaY8RfgpWNQdd1b8WDVOThdxqRaOPa55Q

