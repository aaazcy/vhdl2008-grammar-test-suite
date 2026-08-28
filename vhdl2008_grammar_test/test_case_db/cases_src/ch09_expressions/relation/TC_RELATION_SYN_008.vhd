-- =============================================================
-- Case ID: TC_RELATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: ?< ?<= ?> ?>= matching comparison: 4 matching ordering operators used in a conditional assignment, verifying the full family of VHDL 2008 matching operators
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rel_match_order_ent is
  port(a, b : in std_ulogic_vector(3 downto 0); r : out boolean);
end entity;
architecture rtl of rel_match_order_ent is
  function "?<" (lhs, rhs : std_ulogic_vector) return boolean is
  begin
    return unsigned(lhs) < unsigned(rhs);
  end function;
begin
  r <= a ?< b;
end architecture rtl;
