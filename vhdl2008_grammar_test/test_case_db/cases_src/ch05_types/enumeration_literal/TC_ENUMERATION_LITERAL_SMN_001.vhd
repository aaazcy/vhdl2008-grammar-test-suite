-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: Static model negative -- duplicate enum literal
--            name in the same enumeration type. An enum literal
--            identifier must be unique within its defining type.
-- Expected Result: Triggers duplicate declaration error
-- Dependencies: None
-- =============================================================
entity enum_lit_smn_duplicate is
  port ( dout : out integer );
end entity enum_lit_smn_duplicate;
architecture rtl of enum_lit_smn_duplicate is
  type t_bad is (A, B, A);  -- ERROR: 'A' declared twice
  signal s : t_bad;
begin
  dout <= 0;
end architecture rtl;
