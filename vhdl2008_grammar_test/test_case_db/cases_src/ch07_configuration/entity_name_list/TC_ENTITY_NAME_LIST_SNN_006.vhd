-- =============================================================
-- Case ID: TC_ENTITY_NAME_LIST_SNN_006
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_name_list ::= entity_designator { , entity_designator } | others | all
-- Case Type: Negative
-- Test Focus: "all" mixed with explicit entity_designator labels -- similar to "others", the "all" reserved-word alternative must appear alone in the entity_name_list; combining "all" with explicit label names like "all, sig_a : signal" is grammatically invalid
-- Expected Result: Triggers syntax error (all mixed with label names)
-- Dependencies: None
-- =============================================================
entity enl_snn6_all_label is
  port(
    din  : in  bit;
    dout : out bit
  );
end entity;

architecture bh of enl_snn6_all_label is
  attribute pin_number : integer;
  signal buf : bit := '0';
  -- ERROR: "all" cannot be combined with explicit entity_designator names
  attribute pin_number of all, buf : signal is 1;
begin
  buf  <= din;
  dout <= buf;
end architecture bh;
