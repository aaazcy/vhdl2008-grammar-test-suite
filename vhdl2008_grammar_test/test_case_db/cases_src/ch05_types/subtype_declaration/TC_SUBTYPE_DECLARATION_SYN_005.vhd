-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: subtype declaration of array with index constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sd_syn_arr is port(dout:out integer); end entity;
architecture rtl of sd_syn_arr is
  type t_vec is array(integer range <>) of integer;
  subtype t_vec8 is t_vec(0 to 7);
  signal s:t_vec8:=(others=>0);
begin s(0)<=42; dout<=s(0); end architecture;