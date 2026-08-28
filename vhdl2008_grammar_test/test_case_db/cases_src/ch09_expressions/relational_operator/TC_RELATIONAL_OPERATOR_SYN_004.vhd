-- =============================================================
-- Case ID: TC_RELATIONAL_OPERATOR_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATIONAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relational_operator ::= = | /= | < | <= | > | >= | ?= | ?/= | ?< | ?<= | ?> | ?>=
-- Case Type: Positive
-- Test Focus: VHDL 2008 matching operators ?= ?/= for matching comparison on std_logic——using ?= to compare std_logic_vector ignoring don't-care bits ('-'), verifying the syntax of matching equality and matching inequality in selected assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity ent_match_eq is
  port (
    pattern_i : in  std_logic_vector(3 downto 0);
    data_i    : in  std_logic_vector(3 downto 0);
    match_o   : out bit
  );
end entity ent_match_eq;

architecture rtl of ent_match_eq is
begin
  match_o <= '1' when data_i ?= pattern_i else '0';
end architecture rtl;
