-- =============================================================
-- Case ID: TC_SUBTYPE_INDICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_indication ::= [ resolution_indication ] type_mark [ constraint ]
-- Case Type: Negative
-- Test Focus: subtype_indication: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subtype_indicat_e3 is end entity;
architecture bh of subtype_indicat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;