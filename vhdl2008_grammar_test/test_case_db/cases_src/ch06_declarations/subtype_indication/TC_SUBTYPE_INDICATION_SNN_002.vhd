-- =============================================================
-- Case ID: TC_SUBTYPE_INDICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_indication ::= [ resolution_indication ] type_mark [ constraint ]
-- Case Type: Negative
-- Test Focus: subtype_indication: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subtype_indicat_e2 is end entity;
architecture bh of subtype_indicat_e2 is
  -- ERROR: invalid syntax in subtype_indication
  signal s : bit;
begin
  s <= '1'
end architecture bh;