-- =============================================================
-- Case ID: TC_RELATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: matching operator ?=: VHDL 2008 matching equality, used to compare std_ulogic values containing X/Z
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
entity rel_match_eq_ent is
  port(a, b : in std_ulogic_vector(3 downto 0); m : out boolean);
end entity;
architecture rtl of rel_match_eq_ent is
begin
  m <= a ?= b;
end architecture rtl;
