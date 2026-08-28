-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal
--              | operator_symbol
-- Case Type: Negative
-- Test Focus: alias_designator — ERROR: using a numeric literal (42)
--             as an alias_designator. The BNF only allows identifier,
--             character_literal (e.g., 'A'), and operator_symbol (e.g., "+").
--             A bare integer literal like 42 matches none of these
--             alternatives.
-- Expected Result: Triggers syntax error (integer literal not valid alias)
-- Dependencies: None
-- =============================================================

entity alias_designator_snn4 is
  port (
    input  : in  bit;
    output : out bit
  );
end entity alias_designator_snn4;

architecture arch of alias_designator_snn4 is

  signal s_val : integer range 0 to 255 := 0;

  -- ERROR: 42 is an integer literal, not a valid alias_designator.
  -- Valid forms: identifier (e.g., my_alias), character_literal (e.g., 'x'),
  -- or operator_symbol (e.g., "+"). A numeric literal is none of these.
  alias 42 is s_val;

begin
  output <= input;
end architecture arch;
