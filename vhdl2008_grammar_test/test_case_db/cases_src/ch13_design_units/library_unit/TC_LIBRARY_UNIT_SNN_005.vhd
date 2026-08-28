-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Negative
-- Test Focus: invalid library_unit — entity declaration missing the "is" keyword: entity lu_nokw port(a:in bit; y:out bit); — entity_declaration as primary_unit, its complete syntax is "entity identifier is ... end [entity] [identifier];", the missing "is" keyword causes an entity header syntax error
-- Expected Result: Triggers syntax error: missing "is" keyword in entity declaration
-- Dependencies: None
-- =============================================================
entity lu_no_is
  port (
    a : in  bit;
    y : out bit
  );
end entity lu_no_is;

architecture rtl of lu_no_is is
begin
  y <= a;
end architecture rtl;
