-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal
--              | operator_symbol
-- Case Type: Negative
-- Test Focus: alias_designator — ERROR: using a VHDL reserved word
--             'signal' as an alias_designator. Reserved words are not
--             valid identifiers, and 'signal' is not a character_literal
--             (would need quotes) nor an operator_symbol (would need
--             double quotes). This violates the BNF.
-- Expected Result: Triggers syntax error (reserved word as identifier)
-- Dependencies: None
-- =============================================================

entity alias_designator_snn1 is
  port (
    a : in  integer;
    b : out integer
  );
end entity alias_designator_snn1;

architecture arch of alias_designator_snn1 is

  type mem_array is array(0 to 15) of integer;
  signal memory : mem_array := (others => 0);

  -- ERROR: 'signal' is a VHDL reserved word and cannot be used as an
  -- alias_designator. The BNF allows:
  --   alias_designator ::= identifier | character_literal | operator_symbol
  -- 'signal' is none of these — it's a reserved keyword.
  alias signal is memory;

begin
  b <= memory(0);
end architecture arch;
