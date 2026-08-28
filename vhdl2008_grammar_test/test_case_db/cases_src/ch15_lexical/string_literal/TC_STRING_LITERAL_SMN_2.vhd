-- =============================================================
-- Case ID: TC_STRING_LITERAL_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_STRING_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.7
-- Production: string_literal ::= " { graphic_character } "
-- Case Type: Negative
-- Test Focus: String length mismatching the target signal — the string_literal value length is inconsistent with the string type dimension of the port/signal
-- Expected Result: Triggers error
-- Dependencies: None
-- =============================================================
entity str_sem_001 is
  port (
    msg_out : out string(1 to 3)
  );
end entity str_sem_001;

architecture rtl of str_sem_001 is
  constant C_LONG : string(1 to 3) := "TOO_LONG";
begin
  msg_out <= C_LONG;
end architecture rtl;
