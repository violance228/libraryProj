PGDMP     $    5                 w            epam_project    9.6.9    9.6.9     q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            t           1262    33024    epam_project    DATABASE     ~   CREATE DATABASE epam_project WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_UA.UTF-8' LC_CTYPE = 'ru_UA.UTF-8';
    DROP DATABASE epam_project;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            u           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12393    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            v           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    33037    author_book    TABLE     z   CREATE TABLE public.author_book (
    author_book_author_id integer NOT NULL,
    author_book_book_id integer NOT NULL
);
    DROP TABLE public.author_book;
       public         postgres    false    3            �            1259    33031    authors    TABLE     �   CREATE TABLE public.authors (
    author_id integer NOT NULL,
    author_name character varying(255) NOT NULL,
    author_surname character varying(255) NOT NULL,
    country character varying(255) NOT NULL
);
    DROP TABLE public.authors;
       public         postgres    false    3            �            1259    33034    books    TABLE     �   CREATE TABLE public.books (
    book_id integer NOT NULL,
    book_name character varying(255) NOT NULL,
    size smallint NOT NULL,
    lang character varying(255) NOT NULL,
    is_use character varying(255) NOT NULL
);
    DROP TABLE public.books;
       public         postgres    false    3            �            1259    33028    catalog    TABLE     �   CREATE TABLE public.catalog (
    catalog_id integer NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    user_id integer NOT NULL,
    book_id integer NOT NULL
);
    DROP TABLE public.catalog;
       public         postgres    false    3            �            1259    33025    users    TABLE     �  CREATE TABLE public.users (
    user_id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    user_name character varying(64) NOT NULL,
    user_surname character varying(64) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(13) NOT NULL,
    role character varying(15) DEFAULT 'user'::character varying
);
    DROP TABLE public.users;
       public         postgres    false    3            n          0    33037    author_book 
   TABLE DATA               Q   COPY public.author_book (author_book_author_id, author_book_book_id) FROM stdin;
    public       postgres    false    189   
       l          0    33031    authors 
   TABLE DATA               R   COPY public.authors (author_id, author_name, author_surname, country) FROM stdin;
    public       postgres    false    187   D       m          0    33034    books 
   TABLE DATA               G   COPY public.books (book_id, book_name, size, lang, is_use) FROM stdin;
    public       postgres    false    188   �       k          0    33028    catalog 
   TABLE DATA               S   COPY public.catalog (catalog_id, date_from, date_to, user_id, book_id) FROM stdin;
    public       postgres    false    186   Y       j          0    33025    users 
   TABLE DATA               f   COPY public.users (user_id, login, password, user_name, user_surname, email, phone, role) FROM stdin;
    public       postgres    false    185   �       �           2606    33063    author_book author_book_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT author_book_pkey PRIMARY KEY (author_book_author_id, author_book_book_id);
 F   ALTER TABLE ONLY public.author_book DROP CONSTRAINT author_book_pkey;
       public         postgres    false    189    189    189            �           2606    33058    authors authors_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public         postgres    false    187    187            �           2606    33053    books books_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public         postgres    false    188    188            �           2606    33046    catalog catalog_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (catalog_id);
 >   ALTER TABLE ONLY public.catalog DROP CONSTRAINT catalog_pkey;
       public         postgres    false    186    186            �           2606    33041    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    185    185            �           2606    33115 !   author_book author_book_author_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT author_book_author_id FOREIGN KEY (author_book_book_id) REFERENCES public.books(book_id);
 K   ALTER TABLE ONLY public.author_book DROP CONSTRAINT author_book_author_id;
       public       postgres    false    2030    188    189            �           2606    33120    author_book author_book_book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT author_book_book_id FOREIGN KEY (author_book_author_id) REFERENCES public.authors(author_id);
 I   ALTER TABLE ONLY public.author_book DROP CONSTRAINT author_book_book_id;
       public       postgres    false    2028    189    187            �           2606    33074    catalog book_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.books(book_id) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.catalog DROP CONSTRAINT book_id;
       public       postgres    false    2030    186    188            �           2606    33047    catalog user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.catalog
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.catalog DROP CONSTRAINT user_id;
       public       postgres    false    185    186    2024            n   *   x�3�4�2�4�2�4�2bS 6bCN m�eh $b���� m�      l   �   x�%��
�0����a�zC�
mU�PWn�6��4�s�B��6.�[̟��o��ĝ��
'����'X#g�1(�m)����ڷ���������]Zxz+b-	�x�#�)b� Ύ����@Spq�l����P;&��Z(�~8-7�      m   c   x�M�1
�0 �9yE^ �*>@���0�V�`��W����0�^7���R�P7 �`�=
V�R�����dj�����)ɩl�{	�.�����G��p$d      k   Y   x�M���0��.EqJ����s�V�|�)�p��(�/��"ĺ���]�0b��%z�mW�9~c�78�\̧�7^���p��+ �      j   �   x�e��
�0�ϛW)����
�BO�,��AMlb-�}�)���a�o��D�F�PD��&�V'�@�c;���pe�K��^�<��`,\��7�e�O	-`6�'[�J�e^&z�c2ތ�	�q!u.�*�3	��aF� 8�����PU�y�u]���9/~�8a�7�i9��s]J�~�c[�\�     