-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Negative
-- Test Focus: Static model negative: resolution function pairwise returns integer while the resolved element subtype is bit — the resolution function return type must match the element subtype it resolves, so no matching resolution function exists
-- Expected Result: Triggers semantic error: no matching resolution function for "pairwise"
-- Dependencies: None
-- =============================================================
entity aer_ent is port(a : in bit; q : out bit); end entity;
architecture rtl of aer_ent is
  function pairwise (vals : bit_vector) return integer is
  begin
    return 0;
  end function;
  subtype rb is pairwise bit;
  signal s : rb;
begin
  s <= a;
  q <= s;
end architecture;
