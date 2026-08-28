-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: full type declaration: type t_word is array(0 to 15) of bit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_syn_array is port(dout:out integer); end entity;
architecture rtl of td_syn_array is
  type t_word is array(0 to 15) of bit;
  signal s:t_word:=(others=>'0');
begin s(0)<='1'; dout<=0; end architecture;