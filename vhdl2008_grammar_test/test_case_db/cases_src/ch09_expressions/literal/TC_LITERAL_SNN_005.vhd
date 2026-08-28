-- =============================================================
-- Case ID: TC_LITERAL_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Case Type: Negative
-- Test Focus: SNN — string_literal length mismatches the target type: assigning the 8-character string_literal "LONGNAME" to a string target of length 4, length mismatch at compile time
-- Expected Result: Triggers error: string literal length mismatch with target
-- Dependencies: None
-- =============================================================
entity lit_snn_005 is
  port (
    x : out string(1 to 4)
  );
end entity lit_snn_005;

architecture length_mismatch of lit_snn_005 is
begin
  -- ERROR: "LONGNAME" has 8 characters, but target string(1 to 4) expects 4
  x <= "LONGNAME";
end architecture length_mismatch;
