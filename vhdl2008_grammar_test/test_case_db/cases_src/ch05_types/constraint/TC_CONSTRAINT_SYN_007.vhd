-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: constraint applied via subtype_indication in signal declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity con_syn_inline is port(dout:out integer); end entity;
architecture rtl of con_syn_inline is
  type t_vec is array(integer range <>) of integer;
  signal s:t_vec(0 to 3):=(0,1,2,3);
begin dout<=s(0)+s(3); end architecture;