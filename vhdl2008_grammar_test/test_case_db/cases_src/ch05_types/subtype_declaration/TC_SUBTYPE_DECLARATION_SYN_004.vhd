-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: subtype declaration narrowing integer range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sd_syn_int is port(dout:out integer); end entity;
architecture rtl of sd_syn_int is
  subtype t_byte is integer range 0 to 255;
  signal s:t_byte:=0;
begin s<=128; dout<=s; end architecture;