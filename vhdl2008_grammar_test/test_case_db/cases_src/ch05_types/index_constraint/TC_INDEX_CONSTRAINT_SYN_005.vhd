-- =============================================================
-- Case ID: TC_INDEX_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_constraint ::= ( discrete_range { , discrete_range } )
-- Case Type: Positive
-- Test Focus: index_constraint with two discrete_ranges for 2D array
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ic_syn_2d is port(dout:out integer); end entity;
architecture rtl of ic_syn_2d is
  type t_matrix is array(integer range <>, integer range <>) of integer;
  subtype t_4x4 is t_matrix(0 to 3, 0 to 3);
  signal s:t_4x4:=(others=>(others=>0));
begin s(0,0)<=1; dout<=s(0,0); end architecture;