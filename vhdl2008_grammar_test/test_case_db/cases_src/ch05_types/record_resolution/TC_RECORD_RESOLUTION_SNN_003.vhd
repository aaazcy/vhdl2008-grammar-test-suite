-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Empty record_resolution: no element resolutions at all.
--   The BNF requires at least one record_element_resolution. An empty
--   list violates the minimum requirement.
-- Expected Result: VHDL syntax error: expected at least one element
-- Dependencies: None
-- =============================================================
entity record_resolution_empty_list is
end entity record_resolution_empty_list;

architecture empty_res_list of record_resolution_empty_list is
  type t_rec is record
    val : integer;
  end record;
  -- ERROR: no element resolutions provided
  subtype t_sub is t_rec();
  signal s : t_sub;
begin
end architecture empty_res_list;
