-- =============================================================
-- Case ID: TC_SIGNATURE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Negative
-- Test Focus: signature: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity signature_e3 is end entity;
architecture bh of signature_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;