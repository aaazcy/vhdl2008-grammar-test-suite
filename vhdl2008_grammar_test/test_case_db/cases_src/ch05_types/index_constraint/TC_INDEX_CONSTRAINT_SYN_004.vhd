-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Positive
-- Test Focus: index_constraint single discrete_range on 1D array
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ic_syn_1d is port(dout:out integer); end entity;
architecture rtl of ic_syn_1d is
  type t_vec is array(integer range <>) of integer;
  subtype t_vec8 is t_vec(0 to 7);
  signal s:t_vec8:=(others=>0);
begin s(0)<=42; dout<=s(0); end architecture;