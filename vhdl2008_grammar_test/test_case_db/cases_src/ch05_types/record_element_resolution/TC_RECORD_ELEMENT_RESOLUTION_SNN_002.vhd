-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SNN_002
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Missing resolution_indication after the element name.
--   The BNF requires the resolution_indication nonterminal; a bare
--   element name with nothing following is invalid.
-- Expected Result: VHDL syntax error: expected resolution_indication
-- Dependencies: None
-- =============================================================
entity rec_elem_res_missing_indication is
end entity rec_elem_res_missing_indication;

architecture missing_indication of rec_elem_res_missing_indication is
  type t_rec is record
    a : integer;
    b : integer;
  end record;
  -- ERROR: "a" has no resolution_indication, "b" is a second element name
  subtype t_sub is t_rec(a, b);
  signal s : t_sub;
begin
end architecture missing_indication;
