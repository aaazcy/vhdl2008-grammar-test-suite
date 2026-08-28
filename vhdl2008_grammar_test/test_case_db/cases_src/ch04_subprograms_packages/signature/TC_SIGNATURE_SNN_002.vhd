-- =============================================================
-- Case ID: TC_SIGNATURE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Negative
-- Test Focus: signature: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity signature_e2 is end entity;
architecture bh of signature_e2 is
  -- ERROR: invalid syntax in signature
  signal s : bit;
begin
  s <= '1'
end architecture bh;