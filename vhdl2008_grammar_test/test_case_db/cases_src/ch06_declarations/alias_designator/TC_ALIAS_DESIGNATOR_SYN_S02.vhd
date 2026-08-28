-- =============================================================
-- Case ID: TC_ALIAS_DESIGNATOR_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_designator ::= identifier | character_literal | operator_symbol
-- Case Type: Positive
-- Test Focus: Production-specific: exercises alias_designator with operator_symbol as the designator for an arithmetic alias.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity alias_designator_syn_s2 is
  port (
    a : in  integer;
    b : in  integer;
    s : out integer
  );
end entity alias_designator_syn_s2;

architecture rtl of alias_designator_syn_s2 is
  alias "+" is "+" [integer, integer return integer];
  constant C_ADD_RESULT : integer := 3;
begin
  s <= a + b;
end architecture rtl;
