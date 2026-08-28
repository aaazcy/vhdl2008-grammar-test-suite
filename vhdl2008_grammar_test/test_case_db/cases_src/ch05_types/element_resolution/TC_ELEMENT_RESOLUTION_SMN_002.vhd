-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution | record_resolution
-- Case Type: Negative
-- Test Focus: Static model negative — resolution function resolve_bit takes a scalar bit parameter, but a resolution function for an element subtype must take an unconstrained array parameter of the element type, so no matching resolution function exists
-- Expected Result: Triggers semantic error: no matching resolution function for "resolve_bit"
-- Dependencies: None
-- =============================================================
entity er18_ent is end entity;
architecture rtl of er18_ent is
  function resolve_bit(v : bit) return bit is
  begin
    return v;
  end function;
  subtype resolved_bit is resolve_bit bit;
begin
end architecture;
