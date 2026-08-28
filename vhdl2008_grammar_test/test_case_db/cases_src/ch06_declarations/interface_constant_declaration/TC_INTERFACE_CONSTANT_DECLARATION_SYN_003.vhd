-- =============================================================
-- Case ID: TC_INTERFACE_CONSTANT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_constant_declaration ::=
--   [ constant ] identifier_list : [ in ] subtype_indication [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Constant generics with ALL optional tokens absent:
--   no "constant" keyword, no "in" mode, no ":=" default.
--   Exercises the minimal syntactic form (bare identifier_list : type_mark).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity const_gen_minimal_form is
  generic (
    WIDTH : integer;
    DEPTH : positive;
    THRESHOLD : natural
  );
  port (
    en     : in  bit;
    din    : in  bit_vector(WIDTH - 1 downto 0);
    addr   : in  bit_vector(15 downto 0);
    match  : out bit
  );
end entity const_gen_minimal_form;

architecture rtl of const_gen_minimal_form is
  constant C_ADDR_LIMIT : bit_vector(15 downto 0) := (others => '1');
  signal s_addr_ok      : bit;
begin
  s_addr_ok <= '1' when addr < C_ADDR_LIMIT else '0';
  match     <= '1' when en = '1' and s_addr_ok = '1' and din = (din'range => '0') else '0';
end architecture rtl;
