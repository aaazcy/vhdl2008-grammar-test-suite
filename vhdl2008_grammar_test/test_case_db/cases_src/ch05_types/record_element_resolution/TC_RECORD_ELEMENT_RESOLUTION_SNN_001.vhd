-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SNN_001
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Test Focus: Uses a keyword "open" where a resolution_indication
--   is expected. The BNF requires either a function name or a
--   parenthesized element_resolution; "open" is neither.
-- Expected Result: VHDL syntax error at "open"
-- Dependencies: None
-- =============================================================
entity rec_elem_res_invalid_indication is
end entity rec_elem_res_invalid_indication;

architecture bad_indication of rec_elem_res_invalid_indication is
  type t_rec is record
    val : integer;
  end record;
  -- ERROR: "open" is not a valid resolution_indication
  subtype t_sub is t_rec(val open);
  signal s : t_sub;
begin
end architecture bad_indication;
