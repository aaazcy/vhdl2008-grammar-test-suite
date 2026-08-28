-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: type declaration of a physical type with units chain
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity td_syn_phys is port(dout:out integer); end entity;
architecture rtl of td_syn_phys is
  type t_len is range 0 to 1000000 units nm; um=1000 nm; mm=1000 um; end units;
  signal s:t_len:=1 mm;
begin s<=10 mm; dout<=0; end architecture;