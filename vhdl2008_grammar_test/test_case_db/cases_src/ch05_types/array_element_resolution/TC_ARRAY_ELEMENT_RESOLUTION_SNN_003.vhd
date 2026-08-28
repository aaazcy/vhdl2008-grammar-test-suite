-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: resolution_indication references an undeclared name.
--            The function name in the resolution_indication must
--            resolve to a visible function declaration.
-- Expected Result: Triggers name resolution error
-- Dependencies: None
-- =============================================================
entity bad_resolution_undefined is
  port (
    x : out bit
  );
end entity bad_resolution_undefined;

architecture rtl of bad_resolution_undefined is
  -- ERROR: "undefined_resolve_func" is not declared
  subtype bad_bit is undefined_resolve_func bit;
  signal s : bad_bit;
begin
  s <= '0';
  x <= s;
end architecture rtl;
