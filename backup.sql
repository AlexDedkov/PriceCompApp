--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: price_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.price_notifications (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    target_price numeric(10,2) NOT NULL,
    notified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: price_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.price_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: price_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.price_notifications_id_seq OWNED BY public.price_notifications.id;


--
-- Name: product_prices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_prices (
    id integer NOT NULL,
    product_id integer,
    store_name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    link character varying
);


--
-- Name: product_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_prices_id_seq OWNED BY public.product_prices.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    image_url text
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    role character varying DEFAULT 'user'::character varying NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: price_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_notifications ALTER COLUMN id SET DEFAULT nextval('public.price_notifications_id_seq'::regclass);


--
-- Name: product_prices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_prices ALTER COLUMN id SET DEFAULT nextval('public.product_prices_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.favorites (id, user_id, product_id, added_at) FROM stdin;
9	1	1	2024-10-30 12:17:55.542083
\.


--
-- Data for Name: price_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.price_notifications (id, user_id, product_id, target_price, notified, created_at) FROM stdin;
5	1	7	40000.00	t	2024-10-30 12:02:11.358983
6	1	1	50000.00	t	2024-10-30 12:25:01.722323
\.


--
-- Data for Name: product_prices; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product_prices (id, product_id, store_name, price, link) FROM stdin;
1	1	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	67990.00	https://www.citilink.ru/product/processor-intel-core-i9-14900k-lga-1700-oem-cm8071505094017-srn48-1986133/
2	2	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	102990.00	https://www.citilink.ru/product/videokarta-palit-nvidia-geforce-rtx-4070ti-super-rtx4070ti-super-jetst-1997219/
3	3	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	134360.00	https://www.citilink.ru/product/videokarta-palit-nvidia-geforce-rtx-4080-super-rtx4080-super-gamingpro-1997170/
4	4	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	40990.00	https://www.citilink.ru/product/processor-intel-core-i9-12900k-lga-1700-oem-cm8071504549230-srl4h-1779474/
5	5	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	26990.00	https://www.citilink.ru/product/processor-intel-core-i9-11900kf-lga-1200-oem-cm8070804400164-srknf-1783311/
6	6	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	38690.00	https://www.citilink.ru/product/videokarta-asus-nvidia-geforce-rtx-3060-dual-rtx3060-o12g-v2-lhr-12gb-1543629/
7	7	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	37990.00	https://www.citilink.ru/product/videokarta-msi-nvidia-geforce-rtx-4060-rtx-4060-ventus-2x-black-8g-oc-1970001/
8	8	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	32120.00	https://www.citilink.ru/product/videokarta-afox-pci-e-af2060s-8192d6h4-v2-nv-rtx2060super-8gb-256bit-g-2011704/
9	9	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	58990.00	https://www.citilink.ru/product/videokarta-sapphire-amd-radeon-rx-7700xt-11335-03-20g-pure-rx-7700-xt-1978711/
10	10	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	116820.00	https://www.citilink.ru/product/videokarta-sapphire-pci-e-4-0-11323-01-40g-nitro-rx-7900-xt-gaming-oc-1907671/
11	11	╨б╨╕╤В╨╕╨╗╨╕╨╜╨║	81420.00	https://www.citilink.ru/product/videokarta-asus-amd-radeon-rx-7800xt-tuf-rx7800xt-o16g-og-gaming-16gb-2003961/
13	1	╨Ь╨Т╨╕╨┤╨╡╨╛	67899.00	https://www.mvideo.ru/products/processor-intel-core-i9-14900k-s1700-oem-32g-cm8071505094017-s-r-400321815
14	2	DNS	102999.00	https://www.dns-shop.ru/product/c20c3e32a2e5ed20/videokarta-palit-geforce-rtx-4070-ti-super-jetstream-oc-ned47tss19t2-1043j/
15	2	╨Ь╨▓╨╕╨┤╨╡╨╛	102999.00	https://www.mvideo.ru/products/videokarta-palit-rtx-4070-ti-super-jetstream-oc-ned47tss19t2-1043j-400320785
16	3	DNS	135999.00	https://www.dns-shop.ru/product/bb9ba86ba2e6ed20/videokarta-palit-geforce-rtx-4080-super-gamingpro-oc-ned408st19t2-1032a/
17	3	╨Ь╨Т╨╕╨┤╨╡╨╛	127499.00	https://www.mvideo.ru/products/videokarta-palit-nvidia-geforce-rtx-4080-super-gamingpro-16gb-ned408s019t2-1032a-400266481
18	4	DNS	44499.00	https://www.dns-shop.ru/product/b1479f2ffccaed20/processor-intel-core-i9-12900k-oem/
19	5	DNS	24499.00	https://www.dns-shop.ru/product/a4131fbb280ced20/processor-intel-core-i9-11900kf-oem/
20	6	DNS	32799.00	https://www.dns-shop.ru/product/793dce89eb57d763/videokarta-asus-geforce-rtx-3060-dual-oc-edition-lhr-dual-rtx3060-o12g-v2/
21	6	╨Ь╨▓╨╕╨┤╨╡╨╛	38399.00	https://www.mvideo.ru/products/videokarta-asus-dual-geforce-rtx-3060-v2-oc-edition-4244090
22	7	DNS	37999.00	https://www.dns-shop.ru/product/75db5ab00b1bed20/videokarta-msi-geforce-rtx-4060-ventus-2x-black-oc-geforce-rtx-4060-ventus-2x/
23	7	╨Ь╨▓╨╕╨┤╨╡╨╛	40891.00	https://www.mvideo.ru/products/videokarta-msi-rtx4060-ventus-2x-black-8gb-oc-4223691
24	8	╨Ь╨▓╨╕╨┤╨╡╨╛	30094.00	https://www.mvideo.ru/products/videokarta-afox-rtx2060super-8gb-af2060s-8192d6h4-v2-4224549
25	9	DNS	58999.00	https://www.dns-shop.ru/product/d10aaa9d55f0ed20/videokarta-sapphire-amd-radeon-rx-7700-xt-pure-11335-03-20g/
26	9	╨Ь╨▓╨╕╨┤╨╡╨╛	62590.00	https://www.mvideo.ru/products/videokarta-sapphire-radeon-rx7700xt-pure-11335-03-20g-4228709
27	10	DNS	104999.00	https://www.dns-shop.ru/product/410179df7e39ed20/videokarta-sapphire-amd-radeon-rx-7900-xt-nitro-vapor-x-11323-01/
28	11	DNS	69999.00	https://www.dns-shop.ru/product/196d6e4fc0deed20/videokarta-asus-amd-radeon-rx-7800-xt-tuf-gaming-oc-edition-tuf-rx7800xt-o16g-gaming/
29	11	╨Ь╨▓╨╕╨┤╨╡╨╛\n	803331.00	https://www.mvideo.ru/products/videokarta-asus-tuf-rx7800xt-o16g-og-gaming-400363927
12	1	DNS	44499.00	https://www.dns-shop.ru/product/4400b6287237ed20/processor-intel-core-i9-14900k-oem/
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, description, image_url) FROM stdin;
1	╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9 14900K, LGA 1700,  OEM [cm8071505094017 srn48]╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9 14900K, LGA 1700,  OEM [cm8071505094017 srn48]	24-╤П╨┤╨╡╤А╨╜╤Л╨╣ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9-14900K OEM ╨▒╨░╨╖╨╕╤А╤Г╨╡╤В╤Б╤П ╨╜╨░ ╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╨╡ Intel Raptor Lake ╨╕ ╨┐╤А╨╛╨╕╨╖╨▓╨╡╨┤╨╡╨╜ ╨┐╨╛ ╤В╨╡╤Е╨┐╤А╨╛╤Ж╨╡╤Б╤Б╤Г Intel 7. ╨г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨╛ ╤Г╤Б╤В╨░╨╜╨░╨▓╨╗╨╕╨▓╨░╨╡╤В╤Б╤П ╨▓ ╤Б╨╛╨║╨╡╤В LGA 1700. ╨Ь╨╛╨┤╨╡╨╗╤М 14-╨│╨╛ ╨┐╨╛╨║╨╛╨╗╨╡╨╜╨╕╤П ╨┐╤А╨╡╨┤╨╜╨░╨╖╨╜╨░╤З╨╡╨╜╨░ ╨┤╨╗╤П ╤Б╨▒╨╛╤А╨║╨╕ ╨╝╨╛╤Й╨╜╤Л╤Е ╨╕╨│╤А╨╛╨▓╤Л╤Е ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨╛╨▓ ╨╕ ╨▓╤Л╤Б╨╛╨║╨╛╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╤Г╨╜╨╕╨▓╨╡╤А╤Б╨░╨╗╤М╨╜╤Л╤Е ╤Б╨╕╤Б╤В╨╡╨╝╨╜╤Л╤Е ╨▒╨╗╨╛╨║╨╛╨▓. 16 ╤Н╨╜╨╡╤А╨│╨╛╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╤Л╤Е ╤П╨┤╨╡╤А ╨╛╨┐╤В╨╕╨╝╨╕╨╖╨╕╤А╤Г╤О╤В ╤Н╨╜╨╡╤А╨│╨╛╨┐╨╛╤В╤А╨╡╨▒╨╗╨╡╨╜╨╕╨╡ ╨╕ ╤В╨╡╨┐╨╗╨╛╨▓╤Л╨┤╨╡╨╗╨╡╨╜╨╕╨╡ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨░.\n╨С╨░╨╖╨╛╨▓╨░╤П ╤З╨░╤Б╤В╨╛╤В╨░ CPU тАУ 3.2 ╨У╨У╤Ж. ╨г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨╛ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨┤╨╛ 32 ╨┐╨╛╤В╨╛╨║╨╛╨▓. ╨а╨░╨╖╨│╨╛╨╜╨╜╤Л╨╣ ╨┐╨╛╤В╨╡╨╜╤Ж╨╕╨░╨╗ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨░ ╤А╨╡╨░╨╗╨╕╨╖╤Г╨╡╤В ╤Б╨▓╨╛╨▒╨╛╨┤╨╜╤Л╨╣ ╨╝╨╜╨╛╨╢╨╕╤В╨╡╨╗╤М. ╨Ь╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨░╤П ╤З╨░╤Б╤В╨╛╤В╨░ ╨▓ ╤В╤Г╤А╨▒╨╛╤А╨╡╨╢╨╕╨╝╨╡ тАУ 6 ╨У╨У╤Ж. ╨Ю╨┤╨╜╨░ ╨╕╨╖ ╤Б╨╕╨╗╤М╨╜╤Л╤Е ╤Б╤В╨╛╤А╨╛╨╜ ╨╝╨╛╨┤╨╡╨╗╨╕ тАУ ╨╖╨╜╨░╤З╨╕╤В╨╡╨╗╤М╨╜╤Л╨╣ ╨╛╨▒╤К╨╡╨╝ ╨║╤Н╤И-╨┐╨░╨╝╤П╤В╨╕. ╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А ╨╛╤Б╨╜╨░╤Й╨╡╨╜ 32-╨╝╨╡╨│╨░╨▒╨░╨╣╤В╨╜╤Л╨╝ ╨║╤Н╤И╨╡╨╝ L2 ╨╕ 36-╨╝╨╡╨│╨░╨▒╨░╨╣╤В╨╜╤Л╨╝ ╨║╤Н╤И╨╡╨╝ L3. ╨Ъ╤Н╤И-╨┐╨░╨╝╤П╤В╤М ╨▓╨╗╨╕╤П╨╡╤В ╨╜╨░ ╤Б╨║╨╛╤А╨╛╤Б╤В╤М ╨▓╤Л╨┐╨╛╨╗╨╜╨╡╨╜╨╕╤П ╨╗╤О╨▒╤Л╤Е ╨╛╨┐╨╡╤А╨░╤Ж╨╕╨╣.\n╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9-14900K OEM ╨╕╨╝╨╡╨╡╤В ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╨╡ ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╛╨╡ ╤П╨┤╤А╨╛ Intel UHD Graphics 770. ╨б╨╛╨▓╨╝╨╡╤Б╤В╨╕╨╝╨░╤П ╨╛╨┐╨╡╤А╨░╤В╨╕╨▓╨╜╨░╤П ╨┐╨░╨╝╤П╤В╤М тАУ DDR4 ╨╕ DDR5. ╨Ь╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨╛ ╨┤╨╛╨┐╤Г╤Б╤В╨╕╨╝╤Л╨╣ ╨╛╨▒╤К╨╡╨╝ ╨Ю╨Ч╨г тАУ 192 ╨У╨С.\n╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А ╨┐╨╛╤Б╤В╨░╨▓╨╗╤П╨╡╤В╤Б╤П ╨▒╨╡╨╖ ╨║╤Г╨╗╨╡╤А╨░. ╨Т╤Л╨▒╨╛╤А ╤Г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨░ ╨╛╤Е╨╗╨░╨╢╨┤╨╡╨╜╨╕╤П ╨╖╨░╨▓╨╕╤Б╨╕╤В ╨╛╤В ╤В╨╡╨┐╨╗╨╛╨▓╤Л╨┤╨╡╨╗╨╡╨╜╨╕╤П ╤Г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨░. TDP ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨░ тАУ 253 ╨Т╤В. 	https://cdn.citilink.ru/EvfUjZiOALqwHylKFwnpH8TuUPwcsJFVVCh5L4wRvi4/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/1ce52451-5a08-4ad8-af60-9cab2dfc0ba4.jpg
2	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit NVIDIA  GeForce RTX 4070TI Super RTX4070Ti SUPER JETSTREAM OC 16╨У╨С JetStream, GDDR6X, OC,  Ret [ned47tss19t2-1043j]╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit NVIDIA  GeForce RTX 4070TI Super RTX4070Ti SUPER JETSTREAM OC 16╨У╨С JetStream, GDDR6X, OC,  Ret [ned47tss19t2-1043j]	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit GeForce RTX 4070 Ti SUPER JetStream OC [NED47TSS19T2-1043J] ╨╛╤А╨╕╨╡╨╜╤В╨╕╤А╨╛╨▓╨░╨╜╨░ ╨╜╨░ ╨║╨╛╨╝╨┐╨╗╨╡╨║╤В╨░╤Ж╨╕╤О ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╨╕╨│╤А╨╛╨▓╤Л╤Е ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨╛╨▓. ╨С╤Л╤Б╤В╤А╨╛╨┤╨╡╨╣╤Б╤В╨▓╨╕╨╡ ╨▓╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А╨░ ╨┐╨╛╨╖╨▓╨╛╨╗╤П╨╡╤В ╨╕╤Б╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╤М ╨▒╨╛╨╗╤М╤И╨╕╨╜╤Б╤В╨▓╨╛ ╨╕╨│╤А ╨╜╨░ ╨╝╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╤Л╤Е ╨╜╨░╤Б╤В╤А╨╛╨╣╨║╨░╤Е ╨│╤А╨░╤Д╨╕╨║╨╕. ╨Ь╨╛╨┤╨╡╨╗╤М ╨╛╤Б╨╜╨░╤Й╨╡╨╜╨░ ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╕╨╝ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨╛╨╝ GeForce RTX 4070 Ti SUPER ╨╜╨░ ╨▒╨░╨╖╨╡ ╨╝╨╕╨║╤А╨╛╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╤Л NVIDIA Ada Lovelace ╨╕ ╤В╨╡╤Е╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨░ 5 ╨╜╨╝. ╨Х╨│╨╛ ╨┐╨╛╤В╨╡╨╜╤Ж╨╕╨░╨╗ ╤А╨╡╨░╨╗╨╕╨╖╤Г╤О╤В 16 ╨У╨С ╨┐╨░╨╝╤П╤В╨╕ GDDR6X.\n╨Я╨╡╤А╨╡╨│╤А╨╡╨▓ ╨▓╨╕╨┤╨╡╨╛╨║╨░╤А╤В╤Л ╨╕╤Б╨║╨╗╤О╤З╨░╤О╤В 3 ╨╛╤Б╨╡╨▓╤Л╤Е ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░ GALE HUNTER. ╨С╨╗╨░╨│╨╛╨┤╨░╤А╤П ╨░╤Н╤А╨╛╨┤╨╕╨╜╨░╨╝╨╕╤З╨╡╤Б╨║╨╕╨╝ ╨╖╨░╨║╨╛╨╜╤Ж╨╛╨▓╨║╨░╨╝ ╨╗╨╛╨┐╨░╤Б╤В╨╡╨╣ ╨╛╨╜╨╕ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╤О╤В ╨┐╨╛╨▓╤Л╤И╨╡╨╜╨╜╤Г╤О ╨║╨╛╨╜╤Ж╨╡╨╜╤В╤А╨░╤Ж╨╕╤О ╨▓╨╛╨╖╨┤╤Г╤И╨╜╨╛╨│╨╛ ╨┐╨╛╤В╨╛╨║╨░ ╨╕ ╨╝╨╕╨╜╨╕╨╝╨╕╨╖╨╕╤А╤Г╤О╤В ╤И╤Г╨╝. ╨Т╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╤В╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╤О 0 ╨┤╨С: ╨┐╤А╨╕ ╨╝╨╕╨╜╨╕╨╝╨░╨╗╤М╨╜╤Л╤Е ╨╜╨░╨│╤А╤Г╨╖╨║╨░╤Е ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╤Л ╤Б╨╜╨╕╨╢╨░╤О╤В ╤Б╨║╨╛╤А╨╛╤Б╤В╤М ╨┤╨╛ ╨╜╤Г╨╗╤П.\n╨Т ╨▓╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨╡ Palit GeForce RTX 4070 Ti SUPER JetStream OC [NED47TSS19T2-1043J] ╤А╨╡╨░╨╗╨╕╨╖╨╛╨▓╨░╨╜╤Л 66 ╤П╨┤╨╡╤А RT 3-╨│╨╛ ╨┐╨╛╨║╨╛╨╗╨╡╨╜╨╕╤П ╨╕ 264 ╤В╨╡╨╜╨╖╨╛╤А╨╜╤Л╤Е ╤П╨┤╤А╨░ 4-╨│╨╛ ╨┐╨╛╨║╨╛╨╗╨╡╨╜╨╕╤П. ╨Я╨╡╤А╨▓╤Л╨╡ ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╤П╤В ╨░╨┐╨┐╨░╤А╨░╤В╨╜╨╛╨╡ ╤Г╤Б╨║╨╛╤А╨╡╨╜╨╕╨╡ ╤В╤А╨░╤Б╤Б╨╕╤А╨╛╨▓╨║╨╕ ╨╗╤Г╤З╨╡╨╣, ╨░ ╨▓╤В╨╛╤А╤Л╨╡ ╨┐╨╛╨▓╤Л╤И╨░╤О╤В ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╤М ╨┐╤А╨╕ ╨▓╤Л╨┐╨╛╨╗╨╜╨╡╨╜╨╕╨╕ ╨╛╨┐╨╡╤А╨░╤Ж╨╕╨╣ ╤Б ╨╕╤Б╨║╤Г╤Б╤Б╤В╨▓╨╡╨╜╨╜╤Л╨╝ ╨╕╨╜╤В╨╡╨╗╨╗╨╡╨║╤В╨╛╨╝. 8448 ╤Г╨╜╨╕╨▓╨╡╤А╤Б╨░╨╗╤М╨╜╤Л╤Е ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨╛╨▓ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╤О╤В ╨▓╤Л╤Б╨╛╨║╤Г╤О ╤З╨░╤Б╤В╨╛╤В╤Г ╨║╨░╨┤╤А╨╛╨▓. 	https://cdn.citilink.ru/8BdbUYRufmWWAI1soUcuc9HgtkOwMTh5RniyUZL0wY8/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/1c255687-5cd4-463a-86ce-1338bda6d936.jpg
4	╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9 12900K, LGA 1700,  OEM [cm8071504549230 srl4h]╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9 12900K, LGA 1700,  OEM [cm8071504549230 srl4h]	╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9-12900K OEM ╨┐╤А╨╡╨┤╨╜╨░╨╖╨╜╨░╤З╨╡╨╜ ╨┤╨╗╤П ╨╕╨│╤А╨╛╨▓╤Л╤Е ╨╜╨░╤Б╤В╨╛╨╗╤М╨╜╤Л╤Е ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨╛╨▓. ╨Ю╨╜ ╨┐╨╛╤Б╤В╤А╨╛╨╡╨╜ ╨╜╨░ ╨▒╨░╨╖╨╡ ╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╤Л Intel Alder Lake. ╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А ╨╕╨╝╨╡╨╡╤В 16 ╤П╨┤╨╡╤А ╨╕ 24 ╨┐╨╛╤В╨╛╨║╨░, ╤З╤В╨╛ ╨┐╨╛╨╖╨▓╨╛╨╗╤П╨╡╤В ╨▓╤Л╨┐╨╛╨╗╨╜╤П╤В╤М ╨╝╨╜╨╛╨╢╨╡╤Б╤В╨▓╨╛ ╨╖╨░╨┤╨░╤З ╨╛╨┤╨╜╨╛╨▓╤А╨╡╨╝╨╡╨╜╨╜╨╛ ╤Б ╨▓╤Л╤Б╨╛╨║╨╛╨╣ ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╤М╤О.\n╨з╨░╤Б╤В╨╛╤В╨░ ╤А╨░╨▒╨╛╤В╤Л ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨░ ╤Б╨╛╤Б╤В╨░╨▓╨╗╤П╨╡╤В 3.2 ╨У╨У╤Ж, ╨░ ╨▓ ╤А╨╡╨╢╨╕╨╝╨╡ Turbo Boost 3.0 ╨╛╨╜╨░ ╨╝╨╛╨╢╨╡╤В ╨┤╨╛╤Б╤В╨╕╨│╨░╤В╤М 5.2 ╨У╨У╤Ж. ╨г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨╛ ╨╕╨╝╨╡╨╡╤В ╨║╤Н╤И-╨┐╨░╨╝╤П╤В╤М L3 ╨╛╨▒╤К╨╡╨╝╨╛╨╝ 30 ╨Ь╨С, ╤З╤В╨╛ ╨┐╨╛╨╝╨╛╨│╨░╨╡╤В ╤Г╤Б╨║╨╛╤А╨╕╤В╤М ╨╖╨░╨│╤А╤Г╨╖╨║╤Г ╨╕ ╨╛╨▒╤А╨░╨▒╨╛╤В╨║╤Г ╨┤╨░╨╜╨╜╤Л╤Е. ╨в╨░╨║╨╢╨╡ ╨╛╨╜╨╛ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨┤╨▓╤Г╤Е╨║╨░╨╜╨░╨╗╤М╨╜╤Г╤О ╨┐╨░╨╝╤П╤В╤М DDR4 ╤Б ╤В╨░╨║╤В╨╛╨▓╨╛╨╣ ╤З╨░╤Б╤В╨╛╤В╨╛╨╣ ╨┤╨╛ 4.8 ╨У╨У╤Ж ╨╕ ╨╕╨╜╤В╨╡╨│╤А╨╕╤А╨╛╨▓╨░╨╜╨╜╤Г╤О ╨│╤А╨░╤Д╨╕╨║╤Г Intel UHD Graphics 770. ╨Т╤Б╨╡ ╤Н╤В╨╕ ╤Е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕ ╤Б╨╛╨╛╨▒╤Й╨░╤О╤В ╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╨╡╨╗╤О, ╤З╤В╨╛ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9-12900K OEM ╨┐╤А╨╡╨┤╨╗╨░╨│╨░╨╡╤В ╤Г╨╗╤Г╤З╤И╨╡╨╜╨╜╤Л╨╡ ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╨╕ ╨┤╨╗╤П ╨╕╨│╤А, ╨▓╨╕╤А╤В╤Г╨░╨╗╨╕╨╖╨░╤Ж╨╕╨╕, ╨╝╤Г╨╗╤М╤В╨╕╨╝╨╡╨┤╨╕╨░ ╨╕ ╤Б╨╛╨╖╨┤╨░╨╜╨╕╤П ╨║╨╛╨╜╤В╨╡╨╜╤В╨░. 	https://cdn.citilink.ru/p43qKzoBzcnUkTR6NQ0sdcA-geIdNrrxHbU8Q9TPBpM/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/3f6b6642-e692-4e06-a83c-efc9b276baf6.jpg
9	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD  Radeon RX 7700XT 11335-03-20G PURE RX 7700 XT GAMING OC 12╨У╨С PURE, GDDR6, OC,  Ret╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD  Radeon RX 7700XT 11335-03-20G PURE RX 7700 XT GAMING OC 12╨У╨С PURE, GDDR6, OC,  Ret	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD Radeon RX 7700 XT PURE [11335-03-20G] ╤Б ╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╨╛╨╣ AMD RDNA 3 ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╨╡╤В ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╤Л╨╣ ╨┐╨╛╤В╨╡╨╜╤Ж╨╕╨░╨╗ ╨╕ ╨┐╨╗╨░╨▓╨╜╨╛╤Б╤В╤М ╨╛╤В╨╛╨▒╤А╨░╨╢╨╡╨╜╨╕╤П ╨┤╨╕╨╜╨░╨╝╨╕╤З╨╜╨╛╨╣ ╨│╤А╨░╤Д╨╕╨║╨╕ ╨┐╤А╨╕ ╨╛╨▒╤А╨░╨▒╨╛╤В╨║╨╡ ╤В╤А╨╡╨▒╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╤А╨╡╤Б╤Г╤А╤Б╨╛╨▓. ╨Ю╨╜╨░ ╨╛╤А╨╕╨╡╨╜╤В╨╕╤А╨╛╨▓╨░╨╜╨░ ╨╜╨░ ╤А╨░╨▒╨╛╤З╨╕╨╡ ╤Б╤В╨░╨╜╤Ж╨╕╨╕ ╨╕ ╨╕╨│╤А╨╛╨▓╤Л╨╡ ╤Б╨╕╤Б╤В╨╡╨╝╤Л. ╨Т ╤А╨╡╨╢╨╕╨╝╨╡ ╤А╨░╨╖╨│╨╛╨╜╨░ ╤В╨░╨║╤В╨╛╨▓╨░╤П ╤З╨░╤Б╤В╨╛╤В╨░ ╤Б╨┐╨╛╤Б╨╛╨▒╨╜╨░ ╤Г╨▓╨╡╨╗╨╕╤З╨╕╨▓╨░╤В╤М╤Б╤П ╨┤╨╛ ╨┐╨╛╨║╨░╨╖╨░╤В╨╡╨╗╤П 2584 ╨Ь╨У╤Ж. ╨Ф╨╗╤П ╨▓╤Л╨▓╨╛╨┤╨░ ╨╕╨╖╨╛╨▒╤А╨░╨╢╨╡╨╜╨╕╤П ╨╜╨░ ╨╝╨╛╨╜╨╕╤В╨╛╤А ╨┐╤А╨╡╨┤╨╗╨░╨│╨░╤О╤В╤Б╤П ╨┐╨╛ 2 ╤А╨░╨╖╤К╨╡╨╝╨░ HDMI ╨╕ DisplayPort.\n╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD Radeon RX 7700 XT PURE [11335-03-20G] ╨╛╤Д╨╛╤А╨╝╨╗╨╡╨╜╨░ ╨▓ ╨▒╨╡╨╗╨╛╨╝ ╤Ж╨▓╨╡╤В╨╡. ╨б╨╕╤Б╤В╨╡╨╝╨░ ╨╛╤Е╨╗╨░╨╢╨┤╨╡╨╜╨╕╤П Tri-X Cooling ╤Б 3 ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░╨╝╨╕ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨╜╨╕╨╖╨║╤Г╤О ╤В╨╡╨╝╨┐╨╡╤А╨░╤В╤Г╤А╤Г ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╛╨│╨╛ ╨░╨┤╨░╨┐╤В╨╡╤А╨░ ╨┐╤А╨╕ ╤А╨░╨╖╨╜╨╛╨╣ ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╨╛╨╣ ╨╜╨░╨│╤А╤Г╨╖╨║╨╡. ╨Ф╨▓╨╛╨╣╨╜╨╛╨╣ ╨┐╨╛╨┤╤И╨╕╨┐╨╜╨╕╨║ ╤Б╨╜╨╕╨╢╨░╨╡╤В ╤Г╤А╨╛╨▓╨╡╨╜╤М ╤И╤Г╨╝╨░ ╨╕ ╨┐╨╛╨▓╤Л╤И╨░╨╡╤В ╤Б╤В╨░╨▒╨╕╨╗╤М╨╜╨╛╤Б╤В╤М ╨▓╤А╨░╤Й╨╡╨╜╨╕╤П ╨║╤А╤Л╨╗╤М╤З╨░╤В╨║╨╕. ╨Ы╨╛╨│╨╛╤В╨╕╨┐ ╨▓ ╨▓╨╡╤А╤Е╨╜╨╡╨╣ ╤З╨░╤Б╤В╨╕ ╨╛╤Б╨╜╨░╤Й╨╡╨╜ ╤Б╨▓╨╡╤В╨╛╨┤╨╕╨╛╨┤╨░╨╝╨╕ ╤Б ╨║╤А╨░╤Б╨╜╨╛╨╣ ╨┐╨╛╨┤╤Б╨▓╨╡╤В╨║╨╛╨╣. ╨Э╨░ ╤В╤Л╨╗╨╛╨▓╨╛╨╣ ╤Б╤В╨╛╤А╨╛╨╜╨╡ ╤А╨░╤Б╨┐╨╛╨╗╨╛╨╢╨╡╨╜╨░ ╨╝╨╡╤В╨░╨╗╨╗╨╕╤З╨╡╤Б╨║╨░╤П ╨┐╨╗╨░╤Б╤В╨╕╨╜╨░, ╨║╨╛╤В╨╛╤А╨░╤П ╤Б╨╗╤Г╨╢╨╕╤В ╨┤╨╗╤П ╤Г╤Б╨╕╨╗╨╡╨╜╨╕╤П ╨┐╤А╨╛╤З╨╜╨╛╤Б╤В╨╕ ╨║╨╛╨╜╤Б╤В╤А╤Г╨║╤Ж╨╕╨╕. 	https://cdn.citilink.ru/9Lg1W6ZFOeYPlbJsiHzlMMWXIYmyicXkgsIivCpoPKs/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/9f0fe722-6d93-437f-a73a-a2d73b47d829.jpg
3	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit NVIDIA  GeForce RTX 4080 Super RTX4080 SUPER GAMINGPRO OC 16╨У╨С GamingPro, GDDR6X, OC,  Ret [ned408st19t2-1032a]╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit NVIDIA  GeForce RTX 4080 Super RTX4080 SUPER GAMINGPRO OC 16╨У╨С GamingPro, GDDR6X, OC,  Ret [ned408st19t2-1032a]	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit GeForce RTX 4080 SUPER GamingPro OC [NED408ST19T2-1032A] тАУ ╨╛╤Б╨╜╨░╤Й╨╡╨╜╨╕╨╡ ╨┤╨╗╤П ╨▓╤Л╤Б╨╛╨║╨╛╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╨╕╨│╤А╨╛╨▓╤Л╤Е ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨╛╨▓. ╨С╤Л╤Б╤В╤А╨╛╨┤╨╡╨╣╤Б╤В╨▓╨╕╨╡ ╨╝╨╛╨┤╨╡╨╗╨╕ ╨┤╨╛╤Б╤В╨░╤В╨╛╤З╨╜╨╛ ╨┤╨╗╤П ╨╕╤Б╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╨╜╨╕╤П ╨┐╨╛╤З╤В╨╕ ╨╗╤О╨▒╤Л╤Е ╨▓╨╕╨┤╨╡╨╛╨╕╨│╤А ╨╜╨░ ╨╝╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╤Л╤Е ╨╜╨░╤Б╤В╤А╨╛╨╣╨║╨░╤Е ╨│╤А╨░╤Д╨╕╨║╨╕. ╨Т╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А ╨╝╨╛╨╢╨╡╤В ╨▒╤Л╤В╤М ╨▒╨╡╤Б╤И╤Г╨╝╨╜╤Л╨╝: ╨┐╤А╨╕ ╨╝╨╕╨╜╨╕╨╝╨░╨╗╤М╨╜╨╛╨╣ ╨╜╨░╨│╤А╤Г╨╖╨║╨╡ ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╤Л ╤Б╨╜╨╕╨╢╨░╤О╤В ╤Б╨║╨╛╤А╨╛╤Б╤В╤М ╨▓╤А╨░╤Й╨╡╨╜╨╕╤П ╨┤╨╛ ╨╜╤Г╨╗╤П. ╨Ь╨╡╤В╨░╨╗╨╗╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨▒╨╡╨║╨┐╨╗╨╡╨╣╤В ╨╖╨░╤Й╨╕╤Й╨░╨╡╤В ╨┐╨╡╤З╨░╤В╨╜╤Г╤О ╨┐╨╗╨░╤В╤Г ╨╛╤В ╨┤╨╡╤Д╨╛╤А╨╝╨░╤Ж╨╕╨╕.\n╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Palit GeForce RTX 4080 SUPER GamingPro OC [NED408ST19T2-1032A] ╨╛╤Б╨╜╨░╤Й╨╡╨╜╨░ ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╕╨╝ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨╛╨╝ GeForce RTX 4080 SUPER ╨╜╨░ ╨▒╨░╨╖╨╡ ╨╝╨╕╨║╤А╨╛╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╤Л NVIDIA Ada Lovelace ╨╕ ╤В╨╡╤Е╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨░ 5 ╨╜╨╝. ╨Я╨╛╤В╨╡╨╜╤Ж╨╕╨░╨╗ GPU ╤А╨╡╨░╨╗╨╕╨╖╤Г╨╡╤В ╨▓╤Л╤Б╨╛╨║╨╛╤Б╨║╨╛╤А╨╛╤Б╤В╨╜╨░╤П 16-╨│╨╕╨│╨░╨▒╨░╨╣╤В╨╜╨░╤П ╨┐╨░╨╝╤П╤В╤М GDDR6X ╤Б ╨┐╤А╨╛╨┐╤Г╤Б╨║╨╜╨╛╨╣ ╤Б╨┐╨╛╤Б╨╛╨▒╨╜╨╛╤Б╤В╤М╤О 736 ╨У╨С/╤Б ╨╕ ╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛╨╣ ╤З╨░╤Б╤В╨╛╤В╨╛╨╣ 23000 ╨Ь╨У╤Ж. ╨и╤В╨░╤В╨╜╨░╤П ╤З╨░╤Б╤В╨╛╤В╨░ ╨▓╨╕╨┤╨╡╨╛╤З╨╕╨┐╨░ ╤А╨░╨▓╨╜╨░ 2295 ╨Ь╨У╤Ж, ╨░ ╤В╤Г╤А╨▒╨╛╤З╨░╤Б╤В╨╛╤В╨░ тАУ 2610 ╨Ь╨У╤Ж.\n╨Ь╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨╛╨╡ ╤Н╨╜╨╡╤А╨│╨╛╨┐╨╛╤В╤А╨╡╨▒╨╗╨╡╨╜╨╕╨╡ ╨▓╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А╨░ ╤Б╨╛╤Б╤В╨░╨▓╨╗╤П╨╡╤В 320 ╨Т╤В. ╨Т╨░╨╝ ╨┐╨╛╤В╤А╨╡╨▒╤Г╨╡╤В╤Б╤П ╨╕╤Б╤В╨╛╤З╨╜╨╕╨║ ╨┐╨╕╤В╨░╨╜╨╕╤П ╤Б ╨╝╨╛╤Й╨╜╨╛╤Б╤В╤М╤О ╨╛╤В 850 ╨Т╤В. ╨Т╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А ╨╕╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╤В 16 ╨╗╨╕╨╜╨╕╨╣ PCI-E. ╨Ф╨╗╤П ╨┤╨╛╨┐╨╛╨╗╨╜╨╕╤В╨╡╨╗╤М╨╜╨╛╨│╨╛ ╨┐╨╕╤В╨░╨╜╨╕╤П ╤Г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨░ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝ ╤А╨░╨╖╤К╨╡╨╝ 16 pin (12VHPWR). ╨Я╨╡╤А╨╡╤Е╨╛╨┤╨╜╨╕╨║ 16-pin 2x8-pin ╨╡╤Б╤В╤М ╨▓ ╨║╨╛╨╝╨┐╨╗╨╡╨║╤В╨╡. 	https://cdn.citilink.ru/VG5eQej-mpz60uTGGVwvSiXu4WE_ygvmhPbU9qky9m0/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/b631b733-d694-4f7d-96c3-d4e47787828d.jpg
5	╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9 11900KF, LGA 1200,  OEM [cm8070804400164 srknf]╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9 11900KF, LGA 1200,  OEM [cm8070804400164 srknf]	╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9-11900KF ╤Б╤В╨░╨╗ ╨╛╨▒╨╗╨░╨┤╨░╤В╨╡╨╗╨╡╨╝ 8 ╤П╨┤╨╡╤А ╨╕ ╨╛╨▒╤К╨╡╨╝╨╜╨╛╨│╨╛ ╤В╤А╨╡╤Е╤Г╤А╨╛╨▓╨╜╨╡╨▓╨╛╨│╨╛ ╨║╤Н╤И╨░, ╨║╨╛╤В╨╛╤А╤Л╨╣ ╨▓╨╝╨╡╤Б╤В╨╡ ╤Б ╤В╨░╨║╤В╨╛╨▓╨╛╨╣ ╤З╨░╤Б╤В╨╛╤В╨╛╨╣ 3.5 ╨У╨У╤Ж ╨┐╨╛╨╖╨▓╨╛╨╗╨╕╤В ╤Б╨╕╤Б╤В╨╡╨╝╨╡ ╨▒╤Л╤Б╤В╤А╨╛ ╨╖╨░╨┐╤Г╤Б╨║╨░╤В╤М ╤А╨░╨╖╨╗╨╕╤З╨╜╤Л╨╡ ╨┐╤А╨╛╨│╤А╨░╨╝╨╝╤Л ╨╕ ╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛ ╤Б╨┐╤А╨░╨▓╨╗╤П╤В╤М╤Б╤П ╤Б ╨╗╤О╨▒╤Л╨╝╨╕ ╨╖╨░╨┤╨░╤З╨░╨╝╨╕. ╨б╨┐╨╛╤Б╨╛╨▒╨╜╨╛╤Б╤В╤М ╨╛╨┤╨╜╨╛╨▓╤А╨╡╨╝╨╡╨╜╨╜╨╛ ╨╛╨▒╤А╨░╨▒╨░╤В╤Л╨▓╨░╤В╤М ╨┤╨╛ 16 ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╨┐╨╛╤В╨╛╨║╨╛╨▓ ╨▒╤Г╨┤╨╡╤В ╨╛╤Б╨╛╨▒╨╡╨╜╨╜╨╛ ╨░╨║╤В╤Г╨░╨╗╤М╨╜╨░ ╨┤╨╗╤П ╤А╨░╨▒╨╛╤В╤Л ┬л╤В╤П╨╢╨╡╨╗╨╛╨│╨╛┬╗ ╤Б╨╛╤Д╤В╨░. ╨б╨╛╨╖╨┤╨░╨╜╨╜╤Л╨╣ ╨╜╨░ ╨▒╨░╨╖╨╡ ╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╤Л Intel Rocket Lake-S ╤З╨╕╨┐╤Б╨╡╤В ╨╕╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╤В 14-╨╜╨░╨╜╨╛╨╝╨╡╤В╤А╨╛╨▓╤Л╨╣ ╤В╨╡╤Е╨┐╤А╨╛╤Ж╨╡╤Б╤Б, ╨║╨╛╤В╨╛╤А╤Л╨╣ ╤Б╨┐╨╛╤Б╨╛╨▒╤Б╤В╨▓╤Г╨╡╤В ╨╛╨┐╤В╨╕╨╝╨░╨╗╤М╨╜╨╛╨╣ ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╨╕ ╨╕ ╨▓╤Л╤Б╨╛╨║╨╛╨╣ ╤Н╨╜╨╡╤А╨│╨╛╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛╤Б╤В╨╕.\n╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Intel Core i9-11900KF ╨┐╤А╨╡╨┤╤Г╤Б╨╝╨░╤В╤А╨╕╨▓╨░╨╡╤В ╤Б╨▓╨╛╨▒╨╛╨┤╨╜╤Л╨╣ ╨╝╨╜╨╛╨╢╨╕╤В╨╡╨╗╤М, ╨║╨╛╤В╨╛╤А╤Л╨╣ ╨╜╨╡╨╛╨▒╤Е╨╛╨┤╨╕╨╝ ╨┤╨╗╤П ╤А╤Г╤З╨╜╨╛╨│╨╛ ╤А╨░╨╖╨│╨╛╨╜╨░ ╤В╨░╨║╤В╨╛╨▓╨╛╨╣ ╤З╨░╤Б╤В╨╛╤В╤Л ╨╕ ╨┐╨╛╨▓╤Л╤И╨╡╨╜╨╕╤П ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╨╛╨╣ ╨╝╨╛╤Й╨╕ ╤Б╨╕╤Б╤В╨╡╨╝╤Л. ╨б ╨╡╨│╨╛ ╨┐╨╛╨╝╨╛╤Й╤М╤О ╨╝╨╛╨╢╨╜╨╛ ╨▓╤А╤Г╤З╨╜╤Г╤О ╨╜╨░╤Б╤В╤А╨╛╨╕╤В╤М ╤З╨░╤Б╤В╨╛╤В╤Г, ╨┐╤А╨╕ ╤Н╤В╨╛╨╝ ╤З╨░╤Б╤В╨╛╤В╨░ ╤Б╨╕╤Б╤В╨╡╨╝╨╜╨╛╨╣ ╤И╨╕╨╜╤Л ╨╛╤Б╤В╨░╨╜╨╡╤В╤Б╤П ╨╜╨╡╨╕╨╖╨╝╨╡╨╜╨╜╨╛╨╣. ╨Т ╤Б╨▒╨╛╤А╨║╨╡ ╤Б ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╗╨╡╨╜╨╜╤Л╨╝ ╤З╨╕╨┐╤Б╨╡╤В╨╛╨╝ ╨╝╨╛╨╢╨╜╨╛ ╨╕╤Б╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╤М ╨╛╨┐╨╡╤А╨░╤В╨╕╨▓╨╜╤Г╤О ╨┐╨░╨╝╤П╤В╤М DDR4 ╨╛╨▒╤К╨╡╨╝╨╛╨╝ ╨┤╨╛ 128 ╨У╨С. 	https://cdn.citilink.ru/EQ3zNDLcJ3QKaF7XV5zG5lB7_fuqo-3dnCr8YT4AUw8/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/d6b0d8e2-032b-475d-a8f7-69977226c740.jpg
6	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS NVIDIA  GeForce RTX 3060 DUAL-RTX3060-O12G-V2 LHR 12╨У╨С GDDR6, OC,  LHR,  Ret╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS NVIDIA  GeForce RTX 3060 DUAL-RTX3060-O12G-V2 LHR 12╨У╨С GDDR6, OC,  LHR,  Ret	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS GeForce RTX 3060 Dual OC Edition (LHR) ╤Б╤В╨░╨╜╨╡╤В ╨╜╨░╨┤╨╡╨╢╨╜╤Л╨╝ ╤А╨╡╤И╨╡╨╜╨╕╨╡╨╝ ╨┤╨╗╤П ╨│╨╡╨╣╨╝╨╡╤А╤Б╨║╨╛╨│╨╛ ╨Я╨Ъ. ╨Ю╨╜╨░ ╤Б╨╛╤З╨╡╤В╨░╨╡╤В ╨▓ ╤Б╨╡╨▒╨╡ ╨║╨╛╨╝╨┐╨░╨║╤В╨╜╤Л╨╡ ╨│╨░╨▒╨░╤А╨╕╤В╤Л, ╨▓╤Л╤Б╨╛╨║╤Г╤О ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╤Г╤О ╨╝╨╛╤Й╨╜╨╛╤Б╤В╤М ╨╕ ╤Б╤В╨░╨▒╨╕╨╗╤М╨╜╨╛╤Б╤В╤М ╨╛╤В╨▓╨╛╨┤╨░ ╤В╨╡╨┐╨╗╨░ ╨┐╤А╨╕ ╤А╨░╨╖╨╗╨╕╤З╨╜╤Л╤Е ╨╜╨░╨│╤А╤Г╨╖╨║╨░╤Е. ╨У╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А ╤Д╤Г╨╜╨║╤Ж╨╕╨╛╨╜╨╕╤А╤Г╨╡╤В ╤Б ╤З╨░╤Б╤В╨╛╤В╨╛╨╣ 1320 ╨Ь╨У╤Ж ╨╕ ╤Б╨┐╨╛╤Б╨╛╨▒╨╡╨╜ ╤А╨░╨╖╨│╨╛╨╜╤П╤В╤М╤Б╤П ╨┤╨╛ ╨┐╨╛╨║╨░╨╖╨░╤В╨╡╨╗╤П 1867 ╨Ь╨У╤Ж. ╨е╨░╤А╨░╨║╤В╨╡╤А╨╕╤Б╤В╨╕╨║╨╕ ╨░╨┤╨░╨┐╤В╨╡╤А╨░ ╨┤╨╛╨┐╨╛╨╗╨╜╨╡╨╜╤Л 12 ╨У╨С ╨▓╨╕╨┤╨╡╨╛╨┐╨░╨╝╤П╤В╨╕.\n╨Ш╨╖ ╨╕╨╜╤В╨╡╤А╤Д╨╡╨╣╤Б╨╛╨▓ ╨┐╨╛╨┤╨║╨╗╤О╤З╨╡╨╜╨╕╤П ╨▓ ASUS GeForce RTX 3060 Dual OC Edition (LHR) ╨╕╨╝╨╡╤О╤В╤Б╤П 3 ╤А╨░╨╖╤К╨╡╨╝╨░ DisplayPort ╨╕ 1 HDMI. ╨а╨░╨┤╨╕╨░╤В╨╛╤А ╤Б ╨┤╨▓╤Г╨╝╤П ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░╨╝╨╕ ╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛ ╨╛╤Е╨╗╨░╨╢╨┤╨░╨╡╤В ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А, ╨╕╤Б╨║╨╗╤О╤З╨░╤П ╨╡╨│╨╛ ╨┐╨╡╤А╨╡╨│╤А╨╡╨▓. ╨Ю╨┤╨╜╨╛╨╣ ╨╕╨╖ ╨┐╤А╨╕╨╝╨╡╤З╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨╛╤Б╨╛╨▒╨╡╨╜╨╜╨╛╤Б╤В╨╡╨╣ ╨▓╨╕╨┤╨╡╨╛╨║╨░╤А╤В╤Л ╤П╨▓╨╗╤П╨╡╤В╤Б╤П ╤Б╨▓╨╡╤В╨╛╨┤╨╕╨╛╨┤╨╜╨░╤П ╨┐╨╛╨╗╨╛╤Б╨░ ╤Б ╨┐╨░╨╗╨╕╤В╤А╨╛╨╣ RGB. 	https://cdn.citilink.ru/nYv9nSCMsnARi6S97mglxirS3VyfAC2P1GoBzIXmYwM/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/1eef2c3b-69a2-4973-abac-100d3d255b80.jpg
7	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ MSI NVIDIA  GeForce RTX 4060 RTX 4060 VENTUS 2X BLACK 8G OC 8╨У╨С Ventus 2X Black, GDDR6, OC,  Ret╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ MSI NVIDIA  GeForce RTX 4060 RTX 4060 VENTUS 2X BLACK 8G OC 8╨У╨С Ventus 2X Black, GDDR6, OC,  Ret	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ MSI GeForce RTX 4060 VENTUS 2X BLACK OC ╤Б ╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╨╛╨╣ Ada Lovelace ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╨╡╤В ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╤М ╨╕ ╤Б╨║╨╛╤А╨╛╤Б╤В╤М ╨┤╨╗╤П ╨┤╨╛╤Б╤В╨╕╨╢╨╡╨╜╨╕╤П ╤А╨╡╨░╨╗╨╕╤Б╤В╨╕╤З╨╜╨╛╤Б╤В╨╕ ╨│╤А╨░╤Д╨╕╨║╨╕ ╨┐╤А╨╕ ╤А╨╡╨╜╨┤╨╡╤А╨╕╨╜╨│╨╡, ╨╖╨░╨┐╤Г╤Б╨║╨╡ ╨┐╤А╨╛╤Д╨╡╤Б╤Б╨╕╨╛╨╜╨░╨╗╤М╨╜╤Л╤Е ╨┐╤А╨╛╨│╤А╨░╨╝╨╝ ╨╕ ╨╕╨│╤А. ╨Я╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А ╨┐╤А╨╡╨┤╤Г╤Б╨╝╨░╤В╤А╨╕╨▓╨░╨╡╤В ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╤Л╨╣ ╤А╨░╨╖╨│╨╛╨╜ ╨┤╨╛ ╨┐╨╛╨║╨░╨╖╨░╤В╨╡╨╗╤П 2505 ╨Ь╨У╤Ж. ╨в╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╤П ╤В╤А╨░╤Б╤Б╨╕╤А╨╛╨▓╨║╨╕ ╨╗╤Г╤З╨╡╨╣ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╕╨▓╨░╨╡╤В ╨╕╨╝╨╝╨╡╤А╤Б╨╕╨▓╨╜╤Г╤О ╨│╤А╨░╤Д╨╕╨║╤Г ╤Б ╨╜╨░╤Б╤Л╤Й╨╡╨╜╨╜╤Л╨╝ ╨╛╤Б╨▓╨╡╤Й╨╡╨╜╨╕╨╡╨╝ ╨╕ ╨│╨╗╤Г╨▒╨╛╨║╨╕╨╝╨╕ ╨╛╤В╤В╨╡╨╜╨║╨░╨╝╨╕ ╨┤╨╗╤П ╨╝╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨╛╨│╨╛ ╨┐╨╛╨│╤А╤Г╨╢╨╡╨╜╨╕╤П ╨▓ ╨▓╨╕╤А╤В╤Г╨░╨╗╤М╨╜╤Л╨╣ ╨╝╨╕╤А.\n╨Ю╤Е╨╗╨░╨╢╨┤╨░╤О╤Й╨╕╨╣ ╨║╤Г╨╗╨╡╤А ╤Б ╨┤╨▓╤Г╨╝╤П ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░╨╝╨╕ TORX Fan 4.0, ╤В╨╡╨┐╨╗╨╛╨▓╤Л╨╝╨╕ ╤В╤А╤Г╨▒╨║╨░╨╝╨╕ ╨╕ ╤А╨░╨┤╨╕╨░╤В╨╛╤А╨╛╨╝ ╤Б╤В╨░╨▒╨╕╨╗╤М╨╜╨╛ ╨╛╤В╨▓╨╛╨┤╨╕╤В ╤В╨╡╨┐╨╗╨╛. ╨б╨┤╨▓╨╛╨╡╨╜╨╜╤Л╨╡ ╨╗╨╛╨┐╨░╤Б╤В╨╕ ╤Г╨╗╤Г╤З╤И╨░╤О╤В ╤Д╨╛╨║╤Г╤Б╨╕╤А╨╛╨▓╨║╤Г ╨▓╨╛╨╖╨┤╤Г╤И╨╜╨╛╨│╨╛ ╨┐╨╛╤В╨╛╨║╨░ ╨╕ ╨╡╨│╨╛ ╨╛╤В╨▓╨╡╨┤╨╡╨╜╨╕╨╡. ╨в╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╤П Zero Frost ╨╛╨┐╤В╨╕╨╝╨╕╨╖╨╕╤А╤Г╨╡╤В ╨▓╤А╨░╤Й╨╡╨╜╨╕╨╡ ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨╛╨▓ ╨▓ ╨╖╨░╨▓╨╕╤Б╨╕╨╝╨╛╤Б╤В╨╕ ╨╛╤В ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╨╕ ╨╕ ╨╛╤Б╤В╨░╨╜╨░╨▓╨╗╨╕╨▓╨░╨╡╤В ╨╕╤Е ╨┐╤А╨╕ ╨╜╨╕╨╖╨║╨╛╨╣ ╨╜╨░╨│╤А╤Г╨╖╨║╨╡. ╨Я╤А╨╕╨╗╨╛╨╢╨╡╨╜╨╕╨╡ MSI Center ╨┐╨╛╨╖╨▓╨╛╨╗╤П╨╡╤В ╨▓ ╤А╨╡╨╢╨╕╨╝╨╡ ╤А╨╡╨░╨╗╤М╨╜╨╛╨│╨╛ ╨▓╤А╨╡╨╝╨╡╨╜╨╕ ╨╜╨░╤Б╤В╤А╨░╨╕╨▓╨░╤В╤М ╨┐╨░╤А╨░╨╝╨╡╤В╤А╤Л MSI GeForce RTX 4060 VENTUS 2X BLACK OC ╨╕ ╨║╨╛╨╜╤В╤А╨╛╨╗╨╕╤А╨╛╨▓╨░╤В╤М ╤Б╨╛╤Б╤В╨╛╤П╨╜╨╕╨╡ ╤А╨░╨▒╨╛╤В╤Л. 	https://cdn.citilink.ru/_5gunNJTsOco1ebRmcQVyyQvPSlkuI9aCIP7CEMZayY/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/37e252e8-d391-4230-b643-ac7b73bd5f83.jpg
8	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ AFOX NVIDIA  GeForce RTX 2060SUPER AF2060S-8192D6H4-V2 8╨У╨С GDDR6, Ret╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ AFOX NVIDIA  GeForce RTX 2060SUPER AF2060S-8192D6H4-V2 8╨У╨С GDDR6, Ret	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ AFOX NVIDIA GeForce RTX 2060SUPER AF2060S-8192D6H4-V2 ╨┐╨╛╨┤╨║╨╗╤О╤З╨░╨╡╤В╤Б╤П ╨║ ╨╝╨░╤В╨╡╤А╨╕╨╜╤Б╨║╨╛╨╣ ╨┐╨╗╨░╤В╨╡ ╤З╨╡╤А╨╡╨╖ ╨╕╨╜╤В╨╡╤А╤Д╨╡╨╣╤Б PCIe 3.0 ╨╕ ╨╕╨╝╨╡╨╡╤В ┬л╨╜╨░ ╨▒╨╛╤А╤В╤Г┬╗ 8 ╨У╨▒ ╨▓╤Л╨┤╨╡╨╗╨╡╨╜╨╜╨╛╨╣ ╨▓╨╕╨┤╨╡╨╛╨┐╨░╨╝╤П╤В╨╕ GDDR6 ╤Б ╨╖╨░╤П╨▓╨╗╨╡╨╜╨╜╨╛╨╣ ╤З╨░╤Б╤В╨╛╤В╨╛╨╣ 14000 ╨Ь╨У╤Ж, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨╛╨╜╨░ ╨▒╨╡╨╖ ╨┐╤А╨╛╨▒╨╗╨╡╨╝ ╤Б╨┐╤А╨░╨▓╨╕╤В╤Б╤П ╤Б ╨╖╨░╨┐╤Г╤Б╨║╨╛╨╝ ╤Б╨╛╨▓╤А╨╡╨╝╨╡╨╜╨╜╤Л╤Е ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨╜╤Л╤Е ╨╕╨│╤А ╨▓ ╤А╨░╨╖╤А╨╡╤И╨╡╨╜╨╕╨╕ 1080╤А ╨╜╨░ ╨▓╤Л╤Б╨╛╨║╨╕╤Е ╨╜╨░╤Б╤В╤А╨╛╨╣╨║╨░╤Е. ╨в╨░╨║╨╢╨╡ ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨░╨┤╨░╨┐╤В╨╡╤А ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╨╡╤В ╨░╨┐╨┐╨░╤А╨░╤В╨╜╤Г╤О ╤В╤А╨░╤Б╤Б╨╕╤А╨╛╨▓╨║╤Г ╨╗╤Г╤З╨╡╨╣ ╨┤╨╗╤П ╤А╨╡╨░╨╗╨╕╤Б╤В╨╕╤З╨╜╨╛╨│╨╛ ╨╛╤В╨╛╨▒╤А╨░╨╢╨╡╨╜╨╕╤П ╤Б╨▓╨╡╤В╨░ ╨╕ ╤В╨╡╨╜╨╡╨╣ ╨╕ ╨╕╨╜╤В╨╡╨╗╨╗╨╡╨║╤В╤Г╨░╨╗╤М╨╜╤Г╤О ╤В╨╡╤Е╨╜╨╛╨╗╨╛╨│╨╕╤О DLSS, ╨║╨╛╤В╨╛╤А╨░╤П ╤Б ╨┐╨╛╨╝╨╛╤Й╤М╤О ╨╜╨╡╨╣╤А╨╛╤Б╨╡╤В╨╡╨╣ ╨┐╨╛╨▓╤Л╤И╨░╨╡╤В FPS ╨▓ ╤В╤А╨╡╨▒╨╛╨▓╨░╤В╨╡╨╗╤М╨╜╤Л╤Е ╨▓╨╕╨┤╨╡╨╛╨╕╨│╤А╨░╤Е ╨▒╨╡╨╖ ╤Г╤Е╤Г╨┤╤И╨╡╨╜╨╕╤П ╨║╨░╤З╨╡╤Б╤В╨▓╨░ ╨│╤А╨░╤Д╨╕╨║╨╕. ╨Э╨░╨╗╨╕╤З╨╕╨╡ ╨▓╤Л╤З╨╕╤Б╨╗╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╤П╨┤╨╡╤А CUDA ╨┐╨╛╨╖╨▓╨╛╨╗╤П╨╡╤В ╤Г╤Б╨║╨╛╤А╨╕╤В╤М ╤А╨╡╨╜╨┤╨╡╤А╨╕╨╜╨│ ╨▓╨╕╨┤╨╡╨╛ ╨▓ Adobe Premiere ╨╕ ╨┤╤А╤Г╨│╨╕╤Е ╤А╨╡╨┤╨░╨║╤В╨╛╤А╨░╤Е.\n\n╨б╨╕╤Б╤В╨╡╨╝╨░ ╨╛╤Е╨╗╨░╨╢╨┤╨╡╨╜╨╕╤П ╨┐╤А╨╡╨┤╤Б╤В╨░╨▓╨╗╨╡╨╜╨░ ╨┤╨▓╤Г╨╝╤П ╨╛╤Б╨╡╨▓╤Л╨╝╨╕ ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░╨╝╨╕, ╨║╨╛╤В╨╛╤А╤Л╨╡ ╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛ ╤А╨░╤Б╤Б╨╡╨╕╨▓╨░╤О╤В ╤В╨╡╨┐╨╗╨╛, ╨┐╤А╨╡╨┤╨╛╤В╨▓╤А╨░╤Й╨░╤П ╨┐╨╡╤А╨╡╨│╤А╨╡╨▓ ╨║╨╛╨╝╨┐╨╗╨╡╨║╤В╤Г╤О╤Й╨╕╤Е ╨┐╤А╨╕ ╨┤╨╗╨╕╤В╨╡╨╗╤М╨╜╤Л╤Е ╨╜╨░╨│╤А╤Г╨╖╨║╨░╤Е. ╨Ь╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨╛╨╡ ╤Н╨╜╨╡╤А╨│╨╛╨┐╨╛╤В╤А╨╡╨▒╨╗╨╡╨╜╨╕╨╡ ╤Б╨╛╤Б╤В╨░╨▓╨╗╤П╨╡╤В ╨╛╨║╨╛╨╗╨╛ 160 ╨Т╤В, ╨┐╨╛╤Н╤В╨╛╨╝╤Г ╨┤╨╗╤П ╤Б╤В╨░╨▒╨╕╨╗╤М╨╜╨╛╨╣ ╤А╨░╨▒╨╛╤В╤Л ╨▓╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А╨░ ╤В╤А╨╡╨▒╤Г╨╡╤В╤Б╤П ╨▒╨╗╨╛╨║ ╨┐╨╕╤В╨░╨╜╨╕╤П ╨╝╨╛╤Й╨╜╨╛╤Б╤В╤М╤О ╨╜╨╡ ╨╝╨╡╨╜╨╡╨╡ 550 ╨Т╤В.	https://cdn.citilink.ru/mdeEDY2bUxW6qtgPU9FplfIQQYjK2gZGjGwienAHk1U/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/b3d1f817-7646-423f-8a7a-be07e69b1559.jpg
10	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD  Radeon RX 7900XT 11323-01-40G NITRO+ RX 7900 XT GAMING OC VAPOR-X 20╨У╨С GDDR6, OC,  Ret╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD  Radeon RX 7900XT 11323-01-40G NITRO+ RX 7900 XT GAMING OC VAPOR-X 20╨У╨С GDDR6, OC,  Ret	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD Radeon RX 7900 XT NITRO+ Vapor-X [11323-01] ╤А╨░╤Б╤Б╤З╨╕╤В╨░╨╜╨░ ╨╜╨░ ╨╛╤Б╨╜╨░╤Й╨╡╨╜╨╕╨╡ ╨╝╨╛╤Й╨╜╨╛╨│╨╛ ╨╕╨│╤А╨╛╨▓╨╛╨│╨╛ ╨║╨╛╨╝╨┐╤М╤О╤В╨╡╤А╨░. ╨б╨╛╤З╨╡╤В╨░╨╜╨╕╨╡ ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╛╨│╨╛ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨░ Radeon RX 7900 XT ╨╜╨░ ╨▒╨░╨╖╨╡ ╨╝╨╕╨║╤А╨╛╨░╤А╤Е╨╕╤В╨╡╨║╤В╤Г╤А╤Л AMD RDNA 3 ╨╕ 20 ╨У╨С ╨┐╨░╨╝╤П╤В╨╕ GDDR6 ╤Б ╨┐╤А╨╛╨┐╤Г╤Б╨║╨╜╨╛╨╣ ╤Б╨┐╨╛╤Б╨╛╨▒╨╜╨╛╤Б╤В╤М╤О 800 ╨У╨С/╤Б ╨│╨░╤А╨░╨╜╤В╨╕╤А╤Г╨╡╤В ╨▓╨╛╨╖╨╝╨╛╨╢╨╜╨╛╤Б╤В╤М ╨╕╤Б╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╨╜╨╕╤П ╨┐╨╛╤З╤В╨╕ ╨╗╤О╨▒╤Л╤Е ╨▓╨╕╨┤╨╡╨╛╨╕╨│╤А ╨╜╨░ ╨╝╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╤Л╤Е ╨╜╨░╤Б╤В╤А╨╛╨╣╨║╨░╤Е ╨│╤А╨░╤Д╨╕╨║╨╕. ╨и╤В╨░╤В╨╜╨░╤П ╤З╨░╤Б╤В╨╛╤В╨░ GPU ╤А╨░╨▓╨╜╨░ 1500 ╨Ь╨У╤Ж, ╨░ ╤В╤Г╤А╨▒╨╛╤З╨░╤Б╤В╨╛╤В╨░ тАУ 2560 ╨Ь╨У╤Ж. ╨Ю╨▒╨╝╨╡╨╜ ╨┤╨░╨╜╨╜╤Л╨╝╨╕ ╨╝╨╡╨╢╨┤╤Г ╨┐╨░╨╝╤П╤В╤М╤О ╨╕ ╨▓╨╕╨┤╨╡╨╛╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨╛╨╝ ╤Г╤Б╨║╨╛╤А╤П╨╡╤В 80-╨╝╨╡╨│╨░╨▒╨░╨╣╤В╨╜╤Л╨╣ Infinity Cache. 84 ╤П╨┤╤А╨░ RT ╨╕╤Б╨┐╨╛╨╗╤М╨╖╤Г╤О╤В╤Б╤П ╨┐╤А╨╕ ╨░╨┐╨┐╨░╤А╨░╤В╨╜╨╛╨╝ ╤Г╤Б╨║╨╛╤А╨╡╨╜╨╕╨╕ ╤В╤А╨░╤Б╤Б╨╕╤А╨╛╨▓╨║╨╕ ╨╗╤Г╤З╨╡╨╣. 5376 ╤Г╨╜╨╕╨▓╨╡╤А╤Б╨░╨╗╤М╨╜╤Л╤Е ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨╛╨▓ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╤О╤В ╨▓╤Л╤Б╨╛╨║╤Г╤О ╤З╨░╤Б╤В╨╛╤В╤Г ╨║╨░╨┤╤А╨╛╨▓.\n╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ Sapphire AMD Radeon RX 7900 XT NITRO+ Vapor-X [11323-01] ╨╛╤Е╨╗╨░╨╢╨┤╨░╨╡╤В╤Б╤П 3 ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░╨╝╨╕. ╨Ы╨╕╤В╨╛╨╣ ╤А╨░╨┤╨╕╨░╤В╨╛╤А ╨┐╨╛╨║╤А╤Л╨▓╨░╨╡╤В ╨▓╤Б╤О ╨┐╨╡╤З╨░╤В╨╜╤Г╤О ╨┐╨╗╨░╤В╤Г ╨╕ ╨│╨░╤А╨░╨╜╤В╨╕╤А╤Г╨╡╤В ╨▓╤Л╤Б╨╛╨║╤Г╤О ╨╕╨╜╤В╨╡╨╜╤Б╨╕╨▓╨╜╨╛╤Б╤В╤М ╤В╨╡╨┐╨╗╨╛╨╛╤В╨▓╨╛╨┤╨░ ╨╛╤В VRM, ╨┐╨░╨╝╤П╤В╨╕ ╨╕ ╨┤╤А╨╛╤Б╤Б╨╡╨╗╨╡╨╣. ╨Ь╨╡╤В╨░╨╗╨╗╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨▒╤Н╨║╨┐╨╗╨╡╨╣╤В ╨╕╤Б╨║╨╗╤О╤З╨░╨╡╤В ╨┤╨╡╤Д╨╛╤А╨╝╨░╤Ж╨╕╤О ╤Г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨░.\n╨Ф╨╗╨╕╨╜╨░ ╨▓╨╕╨┤╨╡╨╛╨║╨░╤А╤В╤Л 320 ╨╝╨╝ ╤В╤А╨╡╨▒╤Г╨╡╤В ╨╜╨░╨╗╨╕╤З╨╕╤П ╨║╤А╤Г╨┐╨╜╨╛╨│╨╛ ╨║╨╛╤А╨┐╤Г╤Б╨░. ╨Ь╨░╨║╤Б╨╕╨╝╨░╨╗╤М╨╜╨╛╨╡ ╤Н╨╜╨╡╤А╨│╨╛╨┐╨╛╤В╤А╨╡╨▒╨╗╨╡╨╜╨╕╨╡ ╨╝╨╛╨┤╨╡╨╗╨╕ ╤Б╨╛╤Б╤В╨░╨▓╨╗╤П╨╡╤В 368 ╨Т╤В. ╨Т╨░╨╝ ╨┐╨╛╤В╤А╨╡╨▒╤Г╨╡╤В╤Б╤П ╨╕╤Б╤В╨╛╤З╨╜╨╕╨║ ╨┐╨╕╤В╨░╨╜╨╕╤П ╤Б ╨╝╨╛╤Й╨╜╨╛╤Б╤В╤М╤О ╨╛╤В 750 ╨Т╤В. 	https://cdn.citilink.ru/oZwRZeT9mkMgjlRpRXMtI4hZ0aI51lkyc-iHpgDVuB8/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/1532edc3-3aa4-4ac5-b791-588580de215a.jpg
11	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS AMD  Radeon RX 7800XT TUF-RX7800XT-O16G-OG-GAMING 16╨У╨С Gaming, GDDR6, OC,  Ret╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS AMD  Radeon RX 7800XT TUF-RX7800XT-O16G-OG-GAMING 16╨У╨С Gaming, GDDR6, OC,  Ret	╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS AMD Radeon RX 7800 XT TUF GAMING OC Edition [TUF-RX7800XT-O16G GAMING] ╨╛╤А╨╕╨╡╨╜╤В╨╕╤А╨╛╨▓╨░╨╜╨░ ╨╜╨░ ╨╛╤Б╨╜╨░╤Й╨╡╨╜╨╕╨╡ ╨╕╨│╤А╨╛╨▓╤Л╤Е ╨Я╨Ъ. ╨Я╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╤М ╤Г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨░ ╨┐╨╛╨╖╨▓╨╛╨╗╤П╨╡╤В ╨╕╤Б╨┐╨╛╨╗╤М╨╖╨╛╨▓╨░╤В╤М ╨▒╨╛╨╗╤М╤И╨╕╨╜╤Б╤В╨▓╨╛ ╨▓╨╕╨┤╨╡╨╛╨╕╨│╤А ╨╜╨░ ╤Б╤А╨╡╨┤╨╜╨╕╤Е ╨╕╨╗╨╕ ╨▓╤Л╤Б╨╛╨║╨╕╤Е ╨╜╨░╤Б╤В╤А╨╛╨╣╨║╨░╤Е. ╨Ю╤Б╨╜╨╛╨▓╨╜╨╛╨╣ ╨║╨╛╨╜╤Б╤В╤А╤Г╨║╤В╨╕╨▓╨╜╤Л╨╣ ╤Н╨╗╨╡╨╝╨╡╨╜╤В ╨▓╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А╨░ тАУ ╨│╤А╨░╤Д╨╕╤З╨╡╤Б╨║╨╕╨╣ ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А Radeon RX 7800 XT, ╤В╤Г╤А╨▒╨╛╤З╨░╤Б╤В╨╛╤В╨░ ╨║╨╛╤В╨╛╤А╨╛╨│╨╛ ╤А╨░╨▓╨╜╨░ 2565 ╨Ь╨У╤Ж. ╨Т ╨╝╨╛╨┤╨╡╨╗╨╕ ╤А╨╡╨░╨╗╨╕╨╖╨╛╨▓╨░╨╜╤Л 60 ╤П╨┤╨╡╤А RT ╨┤╨╗╤П ╨░╨┐╨┐╨░╤А╨░╤В╨╜╨╛╨│╨╛ ╤Г╤Б╨║╨╛╤А╨╡╨╜╨╕╤П ╤В╤А╨░╤Б╤Б╨╕╤А╨╛╨▓╨║╨╕ ╨╗╤Г╤З╨╡╨╣. 3840 ╤Г╨╜╨╕╨▓╨╡╤А╤Б╨░╨╗╤М╨╜╤Л╤Е ╨┐╤А╨╛╤Ж╨╡╤Б╤Б╨╛╤А╨╛╨▓ ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╤О╤В ╨▓╤Л╤Б╨╛╨║╤Г╤О ╤З╨░╤Б╤В╨╛╤В╤Г ╨║╨░╨┤╤А╨╛╨▓. ╨Я╨╛╤В╨╡╨╜╤Ж╨╕╨░╨╗ ╨▓╨╕╨┤╨╡╨╛╤З╨╕╨┐╨░ ╤А╨╡╨░╨╗╨╕╨╖╤Г╤О╤В 16 ╨У╨С ╨┐╨░╨╝╤П╤В╨╕ GDDR6 ╤Б ╨┐╤А╨╛╨┐╤Г╤Б╨║╨╜╨╛╨╣ ╤Б╨┐╨╛╤Б╨╛╨▒╨╜╨╛╤Б╤В╤М╤О 624 ╨У╨С/╤Б ╨╕ ╤Н╤Д╤Д╨╡╨║╤В╨╕╨▓╨╜╨╛╨╣ ╤З╨░╤Б╤В╨╛╤В╨╛╨╣ 19500 ╨Ь╨У╤Ж. ╨Ю╨▒╨╝╨╡╨╜ ╨┤╨░╨╜╨╜╤Л╨╝╨╕ ╨╝╨╡╨╢╨┤╤Г GPU ╨╕ VRAM ╤Г╤Б╨║╨╛╤А╤П╨╡╤В 64-╨╝╨╡╨│╨░╨▒╨░╨╣╤В╨╜╤Л╨╣ Infinity Cache.\n╨Т╨╕╨┤╨╡╨╛╨║╨░╤А╤В╨░ ASUS AMD Radeon RX 7800 XT TUF GAMING OC Edition [TUF-RX7800XT-O16G GAMING] ╨╛╤Е╨╗╨░╨╢╨┤╨░╨╡╤В╤Б╤П 3 ╨╝╨░╨╗╨╛╤И╤Г╨╝╨╜╤Л╨╝╨╕ ╨▓╨╡╨╜╤В╨╕╨╗╤П╤В╨╛╤А╨░╨╝╨╕ Axial-tech ╤Б ╤Г╨▓╨╡╨╗╨╕╤З╨╡╨╜╨╜╤Л╨╝ ╤Б╤А╨╛╨║╨╛╨╝ ╤Б╨╗╤Г╨╢╨▒╤Л. ╨Я╤А╨╛╨│╤А╨░╨╝╨╝╨╜╨╛╨╡ ╨╛╨▒╨╡╤Б╨┐╨╡╤З╨╡╨╜╨╕╨╡ GPU Tweak III ╨╕╤Б╨┐╨╛╨╗╤М╨╖╤Г╨╡╤В╤Б╤П ╨┤╨╗╤П ╨╜╨░╤Б╤В╤А╨╛╨╣╨║╨╕ ╨┐╤А╨╛╨╕╨╖╨▓╨╛╨┤╨╕╤В╨╡╨╗╤М╨╜╨╛╤Б╤В╨╕, ╤В╨╡╨╝╨┐╨╡╤А╨░╤В╤Г╤А╨╜╨╛╨│╨╛ ╨║╨╛╨╜╤В╤А╨╛╨╗╤П ╨╕ ╤Б╨╕╤Б╤В╨╡╨╝╨╜╨╛╨│╨╛ ╨╝╨╛╨╜╨╕╤В╨╛╤А╨╕╨╜╨│╨░. ╨Т ╨║╨╛╨╝╨┐╨╗╨╡╨║╤В╨░╤Ж╨╕╤О ╨▓╨╕╨┤╨╡╨╛╨░╨┤╨░╨┐╤В╨╡╤А╨░ ╨▓╤Е╨╛╨┤╨╕╤В ╨┐╨╛╨┤╨┤╨╡╤А╨╢╨╕╨▓╨░╤О╤Й╨╕╨╣ ╨║╤А╨╛╨╜╤И╤В╨╡╨╣╨╜. ╨г╤Б╤В╤А╨╛╨╣╤Б╤В╨▓╨╛ ╤Г╨║╤А╨░╤И╨╡╨╜╨╛ ╨┐╨╛╨┤╤Б╨▓╨╡╤В╨║╨╛╨╣. 	https://cdn.citilink.ru/5lyquOnDfZ0F-ZvHF4_yjWFZAQIMqZFLJl6zhboOIDQ/resizing_type:fit/gravity:sm/width:400/height:400/plain/product-images/8b98dd2e-8763-4453-bb05-f3804c54739b.jpg
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, username, password, email, role) FROM stdin;
17	admin	12345	admin@mail.ru	admin
1	Alexander	12345	sasha.dedkov@list.ru	user
\.


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorites_id_seq', 9, true);


--
-- Name: price_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.price_notifications_id_seq', 6, true);


--
-- Name: product_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_prices_id_seq', 29, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: price_notifications price_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_notifications
    ADD CONSTRAINT price_notifications_pkey PRIMARY KEY (id);


--
-- Name: product_prices product_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_prices
    ADD CONSTRAINT product_prices_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: favorites favorites_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: price_notifications price_notifications_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_notifications
    ADD CONSTRAINT price_notifications_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: price_notifications price_notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.price_notifications
    ADD CONSTRAINT price_notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: product_prices product_prices_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_prices
    ADD CONSTRAINT product_prices_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

