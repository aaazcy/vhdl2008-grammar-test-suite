-- =============================================================
-- Case ID: TC_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Rule Description: enumeration_literal must be a member of the target enumeration type; assigning an enumeration literal that does not belong to the target type to an enumeration signal is illegal
-- Error Category: type_mismatch_enum_literal
-- Test Focus: SMN — assigning the character literal '2' that does not belong to type bit to a bit type signal: character '2' is not among the enumeration members {'0','1'} of bit
-- Expected Result: Triggers semantic error: literal '2' is not a member of enumerated type bit
-- Dependencies: None
-- =============================================================
entity lit_smn_001 is
  port (
    x : out bit
  );
end entity lit_smn_001;

architecture wrong_enum of lit_smn_001 is
begin
  -- ERROR: character literal '2' is not a member of predefined type bit ('0','1')
  x <= '2';
end architecture wrong_enum;
