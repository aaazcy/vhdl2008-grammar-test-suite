-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Negative
-- Test Focus: element_resolution requires either array_element_resolution
--            or record_resolution. Using an undeclared identifier that
--            is neither a resolution function nor a valid alternative
--            is a syntax error.
-- Expected Result: Triggers name resolution error
-- Dependencies: None
-- =============================================================
entity bad_element_resolution_unknown is
  port (
    z : out integer
  );
end entity bad_element_resolution_unknown;

architecture rtl of bad_element_resolution_unknown is
  -- ERROR: "not_a_thing" is not declared, not a valid resolution_indication
  subtype bad_elem is not_a_thing integer;
  signal s : bad_elem;
begin
  s <= 0;
  z <= s;
end architecture rtl;
