-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: type declaration of a record type for structured data
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_syn_rec is port(dout:out integer); end entity;
architecture rtl of td_syn_rec is
  type t_coord is record x:integer; y:integer; end record;
  signal s:t_coord:=(x=>0,y=>0);
begin s.x<=10; dout<=s.x+s.y; end architecture;