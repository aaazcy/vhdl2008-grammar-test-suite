-- =============================================================
-- Case ID: TC_RELATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: matching operator ?/=: matching inequality, verifying the ?/= operator in an if condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity rel_match_ne_ent is
  port(x, y : in std_ulogic_vector(7 downto 0); mismatch : out boolean);
end entity;
architecture rtl of rel_match_ne_ent is
begin
  mismatch <= x ?/= y;
end architecture rtl;
