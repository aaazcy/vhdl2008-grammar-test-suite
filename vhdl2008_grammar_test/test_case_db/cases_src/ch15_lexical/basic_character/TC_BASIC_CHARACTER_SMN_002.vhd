-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Negative
-- Test Focus: basic_character string length mismatch — a string of length 10 assigned to a string port of length 5, verify semantic analysis detects the array length constraint conflict
-- Expected Result: Triggers semantic error on string length mismatch
-- Dependencies: None
-- =============================================================
entity bc_string_length_err is
  port (
    bad_val : out string(1 to 5)
  );
end entity bc_string_length_err;

architecture rtl of bc_string_length_err is
  constant C_LONG : string(1 to 5) := "TOO_LONG_STR";
begin
  bad_val <= C_LONG;
end architecture rtl;
